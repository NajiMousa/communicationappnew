import 'package:communication/screens/tabbar_screen/learn_screens/book_screen.dart';
import 'package:communication/screens/tabbar_screen/learn_screens/course_screen.dart';
import 'package:communication/screens/tabbar_screen/profile_screens/my_evaluation_screen.dart';
import 'package:communication/screens/tabbar_screen/profile_screens/personal_info_screen.dart';
import 'package:communication/screens/widgets/job_widget.dart';
import 'package:communication/screens/widgets/request_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

class TranslatorProfileScreen extends StatefulWidget {
  const TranslatorProfileScreen({Key? key}) : super(key: key);

  @override
  _TranslatorProfileScreenState createState() =>
      _TranslatorProfileScreenState();
}

class _TranslatorProfileScreenState extends State<TranslatorProfileScreen>
    with SingleTickerProviderStateMixin {
  int tabSelected = 0;

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
          'الملف الشخصي',
          style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.edit,
              color: HexColor('#FAFBFD'),
              size: 24.h,
            ),
          ),
        ],
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: HexColor('#FAFBFD'),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 184.h,
                decoration: BoxDecoration(
                  color: HexColor('#004AAD'),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.h, right: 30.w, left: 30.w),
                child: Row(
                  children: [
                    Container(
                      width: 109.w,
                      height: 143.h,
                      decoration: BoxDecoration(
                        color: HexColor('#82B1EF'),
                        borderRadius: BorderRadius.all(
                          Radius.circular(25),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            maxRadius: 33.h,
                            child: Image.asset('images/user.png'),
                          ),
                          SizedBox(
                            height: 14.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.edit,
                                color: HexColor('#004AAD'),
                                size: 16.h,
                              ),
                              SizedBox(
                                width: 8.w,
                              ),
                              Text(
                                'تعديل الملف الشخصي',
                                style: TextStyle(
                                    fontSize: 8.sp, color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 17.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'شوق المنصور',
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 4.w,
                            ),
                            Icon(
                              Icons.check_circle,
                              size: 16.h,
                              color: HexColor('#B0EEE4'),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Text(
                          'ana0taha.gmail.com',
                          style: TextStyle(
                            fontSize: 10.sp,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        Text(
                          'شوق المنصور مترجم لغه الاشارة لان فئة الصم والبكم\n نجوم يتميزو بمهارات عاليه لذلك اقدم خدماتي لهم\n لتسهيل التواصل ولادراجهم بكل الخدمات الميسرة و\nعلى ذلك سابذل قصارى جهدي لخدمتهم بشكل اكبر\n بالدورات وغيرها ',
                          style: TextStyle(
                            fontSize: 9.sp,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 25.h,
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: 30.w),
                width: 140.w,
                height: 70.h,
                decoration: BoxDecoration(
                  color: HexColor('#82B1EF'),
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.help_center,
                      size: 24.h,
                      color: HexColor('#004AAD'),
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    Text(
                      'المساعدة',
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                          color: HexColor('#004AAD')),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Container(
                margin: EdgeInsets.only(left: 30.w),
                width: 140.w,
                height: 70.h,
                decoration: BoxDecoration(
                  color: HexColor('#82B1EF'),
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.wallet_giftcard,
                      size: 24.h,
                      color: HexColor('#004AAD'),
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    Text(
                      'المحفظة',
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                          color: HexColor('#004AAD')),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    tabSelected = 0;
                  });
                },
                child: Container(
                  margin: EdgeInsets.only(top: 20.h,bottom: 24.h),
                  width: 158.h,
                  height: 40.h,
                  alignment: AlignmentDirectional.center,
                  decoration: BoxDecoration(
                    color: tabSelected == 0
                        ? HexColor('#004AAD')
                        : HexColor('#E5ECF6'),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                  ),
                  child: Text(
                    'البيانات الشخصية ',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: tabSelected == 0
                          ? HexColor('#E5ECF6')
                          : HexColor('#004AAD'),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    tabSelected = 1;
                  });
                },
                child: Container(
                  margin: EdgeInsets.only(top: 20.h,bottom: 24.h),
                  width: 158.h,
                  height: 40.h,
                  alignment: AlignmentDirectional.center,
                  decoration: BoxDecoration(
                    color: tabSelected == 1
                        ? HexColor('#004AAD')
                        : HexColor('#E5ECF6'),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                    ),
                  ),
                  child: Text(
                    'التقييمات',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: tabSelected == 1
                          ? HexColor('#E5ECF6')
                          : HexColor('#004AAD'),
                    ),
                  ),
                ),
              ),
            ],
          ),
          tabSelected == 0 ? PersonalInfoScreen() : MyEvaluationScreen(),
        ],
      ),
    );
  }
}
