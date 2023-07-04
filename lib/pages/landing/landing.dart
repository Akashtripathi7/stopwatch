import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:stopwatch/constants/pallete.dart';
import 'package:stopwatch/constants/textStyles_constants.dart';
import 'package:stopwatch/pages/landing/controller/landing_controller.dart';

class Landing extends StatelessWidget {
  LandingConroller c = Get.put(LandingConroller());

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Pallete.backGround,
        body: Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
            Center(
              child: Image.asset(
                'assets/stopwatch.png',
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            Text(
              "Timer Application",
              style: DesignTextStyles.s18B(color: Pallete.blackText),
            )
          ],
        ));
  }
}
