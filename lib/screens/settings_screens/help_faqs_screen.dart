import 'package:communication/screens/tabbar_screen/learn_screens/book_screen.dart';
import 'package:communication/screens/tabbar_screen/learn_screens/course_screen.dart';
import 'package:communication/screens/widgets/job_widget.dart';
import 'package:communication/screens/widgets/request_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

class HelpFaqsScreen extends StatefulWidget {
  const HelpFaqsScreen({Key? key}) : super(key: key);

  @override
  _HelpFaqsScreenState createState() => _HelpFaqsScreenState();
}

class _HelpFaqsScreenState extends State<HelpFaqsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {Navigator.pop(context);},
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 14.h,
          ),
        ),
        backgroundColor: HexColor('#004AAD'),
        title: Text(
          'المساعدة و الدعم',
          style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
        ),
      ),
      backgroundColor: HexColor('#FAFBFD'),
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                  padding: EdgeInsets.only(
                      top: 40.h, right: 77.w, left: 77.w, bottom: 58.h),
                  width: double.infinity,
                  height: 300.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(25),
                      bottomLeft: Radius.circular(25),
                    ),
                  ),
                  child: Image.asset(
                    'images/helpAndFaqs.png',
                  )),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 270.h, right: 30.w, left: 30.w),
                padding: EdgeInsets.only(right: 20.w, left: 20.w),
                width: double.infinity,
                height: 48.h,
                decoration: BoxDecoration(
                  color: HexColor('#004AAD'),
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                child: Row(
                  children: [
                    Text(
                      'ما هو تطبيق لنتواصل بالاشارة',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.white,
                      ),
                    ),
                    Spacer(),
                    Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 5.h, right: 30.w, left: 30.w),
            padding: EdgeInsets.only(top: 15.h, right: 10.w, left: 10.w,bottom: 15.h),
            width: double.infinity,
            height: 80.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(25),
              ),
            ),
            child: Text(
              'يحتفظ تطبيق وثاق بحقه في تجميد أي حساب أو حتى إيقافه بشكل\n دائم والذي يطبّق على حساب العميل بسبب استخدام غير قانوني أو\nغير مناسب لخدمات التطبيق',
              style: TextStyle(
                fontSize: 10.sp,
                color: HexColor('#004AAD'),
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 15.h, right: 30.w, left: 30.w),
            padding: EdgeInsets.only(right: 20.w, left: 20.w),
            width: double.infinity,
            height: 48.h,
            decoration: BoxDecoration(
              color: HexColor('#004AAD'),
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            child: Row(
              children: [
                Text(
                  'ما هو تطبيق لنتواصل بالاشارة',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.white,
                  ),
                ),
                Spacer(),
                Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 15.h, right: 30.w, left: 30.w),
            padding: EdgeInsets.only(right: 20.w, left: 20.w),
            width: double.infinity,
            height: 48.h,
            decoration: BoxDecoration(
              color: HexColor('#004AAD'),
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            child: Row(
              children: [
                Text(
                  'ما هو تطبيق لنتواصل بالاشارة',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.white,
                  ),
                ),
                Spacer(),
                Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.white,
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
