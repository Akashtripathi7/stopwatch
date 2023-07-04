import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:stopwatch/constants/pallete.dart';
import 'package:sizer/sizer.dart';
import 'package:stopwatch/pages/landing/landing.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => GetMaterialApp(
        useInheritedMediaQuery: true,
        theme: ThemeData(
          fontFamily: 'Gilroy',
          primaryColor: Pallete.primary,
          iconTheme: const IconThemeData(color: Pallete.primary),
        ),
        color: Pallete.primary,
        debugShowCheckedModeBanner: false,
        home: Landing(),
      ),
    );
  }
}
