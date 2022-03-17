// import 'dart:html';
// import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:communication/screens/nav_user_screens/main_screen.dart';
import 'package:communication/screens/widgets/course_widget.dart';
import 'package:communication/screens/widgets/job_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#FAFBFD'),
      body: ListView(
        padding: EdgeInsets.only(
          top: 25.h,
        ),
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: InkWell(
              onTap: () => Navigator.pushNamed(context, '/user_profile_screen'),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    alignment: AlignmentDirectional.center,
                    width: 70.w,
                    height: 70.h,
                    decoration: BoxDecoration(
                      color: HexColor('#E5ECF6'),
                      borderRadius: BorderRadius.all(
                        Radius.circular(50),
                      ),
                    ),
                    child: Image.asset(
                      'images/user.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(
                    width: 12.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'أهلا بعودتك',
                        style: TextStyle(
                            fontSize: 22.sp,
                            color: HexColor('#004AAD'),
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'شوق المنصور',
                        style: TextStyle(
                            fontSize: 16.sp,
                            color: HexColor('#004AAD'),
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 24.h,
          ),
          CarouselSlider.builder(
            itemCount: 15,
            itemBuilder:
                (BuildContext context, int itemIndex, int pageViewIndex) =>
                    Container(
              // margin: EdgeInsets.symmetric(horizontal: 14.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: Image.asset(
                'images/slider.png',
                fit: BoxFit.fill,
              ),
            ),
            options: CarouselOptions(
              height: 200,
              aspectRatio: 12 / 12,
              viewportFraction: 0.8,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              // onPageChanged: callbackFunction,
              scrollDirection: Axis.horizontal,
            ),
          ),
          SizedBox(
            height: 6.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 24.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color: HexColor('#004AAD'),
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
              ),
              SizedBox(
                width: 6.w,
              ),
              Container(
                width: 12.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color: HexColor('#E5ECF6'),
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
              ),
              SizedBox(
                width: 6.w,
              ),
              Container(
                width: 12.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color: HexColor('#E5ECF6'),
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 24.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Column(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 48.h),
                    primary: HexColor('#004AAD'),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.search_outlined,
                        size: 20,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        'بحث عن مترجمين',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    side: BorderSide(
                      color: HexColor('#004AAD'),
                      width: 2,
                    ),
                    minimumSize: Size(double.infinity, 48.h),
                    primary: HexColor('#FAFBFD'),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/edit_profile_user_screen');
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.accessibility_sharp,
                        size: 20,
                        color: HexColor('#004AAD'),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        'قم بأستكمال ملفك الشخصي',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: HexColor('#004AAD'),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                Row(
                  children: [
                    Text(
                      'اخر الدورات',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: HexColor('#004AAD'),
                      ),
                    ),
                    Spacer(
                      flex: 10,
                    ),
                    InkWell(
                      // onTap: () => cruuentPageIndex=1;
                      child: Text(
                        'المزيد',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: HexColor('#AD6300'),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 16,
                      color: HexColor('#AD6300'),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12.h,
                ),
                CouurseWidget(),
                SizedBox(
                  height: 24.h,
                ),
                Row(
                  children: [
                    Text(
                      'اخر الوظائف',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: HexColor('#004AAD'),
                      ),
                    ),
                    Spacer(
                      flex: 10,
                    ),
                    Text(
                      'المزيد',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: HexColor('#AD6300'),
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 16,
                      color: HexColor('#AD6300'),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12.h,
                ),
                JobWidget(),
                SizedBox(
                  height: 30.h,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
