import 'package:communication/screens/tabbar_screen/learn_screens/book_screen.dart';
import 'package:communication/screens/tabbar_screen/learn_screens/course_screen.dart';
import 'package:communication/screens/widgets/job_widget.dart';
import 'package:communication/screens/widgets/request_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

class RequestDetailsScreen extends StatefulWidget {
  const RequestDetailsScreen({Key? key}) : super(key: key);

  @override
  _RequestDetailsScreenState createState() => _RequestDetailsScreenState();
}

class _RequestDetailsScreenState extends State<RequestDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 14.h,
          ),
        ),
        // toolbarHeight: 140.h,
        backgroundColor: HexColor('#004AAD'),
        title: Text(
          'تفاصيل الطلب',
          style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0,
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.only(
        //     bottomLeft: Radius.circular(25),
        //     bottomRight: Radius.circular(25),
        //   ),
        // ),
        // actions: [
        //   IconButton(
        //     icon: Icon(
        //       Icons.notifications_rounded,
        //       color: HexColor('#FAFBFD'),
        //       size: 24.h,
        //     ),
        //     onPressed: () {},
        //   ),
        // ],
      ),
      backgroundColor: HexColor('#FAFBFD'),
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 192.h,
                decoration: BoxDecoration(
                  color: HexColor('#004AAD'),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 12.h, right: 30.w, left: 30.w),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        Text(
                          'العميل',
                          style:
                              TextStyle(fontSize: 12.sp, color: Colors.white),
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        CircleAvatar(
                          maxRadius: 25.h,
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'ليلى المنصور',
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'ana.ana@gmail.com',
                              style: TextStyle(
                                fontSize: 10.sp,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        Text(
                          'المترجم',
                          style:
                              TextStyle(fontSize: 12.sp, color: Colors.white),
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        CircleAvatar(
                          maxRadius: 25.h,
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'ليلى المنصور',
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'ana.ana@gmail.com',
                              style: TextStyle(
                                fontSize: 10.sp,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    Container(
                      padding:
                          EdgeInsets.only(top: 24.h, right: 30.w, left: 30.w),
                      width: double.infinity,
                      height: 400.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(25),
                        ),
                      ),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              'تفاصيل الطلب',
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: HexColor('#004AAD'),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 13.h,
                          ),
                          Row(
                            children: [
                              Column(
                                children: [
                                  Text(
                                    'حالة الطلب',
                                    style: TextStyle(
                                      fontSize: 10.sp,
                                      color: HexColor('#004AAD'),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 9.h,
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    width: 106.w,
                                    height: 28.h,
                                    decoration: BoxDecoration(
                                      color: HexColor('#28A745'),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(5),
                                      ),
                                    ),
                                    child: Text(
                                      'قيد التنفيذ',
                                      style: TextStyle(
                                        fontSize: 10.sp,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Spacer(),
                              Column(
                                children: [
                                  Text(
                                    'نوع الطلب',
                                    style: TextStyle(
                                      fontSize: 10.sp,
                                      color: HexColor('#004AAD'),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 9.h,
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    width: 106.w,
                                    height: 28.h,
                                    decoration: BoxDecoration(
                                      color: HexColor('#C3D6EF'),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(5),
                                      ),
                                    ),
                                    child: Text(
                                      'أونلاين',
                                      style: TextStyle(
                                        fontSize: 10.sp,
                                        color: HexColor('#004AAD'),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 19.h,
                          ),
                          Row(
                            children: [
                              Column(
                                children: [
                                  Text(
                                    'تاريخ الطلب',
                                    style: TextStyle(
                                      fontSize: 10.sp,
                                      color: HexColor('#004AAD'),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 9.h,
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    width: 106.w,
                                    height: 28.h,
                                    decoration: BoxDecoration(
                                      color: HexColor('#C3D6EF'),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(5),
                                      ),
                                    ),
                                    child: Text(
                                      'الثلاثاء 02/01/2022',
                                      style: TextStyle(
                                        fontSize: 10.sp,
                                        color: HexColor('#004AAD'),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Spacer(),
                              Column(
                                children: [
                                  Text(
                                    'تاريخ الالتقاء',
                                    style: TextStyle(
                                      fontSize: 10.sp,
                                      color: HexColor('#004AAD'),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 9.h,
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    width: 106.w,
                                    height: 28.h,
                                    decoration: BoxDecoration(
                                      color: HexColor('#C3D6EF'),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(5),
                                      ),
                                    ),
                                    child: Text(
                                      'الخميس 04/01/2022',
                                      style: TextStyle(
                                        fontSize: 10.sp,
                                        color: HexColor('#004AAD'),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 19.h,
                          ),
                          Row(
                            children: [
                              Column(
                                children: [
                                  Text(
                                    'موعد اللقاء',
                                    style: TextStyle(
                                      fontSize: 10.sp,
                                      color: HexColor('#004AAD'),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 9.h,
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    width: 106.w,
                                    height: 28.h,
                                    decoration: BoxDecoration(
                                      color: HexColor('#C3D6EF'),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(5),
                                      ),
                                    ),
                                    child: Text(
                                      '02:00 PM',
                                      style: TextStyle(
                                        fontSize: 10.sp,
                                        color: HexColor('#004AAD'),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Spacer(),
                              Column(
                                children: [
                                  Text(
                                    'مكان اللقاء',
                                    style: TextStyle(
                                      fontSize: 10.sp,
                                      color: HexColor('#004AAD'),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 9.h,
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    width: 106.w,
                                    height: 28.h,
                                    decoration: BoxDecoration(
                                      color: HexColor('#004AAD'),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(5),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.location_on,
                                          size: 18.h,
                                          color: Colors.white,
                                        ),
                                        SizedBox(
                                          width: 2.w,
                                        ),
                                        Text(
                                          'انتقل للخريطة',
                                          style: TextStyle(
                                            fontSize: 10.sp,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 19.h,
                          ),
                          Text(
                            'وصف الطلب',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 10.sp,
                              color: HexColor('#004AAD'),
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: double.infinity,
                            height: 75.h,
                            decoration: BoxDecoration(
                              color: HexColor('#C3D6EF'),
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              ),
                            ),
                            child: Text(
                              'التشبيك والتنسيق والتعاون مع مجموعات الدعم الذاتي بما يضمن\n وصولهم للخدمات ومشاركتهم الفاعلة في أنشطة المشروع لمشاركة\n بفعالية في حملات الضغط والمناصرة التي تنظمها جمعية الثقافة\n والفكر الحر لتحسين واقع الاشخاص ذوي الاعاقة',
                              style: TextStyle(
                                fontSize: 9.sp,
                                color: HexColor('#004AAD'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
                top: 18.h, right: 30.w, left: 30.w, bottom: 30.h),
            child: Column(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 48.h),
                    primary: HexColor('#004AAD'),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.search_outlined,
                        size: 20,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        'ألغاء الطلب',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    side: BorderSide(
                      color: HexColor('#004AAD'),
                      width: 2,
                    ),
                    minimumSize: Size(double.infinity, 48.h),
                    primary: HexColor('#FAFBFD'),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.accessibility_sharp,
                        size: 20,
                        color: HexColor('#004AAD'),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        'تعديل الطلب',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: HexColor('#004AAD'),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    side: BorderSide(
                      color: HexColor('#004AAD'),
                      width: 2,
                    ),
                    minimumSize: Size(double.infinity, 48.h),
                    primary: HexColor('#FAFBFD'),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.accessibility_sharp,
                        size: 20,
                        color: HexColor('#004AAD'),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        'تقييم',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: HexColor('#004AAD'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
