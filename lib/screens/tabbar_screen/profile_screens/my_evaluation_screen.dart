import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

class MyEvaluationScreen extends StatefulWidget {
  const MyEvaluationScreen({Key? key}) : super(key: key);

  @override
  _MyEvaluationScreenState createState() => _MyEvaluationScreenState();
}

class _MyEvaluationScreenState extends State<MyEvaluationScreen> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.only(right: 30.w, left: 30.w),
        itemCount: 6,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                        top: 10.h, right: 20.w, left: 20.w, bottom: 15.h),
                    width: double.infinity,
                    height: 118.h,
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
                              child: Align(
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
                            Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: HexColor('#82B1EF'),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        Row(
                          children: [
                            Text(
                              'تم تقييمك بمعدل',
                              style: TextStyle(
                                fontSize: 10.sp,
                                color: Colors.white,
                              ),
                            ),
                            Spacer(),
                            Container(
                              alignment: Alignment.center,
                              width: 33.w,
                              height: 22.h,
                              decoration: BoxDecoration(
                                color: HexColor('#F1C40F'),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),
                              ),
                              child: Text(
                                '4.1',
                                style: TextStyle(
                                  fontSize: 10.sp,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Spacer(
                              flex: 4,
                            ),
                            SizedBox(
                              width: 91.w,
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
                            mainAxisAlignment: MainAxisAlignment.end,
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
                              SizedBox(
                                width: 15.w,
                              ),
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
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 12.h,),
                  Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 15.h),
                        width: double.infinity,
                        height: 260.h,
                        decoration: BoxDecoration(
                          color: HexColor('#E5ECF6'),
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 15.h, right: 25.w, left: 25.w),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  'المظهر العام',
                                  style: TextStyle(
                                    fontSize: 10.sp,
                                    color: HexColor('#004AAD'),
                                  ),
                                ),
                                Spacer(),
                                Container(
                                  alignment: Alignment.center,
                                  width: 33.w,
                                  height: 22.h,
                                  decoration: BoxDecoration(
                                    color: HexColor('#F1C40F'),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(15),
                                    ),
                                  ),
                                  child: Text(
                                    '4.1',
                                    style: TextStyle(
                                      fontSize: 10.sp,
                                      color: Colors.white,
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
                                Text(
                                  'الالتزام بالمواعيد',
                                  style: TextStyle(
                                    fontSize: 10.sp,
                                    color: HexColor('#004AAD'),
                                  ),
                                ),
                                Spacer(),
                                Container(
                                  alignment: Alignment.center,
                                  width: 33.w,
                                  height: 22.h,
                                  decoration: BoxDecoration(
                                    color: HexColor('#F1C40F'),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(15),
                                    ),
                                  ),
                                  child: Text(
                                    '4.1',
                                    style: TextStyle(
                                      fontSize: 10.sp,
                                      color: Colors.white,
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
                                Text(
                                  'مدى مهارته في الترجمة ',
                                  style: TextStyle(
                                    fontSize: 10.sp,
                                    color: HexColor('#004AAD'),
                                  ),
                                ),
                                Spacer(),
                                Container(
                                  alignment: Alignment.center,
                                  width: 33.w,
                                  height: 22.h,
                                  decoration: BoxDecoration(
                                    color: HexColor('#F1C40F'),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(15),
                                    ),
                                  ),
                                  child: Text(
                                    '4.1',
                                    style: TextStyle(
                                      fontSize: 10.sp,
                                      color: Colors.white,
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
                                Text(
                                  'توصي بالتعامل معك',
                                  style: TextStyle(
                                    fontSize: 10.sp,
                                    color: HexColor('#004AAD'),
                                  ),
                                ),
                                Spacer(),
                                Container(
                                  alignment: Alignment.center,
                                  width: 33.w,
                                  height: 22.h,
                                  decoration: BoxDecoration(
                                    color: HexColor('#F1C40F'),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(15),
                                    ),
                                  ),
                                  child: Text(
                                    '4.1',
                                    style: TextStyle(
                                      fontSize: 10.sp,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: Text(
                                'وصفك',
                                style: TextStyle(
                                  fontSize: 10.sp,
                                  color: HexColor('#004AAD'),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 12.h,
                            ),
                            Container(
                              alignment: Alignment.center,
                              width: double.infinity,
                              height: 80,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),
                              ),
                              child: Text(
                                'التشبيك والتنسيق والتعاون مع مجموعات الدعم الذاتي بما يضمن \nوصولهم للخدمات ومشاركتهم الفاعلة في أنشطة المشروع \n لمشاركة بفعالية في حملات الضغط والمناصرة التي تنظمها جمعية \nالثقافة والفكر الحر لتحسين واقع الاشخاص ذوي الاعاقة',
                                style: TextStyle(
                                  fontSize: 8.sp,
                                  color: HexColor('#004AAD'),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
