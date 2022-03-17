import 'package:communication/screens/widgets/course_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

class CourseScreen extends StatefulWidget {
  const CourseScreen({Key? key}) : super(key: key);

  @override
  _CourseScreenState createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {

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
              padding: EdgeInsets.only(right: 30.w, bottom: 24.h),
              scrollDirection: Axis.horizontal,
              children: [
                InkWell(
                  onTap:  () {
                    setState(() {
                      filterSelected = 0;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    alignment: AlignmentDirectional.center,
                    decoration: BoxDecoration(
                      color: filterSelected == 0 ? HexColor('#004AAD') : Colors.white,
                      border: Border.all(
                        color: HexColor('#004AAD')
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(25),
                      ),
                    ),
                    child: Text(
                      'الكل',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: filterSelected == 0 ?  Colors.white :HexColor('#004AAD') ,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 15.h,
                ),
                InkWell(
                  onTap:  () {
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
                      'المفضلة',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: filterSelected == 1 ?  Colors.white :HexColor('#004AAD'),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 15.h,
                ),
                InkWell(
                  onTap:  () {
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
                      'حضوري',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: filterSelected == 2 ?  Colors.white :HexColor('#004AAD'),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 15.h,
                ),
                InkWell(
                  onTap:  () {
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
                      'أونلاين',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: filterSelected == 3 ?  Colors.white :HexColor('#004AAD'),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 15.h,
                ),
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
                      CouurseWidget(),
                      SizedBox(
                        height: 12.h,
                      ),
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
