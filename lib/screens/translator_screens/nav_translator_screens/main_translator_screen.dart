// import 'dart:html';
// import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:communication/screens/nav_user_screens/home_screen.dart';
import 'package:communication/screens/nav_user_screens/job_screen.dart';
import 'package:communication/screens/nav_user_screens/learn_screen.dart';
import 'package:communication/screens/nav_user_screens/request%20_screen.dart';
import 'package:communication/screens/nav_user_screens/settings%20_screen.dart';
import 'package:communication/screens/translator_screens/nav_translator_screens/request%20_screen.dart';
import 'package:communication/screens/widgets/course_widget.dart';
import 'package:communication/screens/widgets/job_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

import 'home_screen.dart';

class MainTranslatorScreen extends StatefulWidget {
  const MainTranslatorScreen({Key? key}) : super(key: key);

  @override
  _MainTranslatorScreenState createState() => _MainTranslatorScreenState();
}

class _MainTranslatorScreenState extends State<MainTranslatorScreen> {
  int cruuentPageIndex = 0;
  List pageTitle = ['الرئيسية', 'طلبات', 'الاعدادات'];

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
                  : pageTitle[2],
          style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0,
        shape: const RoundedRectangleBorder(
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
                Icons.volume_up_outlined,
                size: 20.h,
              ),
              label: 'ssss'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
                size: 20.h,
              ),
              label: ''),
        ],
        currentIndex: cruuentPageIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
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
          ? const HomeTranslatorScreen()
          : cruuentPageIndex == 1
              ? const RequestTranslatorScreen()
              : SettingsScreen(),
    );
  }
}
