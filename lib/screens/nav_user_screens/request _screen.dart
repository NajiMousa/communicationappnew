import 'package:communication/screens/tabbar_screen/learn_screens/book_screen.dart';
import 'package:communication/screens/tabbar_screen/learn_screens/course_screen.dart';
import 'package:communication/screens/widgets/request_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

class RequestScreen extends StatefulWidget {
  const RequestScreen({Key? key}) : super(key: key);

  @override
  _RequestScreenState createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestScreen> {

  int filterSelected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: HexColor('#FAFBFD'),
      body: Column(
        children: [
          SizedBox(height: 15.h,),
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
                      'الكل',
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
                      'قيد التنفيذ',
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
                      'منتهية',
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
                      'ملغية',
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
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      EdgeInsets.only(right: 30.w, left: 30.w, bottom: 16.h),
                  child: RequestWidget(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
