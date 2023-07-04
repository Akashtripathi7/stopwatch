import 'package:flutter/material.dart';
import 'package:stopwatch/constants/pallete.dart';
import 'package:stopwatch/constants/textStyles_constants.dart';
import 'dart:async';

import 'package:stopwatch/shared/widgets/alertbox.dart';
import 'package:sizer/sizer.dart';
import 'package:stopwatch/shared/widgets/custom_button.dart';

class CountDown extends StatefulWidget {
  const CountDown({super.key});

  @override
  _CountDownState createState() => _CountDownState();
}

class _CountDownState extends State<CountDown> {
  late TextEditingController _controller;
  late Duration remainingTime;
  late Timer _timer;
  late bool isRunning;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    remainingTime = Duration();
    isRunning = false;
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer.cancel();
    super.dispose();
  }

  void startCountdown() {
    int timeInSeconds = int.parse(_controller.text);
    setState(() {
      remainingTime = Duration(seconds: timeInSeconds);
      isRunning = true;
    });

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (remainingTime.inSeconds > 0) {
          remainingTime -= const Duration(seconds: 1);
        } else {
          timer.cancel();
          showEndPopup();
          setState(() {
            isRunning = false;
            _controller.clear();
          });
        }
      });
    });
  }

  void showEndPopup() {
    showDialog(
        context: context,
        builder: (context) => AlertBox(title: "Countdown ended"));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Enter Time in Seconds:',
              style: DesignTextStyles.s16M(color: Pallete.blackText)),
          SizedBox(height: 2.h),
          TextField(
            controller: _controller,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            style: DesignTextStyles.s14SB(color: Pallete.blackText),
            decoration: InputDecoration(
              hintText: 'Enter time in seconds',
              hintStyle: const TextStyle(color: Pallete.greyText),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Pallete.greyText),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Pallete.primary),
              ),
            ),
          ),
          SizedBox(height: 3.h),
          CustomButton(
            onPressed: isRunning ? null : startCountdown,
            text: "Start Countdown",
          ),
          SizedBox(height: 3.h),
          Text(
            'Remaining Time: ${remainingTime.inSeconds}',
            style: DesignTextStyles.s14B(color: Pallete.pink),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
