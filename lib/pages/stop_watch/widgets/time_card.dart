import 'package:flutter/material.dart';

import 'package:stopwatch/constants/pallete.dart';
import 'package:sizer/sizer.dart';
import 'package:stopwatch/constants/textStyles_constants.dart';

class timeCard extends StatelessWidget {
  timeCard({super.key, required this.time, required this.header});

  final String time;
  final String header;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 30.w,
          height: 15.h,
          padding: EdgeInsets.all(6.sp),
          decoration: BoxDecoration(
              color: Pallete.greenAccent,
              borderRadius: BorderRadius.circular(10.sp)),
          child: Center(
            child: Text(
              time,
              style: DesignTextStyles.s18B(color: Pallete.backGround),
            ),
          ),
        ),
        SizedBox(
          height: 2.h,
        ),
        Text(
          header,
          style: DesignTextStyles.s14B(color: Pallete.pink),
        )
      ],
    );
  }
}
