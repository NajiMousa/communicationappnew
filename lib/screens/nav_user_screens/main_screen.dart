// import 'dart:html';
// import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:communication/screens/nav_user_screens/home_screen.dart';
import 'package:communication/screens/nav_user_screens/job_screen.dart';
import 'package:communication/screens/nav_user_screens/learn_screen.dart';
import 'package:communication/screens/nav_user_screens/request%20_screen.dart';
import 'package:communication/screens/nav_user_screens/settings%20_screen.dart';
import 'package:communication/screens/widgets/course_widget.dart';
import 'package:communication/screens/widgets/job_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int cruuentPageIndex = 0;
  List pageTitle = ['الرئيسية', 'زد معرفتك', 'طلبات', 'وظائف', 'الاعدادات'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor('#004AAD'),
        title: Text(
          cruuentPageIndex == 0
              ? pageTitle[0]
              : cruuentPageIndex == 1
                  ? pageTitle[1]
                  : cruuentPageIndex == 2
                      ? pageTitle[2]
                      : cruuentPageIndex == 3
                          ? pageTitle[3]
                          : pageTitle[4],
          style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0,
        shape: cruuentPageIndex == 3
            ? const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(0),
                ),
              )
            : const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_rounded,
              color: HexColor('#FAFBFD'),
              size: 24.h,
            ),
          ),
        ],
      ),
      backgroundColor: HexColor('#FAFBFD'),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
                size: 20.h,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.menu_book_outlined,
                size: 20.h,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.volume_up_outlined,
                size: 20.h,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.shop_outlined,
                size: 20.h,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
                size: 20.h,
              ),
              label: ''),
        ],
        currentIndex: cruuentPageIndex,
        // showSelectedLabels: false,
        unselectedItemColor: HexColor("#004AAD"),
        selectedItemColor: HexColor("#F79355"),
        backgroundColor: Colors.white,
        onTap: (int index) {
          setState(() {
            cruuentPageIndex = index;
          });
        },
      ),
      body: cruuentPageIndex == 0
          ? const HomeScreen()
          : cruuentPageIndex == 1
              ? const LearnScreen()
              : cruuentPageIndex == 2
                  ? const RequestScreen()
                  : cruuentPageIndex == 3
                      ? const JobScreen()
                      : const SettingsScreen(),
    );
  }
}
