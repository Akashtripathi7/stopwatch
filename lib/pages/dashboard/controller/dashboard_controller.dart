import 'dart:async';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  late Timer timer;
  final bottomNavIndex = 0.obs;
  @override
  void onInit() {
    super.onInit();

    bottomNavIndex.value = 0;
  }
}
