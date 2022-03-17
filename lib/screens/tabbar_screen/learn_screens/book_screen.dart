import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

class BookScreen extends StatefulWidget {
  const BookScreen({Key? key}) : super(key: key);

  @override
  _BookScreenState createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {

  int filterSelected = 0;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: 60.h,
              minWidth: double.infinity,
            ),
            child: ListView(
              padding: EdgeInsets.only(right: 30.w,bottom: 24.h),
              scrollDirection: Axis.horizontal,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      filterSelected = 0;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    // height: 35.h,
                    alignment: AlignmentDirectional.center,
                    decoration: BoxDecoration(
                      color: filterSelected == 0 ? HexColor('#004AAD') : Colors.white,
                      border: Border.all(
                        color: HexColor('#004AAD'),
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(25),
                      ),
                    ),
                    child: Text(
                      'الحروف',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: filterSelected == 0 ?  Colors.white :HexColor('#004AAD'),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 15.h,),
                InkWell(
                  onTap: () {
                    setState(() {
                      filterSelected = 1;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    alignment: AlignmentDirectional.center,
                    decoration: BoxDecoration(
                      color: filterSelected == 1 ? HexColor('#004AAD') : Colors.white,
                      border: Border.all(
                        color: HexColor('#004AAD'),
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(25),
                      ),
                    ),
                    child: Text(
                      'الارقام',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: filterSelected == 1 ?  Colors.white :HexColor('#004AAD'),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 15.h,),
                InkWell(
                  onTap: () {
                    setState(() {
                      filterSelected = 2;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    alignment: AlignmentDirectional.center,
                    decoration: BoxDecoration(
                      color: filterSelected == 2 ? HexColor('#004AAD') : Colors.white,
                      border: Border.all(
                        color: HexColor('#004AAD'),
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(25),
                      ),
                    ),
                    child: Text(
                      'الحيوانات',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: filterSelected == 2 ?  Colors.white :HexColor('#004AAD'),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 15.h,),
                InkWell(
                  onTap: () {
                    setState(() {
                      filterSelected = 3;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    alignment: AlignmentDirectional.center,
                    decoration: BoxDecoration(
                      color: filterSelected == 3 ? HexColor('#004AAD') : Colors.white,
                      border: Border.all(
                        color: HexColor('#004AAD'),
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(25),
                      ),
                    ),
                    child: Text(
                      'الحركات',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: filterSelected == 3 ?  Colors.white :HexColor('#004AAD'),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 15.h,),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(right: 30.w, left: 30.w),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 4.h),
                            alignment: Alignment.center,
                            width: double.infinity,
                            // height: 115.h,
                            decoration: BoxDecoration(
                              color: HexColor('#C6DCFB'),
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                            ),
                            child: Container(
                              child: Image.asset(
                                'images/Untitled.png',
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12.h,),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
