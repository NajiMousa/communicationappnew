
import 'package:communication/screens/tabbar_screen/learn_screens/book_screen.dart';
import 'package:communication/screens/tabbar_screen/learn_screens/course_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

class LearnScreen extends StatefulWidget {
  const LearnScreen({Key? key}) : super(key: key);

  @override
  _LearnScreenState createState() => _LearnScreenState();
}

class _LearnScreenState extends State<LearnScreen> {
  int tabSelected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#FAFBFD'),
      body: Column(
        children: [
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
                  margin: EdgeInsets.only(top: 20.h),
                  width: 142.h,
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
                    'الدورات ',
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
                  margin: EdgeInsets.only(top: 20.h),
                  width: 142.h,
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
                    'كتاب الاشارات',
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
          SizedBox(height: 24.h,),
          tabSelected == 0 ? CourseScreen() : BookScreen(),
        ],
      ),
    );
  }
}
