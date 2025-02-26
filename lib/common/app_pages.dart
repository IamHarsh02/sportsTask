import 'package:get/get.dart';
import 'package:sportstasks/common/constant.dart';
import 'package:sportstasks/presentation/second_screen.dart';
import 'package:sportstasks/presentation/summary_page.dart';

class Appages {
  static final all = [
    GetPage(name: Constant.summary, page: () => SummaryPage()),
    GetPage(name: Constant.secound_page, page: () => SecondScreen()),
  ];
}
