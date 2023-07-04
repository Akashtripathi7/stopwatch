import 'package:get/get.dart';
import 'package:stopwatch/pages/dashboard/dashboard.dart';

class LandingConroller extends GetxController {
  @override
  onInit() async {
    super.onInit();
    Future.delayed(
        const Duration(
          seconds: 3,
        ), () async {
      Get.to(Dashboard());
    });
  }
}
