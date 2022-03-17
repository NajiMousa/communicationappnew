import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

class RequestWidget extends StatefulWidget {
  const RequestWidget({Key? key}) : super(key: key);

  @override
  _RequestWidgetState createState() => _RequestWidgetState();
}

class _RequestWidgetState extends State<RequestWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/request_details_screen');
      },
      child: Container(
        padding: EdgeInsets.only(
            top: 10.h, right: 20.w, left: 20.w, bottom: 15.h),
        width: double.infinity,
        height: 92.h,
        decoration: BoxDecoration(
          color: HexColor('#004AAD'),
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  maxRadius: 15.h,
                  child: Stack(
                    children: [
                      Image.asset('images/user.png'),
                      Align(
                        alignment: AlignmentDirectional.bottomEnd,
                        child: Container(
                          alignment: AlignmentDirectional.center,
                          width: 11.w,
                          height: 11.h,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                          child: Text(
                            '4.1',
                            style: TextStyle(
                              fontSize: 6.sp,
                              color: HexColor('#004AAD'),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  'ليلى المنصور',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.white,
                  ),
                ),
                Spacer(),
                Container(
                  width: 35.w,
                  height: 18.h,
                  alignment: AlignmentDirectional.center,
                  decoration: BoxDecoration(
                    color: HexColor('#007BFF'),
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  child: Text(
                    'معلق',
                    style: TextStyle(
                      fontSize: 8.sp,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            Divider(
              color: HexColor('#82B1EF'),
              thickness: 1,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.w, right: 10.w),
              child: Row(
                children: [
                  Icon(
                    Icons.location_on,
                    size: 12.h,
                    color: HexColor('#82B1EF'),
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  Text(
                    'جازان',
                    style: TextStyle(
                        fontSize: 8.sp, color: Colors.white),
                  ),
                  Spacer(),
                  Icon(
                    Icons.calendar_today,
                    size: 12.h,
                    color: HexColor('#82B1EF'),
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  Text(
                    'الثلاثاء 02/01/2022',
                    style: TextStyle(
                        fontSize: 8.sp, color: Colors.white),
                  ),
                  Spacer(),
                  Icon(
                    Icons.lock_clock,
                    size: 12.h,
                    color: HexColor('#82B1EF'),
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  Text(
                    '02:00 PM',
                    style: TextStyle(
                        fontSize: 8.sp, color: Colors.white),
                  ),
                  Spacer(),
                  Icon(
                    Icons.keyboard_arrow_down_sharp,
                    color: HexColor('#82B1EF'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
