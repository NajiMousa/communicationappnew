import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

class OnBoardingSecondScreen extends StatefulWidget {
  const OnBoardingSecondScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingSecondScreenState createState() => _OnBoardingSecondScreenState();
}

class _OnBoardingSecondScreenState extends State<OnBoardingSecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#FAFBFD'),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            // padding: EdgeInsets.only(
            //     top: 40.h, right: 77.w, left: 77.w, bottom: 58.h),
            width: double.infinity,
            height: 110.h,
            decoration: BoxDecoration(
              color: HexColor('#004AAD'),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(25),
                topLeft: Radius.circular(25),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30.w),
                padding: EdgeInsets.only(top: 35.h, right: 30.w, left: 30.w),
                height: 565.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                ),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        width: 62.w,
                        height: 24.h,
                        decoration: BoxDecoration(
                          color: HexColor('#417ECE'),
                          borderRadius: BorderRadius.all(
                            Radius.circular(25),
                          ),
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.pushReplacementNamed(context, '/onboarding_third_screen');
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'تخطي',
                                style: TextStyle(
                                  fontSize: 10.sp,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                width: 4.w,
                              ),
                              Icon(
                                Icons.arrow_forward_ios_outlined,
                                size: 12.h,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 25.h,),
                    Center(
                      child: Image.asset(
                        'images/onBS.png',
                        width: 240.w,
                        height: 290.h,
                      ),
                    ),
                    SizedBox(height: 25.h,),
                    Text(
                      'لنتواصل بالاشارة',
                      style: TextStyle(
                        fontSize: 28.sp,
                        color: HexColor('#004AAD'),
                      ),
                    ),
                    SizedBox(height: 5.h,),
                    Text(
                      'مبادرة مختصة دعم هذه فئة الصم و البكم بشكل\n خاص وعامة المجتمع ، وطرق التعامل معهم \nوتدريبهم على قواعد وأساسيات\n لغة الإشارة',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: HexColor('#004AAD'),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 6.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

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
                    width: 24.w,
                    height: 4.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
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
                height: 10.h,
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, '/onboarding_first_screen');
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 30.w, bottom: 20.h),
                      width: 45.h,
                      height: 45.w,
                      decoration: BoxDecoration(
                        color: HexColor('#417ECE'),
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                      ),
                      child: Icon(
                        Icons.arrow_back_ios_outlined,
                        size: 16.h,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, '/onboarding_third_screen');
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 30.w, bottom: 20.h),
                      width: 45.h,
                      height: 45.w,
                      decoration: BoxDecoration(
                        color: HexColor('#417ECE'),
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                      ),
                      child: Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 16.h,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),

            ],
          ),
        ],
      ),
    );
  }
}
