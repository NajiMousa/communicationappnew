import 'package:communication/screens/tabbar_screen/learn_screens/book_screen.dart';
import 'package:communication/screens/tabbar_screen/learn_screens/course_screen.dart';
import 'package:communication/screens/widgets/job_widget.dart';
import 'package:communication/screens/widgets/request_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({Key? key}) : super(key: key);

  @override
  _PrivacyPolicyScreenState createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 14.h,
          ),
        ),
        backgroundColor: HexColor('#004AAD'),
        title: Text(
          'سياسة الخصوصية',
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
                    'name',
                  )),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 270.h, right: 30.w, left: 30.w),
                padding: EdgeInsets.only(top: 15.h,right: 10.w, left: 10.w),
                width: double.infinity,
                height: 260.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                ),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'سياسة الخصوصية',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: HexColor('#004AAD'),
                      ),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Text(
                      'يشكل استخدامك لتطبيقنا موافقتك الصريحة على جميع الشروط والأحكام \nالواردة أدناه ، لذا يرجى قراءتها بعناية وبشكل مسؤول حيث يتم تجديد الشروط \nاستخدم من وقت لآخر ويتم إبلاغ جميع المستخدمين بذلك',
                      style: TextStyle(
                        fontSize: 10.sp,
                        color: HexColor('#004AAD'),
                      ),
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    Text(
                      'يشكل استخدامك لتطبيقنا موافقتك الصريحة على جميع الشروط والأحكام \nالواردة أدناه ، لذا يرجى قراءتها بعناية وبشكل مسؤول حيث يتم تجديد الشروط \nاستخدم من وقت لآخر ويتم إبلاغ جميع المستخدمين بذلك',
                      style: TextStyle(
                        fontSize: 10.sp,
                        color: HexColor('#004AAD'),
                      ),
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    Text(
                      'يشكل استخدامك لتطبيقنا موافقتك الصريحة على جميع الشروط والأحكام \nالواردة أدناه ، لذا يرجى قراءتها بعناية وبشكل مسؤول حيث يتم تجديد الشروط \nاستخدم من وقت لآخر ويتم إبلاغ جميع المستخدمين بذلك',
                      style: TextStyle(
                        fontSize: 10.sp,
                        color: HexColor('#004AAD'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 20.h, right: 30.w, left: 30.w),
            padding: EdgeInsets.only(top: 15.h,right: 10.w, left: 10.w),
            width: double.infinity,
            height: 194.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(25),
              ),
            ),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'ماذا نفعل بمعلومات المستخدم التي تقدمها إلينا',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: HexColor('#004AAD'),
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.done_outlined,
                      size: 12.h,
                      color: HexColor('#004AAD'),
                    ),
                    SizedBox(width: 10.w,),
                    Text(
                      'يحتفظ تطبيق وثاق بحقه في تجميد أي حساب أو حتى إيقافه بشكل\n دائم والذي يطبّق على حساب العميل بسبب استخدام غير قانوني أو\nغير مناسب لخدمات التطبيق',
                      style: TextStyle(
                        fontSize: 10.sp,
                        color: HexColor('#004AAD'),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.h,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.done_outlined,
                      size: 12.h,
                      color: HexColor('#004AAD'),
                    ),
                    SizedBox(width: 10.w,),
                    Text(
                      'يحتفظ تطبيق وثاق بحقه في تجميد أي حساب أو حتى إيقافه بشكل\n دائم والذي يطبّق على حساب العميل بسبب استخدام غير قانوني أو\nغير مناسب لخدمات التطبيق',
                      style: TextStyle(
                        fontSize: 10.sp,
                        color: HexColor('#004AAD'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 15.h,),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 20.h, right: 30.w, left: 30.w),
            padding: EdgeInsets.only(top: 15.h,right: 10.w, left: 10.w),
            width: double.infinity,
            height: 194.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(25),
              ),
            ),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'ماهية البيانات الشخصية التي قد نجمعها عنك',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: HexColor('#004AAD'),
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.done_outlined,
                      size: 12.h,
                      color: HexColor('#004AAD'),
                    ),
                    SizedBox(width: 10.w,),
                    Text(
                      'يحتفظ تطبيق وثاق بحقه في تجميد أي حساب أو حتى إيقافه بشكل\n دائم والذي يطبّق على حساب العميل بسبب استخدام غير قانوني أو\nغير مناسب لخدمات التطبيق',
                      style: TextStyle(
                        fontSize: 10.sp,
                        color: HexColor('#004AAD'),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.h,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.done_outlined,
                      size: 12.h,
                      color: HexColor('#004AAD'),
                    ),
                    SizedBox(width: 10.w,),
                    Text(
                      'يحتفظ تطبيق وثاق بحقه في تجميد أي حساب أو حتى إيقافه بشكل\n دائم والذي يطبّق على حساب العميل بسبب استخدام غير قانوني أو\nغير مناسب لخدمات التطبيق',
                      style: TextStyle(
                        fontSize: 10.sp,
                        color: HexColor('#004AAD'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
