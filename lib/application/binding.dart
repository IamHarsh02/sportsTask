import 'package:get/get.dart';
import 'package:sportstasks/application/controller.dart';
import 'package:sportstasks/infrastructure/home_repository.dart';

class HomeConfigBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    // Get.put(NewsController(Get.find()));
    Get.put(HomeController(HomeServiceRepository()));
  }
}
