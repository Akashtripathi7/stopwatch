import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:stopwatch/constants/pallete.dart';
import 'package:stopwatch/constants/textStyles_constants.dart';
import 'package:stopwatch/pages/stop_watch/widgets/time_card.dart';
import 'package:stopwatch/shared/widgets/custom_button.dart';

class StopWatchPage extends StatefulWidget {
  const StopWatchPage({super.key});

  @override
  State<StopWatchPage> createState() => _StopWatchPageState();
}

class _StopWatchPageState extends State<StopWatchPage> {
  Duration duration = Duration();
  Timer? timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // startTimer();
    reset();
  }

  void startTimer({bool resets = true}) {
    if (resets) {
      reset();
    }
    timer = Timer.periodic(Duration(seconds: 1), (_) => addTime());
  }

  void addTime() {
    final addSeconds = 1;

    setState(() {
      final seconds = duration.inSeconds + addSeconds;

      duration = Duration(seconds: seconds);
    });
  }

  void reset() {
    setState(() {
      duration = Duration();
    });
  }

  void stopTimer({bool resets = true}) {
    if (resets) {
      reset();
    }
    setState(() {
      timer?.cancel();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: buildTime(),
    );
  }

  Widget buildTime() {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            timeCard(time: hours, header: "HOURS"),
            SizedBox(
              width: 2.w,
            ),
            timeCard(time: minutes, header: "MINUTES"),
            SizedBox(
              width: 2.w,
            ),
            timeCard(time: seconds, header: "SECONDS"),
          ]),
          SizedBox(
            height: 2.h,
          ),
          buttons()
        ],
      ),
    );
  }

  Widget buttons() {
    final isCompleted = duration.inSeconds == 0;
    final isRunning = timer == null ? false : timer!.isActive;
    return isRunning || !isCompleted
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: CustomButton(
                  onPressed: () {
                    if (isRunning) {
                      stopTimer(resets: false);
                    } else {
                      startTimer(resets: false);
                    }
                  },
                  text: isRunning ? "STOP" : "RESUME",
                  bgColor: Pallete.primary,
                  textColor: Pallete.backGround,
                ),
              ),
              SizedBox(
                width: 4.w,
              ),
              Expanded(
                child: CustomButton(
                  onPressed: stopTimer,
                  text: "CANCEL",
                  bgColor: Pallete.primary,
                  textColor: Pallete.backGround,
                ),
              )
            ],
          )
        : CustomButton(
            onPressed: () {
              startTimer();
            },
            text: "Start Timer",
            bgColor: Pallete.primary,
            textColor: Pallete.backGround,
          );
  }
}
