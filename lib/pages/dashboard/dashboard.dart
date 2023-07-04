import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:sizer/sizer.dart';
import 'package:stopwatch/constants/pallete.dart';
import 'package:stopwatch/constants/textStyles_constants.dart';
import 'package:stopwatch/pages/count_down.dart/count_down.dart';
import 'package:stopwatch/pages/dashboard/controller/dashboard_controller.dart';
import 'package:stopwatch/pages/stop_watch/stop_watch.dart';

class Dashboard extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  Dashboard({
    Key? key,
    this.title = "",
    this.userName = "",
    this.location = "",
  }) : super(key: key);

  final String title;
  final String userName;
  final String location;
  bool isProfile = true;
  bool isTitle = true;

  DashboardController d = Get.put(DashboardController());
  // final MyTabController _tabx = Get.isRegistered<MyTabController>()
  //     ? Get.find()
  //     : Get.put(MyTabController());

  int _selectedIndex = 0;
  static List<Widget> _bottomNavList = <Widget>[
    CountDown(),
    StopWatchPage(),
  ];

  void _onItemTapped(int index) {
    d.bottomNavIndex.value = index;

    if (d.bottomNavIndex.value == 1) {}
    if (d.bottomNavIndex.value == 2) {}
  }

  @override
  Widget build(BuildContext context) {
    // d.bottomNavIndex.value = 1;

    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: true,
      backgroundColor: Pallete.backGround,
      appBar: AppBar(
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
        title: Padding(
          padding: EdgeInsets.all(6.0.sp),
          child: Center(
            child: Text("Stopwatch App",
                style: DesignTextStyles.s16B(color: Pallete.backGround)),
          ),
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Pallete.primary,
      ),
      body: GetX<DashboardController>(builder: (nController) {
        return Padding(
          padding: EdgeInsets.only(
            left: 0.w,
            right: 0.w,
          ),
          // padding: const EdgeInsets.only(top: 16.0, right: 16.0, left: 16.0),
          child: _bottomNavList.elementAt(d.bottomNavIndex.value),
        );
      }),
      bottomNavigationBar: GetX<DashboardController>(builder: (nController) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(18.sp),
                topLeft: Radius.circular(18.sp)),
            boxShadow: const [
              BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 4),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(18.0.sp),
              topRight: Radius.circular(18.0.sp),
            ),
            child: BottomNavigationBar(
              backgroundColor: Pallete.backGround,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    label: "CountDown",
                    icon: CircleAvatar(
                      backgroundColor: Pallete.backGround,
                      child: Image.asset(
                        "assets/timer.png",
                        height: 5.h,
                      ),
                    )),
                BottomNavigationBarItem(
                    label: "StopWatch",
                    icon: CircleAvatar(
                      backgroundColor: Pallete.backGround,
                      child: Image.asset(
                        "assets/stop.png",
                        height: 3.h,
                      ),
                    )),
              ],
              type: BottomNavigationBarType.fixed,
              currentIndex: d.bottomNavIndex.value,
              selectedItemColor: Pallete.primary,
              unselectedItemColor: Colors.black54,
              iconSize: 28.sp,
              selectedLabelStyle: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.bold,
              ),
              unselectedLabelStyle: TextStyle(
                fontSize: 11.sp,
                fontWeight: FontWeight.w500,
              ),
              onTap: _onItemTapped,
              elevation: 20,
            ),
          ),
        );
      }),
    );
  }
}
