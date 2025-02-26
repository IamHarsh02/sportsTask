import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sportstasks/domain/home_data.dart';
import 'package:sportstasks/infrastructure/home_repository.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  HomeServiceRepository? repository;
  HomeController(this.repository);
  bool isLoading = false;
  bool isError = false;
  HomeData? dataModal;
  HomeData? dataModal2;
  TabController? tabController;
  // NewsModal dataModal = NewsModal();
  @override
  void onInit() {
    fetchHomeData();
    // tabController = TabController(length: 0, vsync: this);

    super.onInit();
  }

  @override
  void onClose() {}

  fetchHomeData() async {
    isLoading = true;
    update();
    var result = await repository?.fetchHomeData();
    result?.fold((l) {
      isError = true;
      print(l);
    }, (r) {
      isLoading = false;
      dataModal = r;
      tabController =
          TabController(length: dataModal!.innings!.length, vsync: this);
      update();
    });
  }

  fetchSecondScreenData() async {
    isLoading = true;
    update();
    var result = await repository?.fetchSecondData();
    result?.fold((l) {
      isError = true;
      print(l);
    }, (r) {
      isLoading = false;
      dataModal2 = r;
      update();
    });
  }
}
