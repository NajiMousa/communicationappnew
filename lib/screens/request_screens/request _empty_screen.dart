import 'package:communication/screens/tabbar_screen/learn_screens/book_screen.dart';
import 'package:communication/screens/tabbar_screen/learn_screens/course_screen.dart';
import 'package:communication/screens/widgets/request_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

class RequestEmptyScreen extends StatefulWidget {
  const RequestEmptyScreen({Key? key}) : super(key: key);

  @override
  _RequestEmptyScreenState createState() => _RequestEmptyScreenState();
}

class _RequestEmptyScreenState extends State<RequestEmptyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor('#004AAD'),
        title: Text(
          'طلبات',
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
        actions: [
          IconButton(
            icon: Icon(
              Icons.notifications_rounded,
              color: HexColor('#FAFBFD'),
              size: 24.h,
            ),
            onPressed: () {},
          ),
        ],
      ),
      backgroundColor: HexColor('#FAFBFD'),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 24.h,
              right: 30.w,
            ),
            child: ConstrainedBox(
              constraints:
                  BoxConstraints(maxHeight: 35.h, minWidth: double.infinity),
              child: GridView(
                scrollDirection: Axis.horizontal,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisSpacing: 12.w,
                  childAspectRatio: 35 / 75,
                ),
                children: [
                  Container(
                    alignment: AlignmentDirectional.center,
                    decoration: BoxDecoration(
                      color: HexColor('#004AAD'),
                      borderRadius: BorderRadius.all(
                        Radius.circular(25),
                      ),
                    ),
                    child: Text(
                      'الكل',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: HexColor('#FAFBFD'),
                      ),
                    ),
                  ),
                  Container(
                    alignment: AlignmentDirectional.center,
                    decoration: BoxDecoration(
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
                        color: HexColor('#004AAD'),
                      ),
                    ),
                  ),
                  Container(
                    alignment: AlignmentDirectional.center,
                    decoration: BoxDecoration(
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
                        color: HexColor('#004AAD'),
                      ),
                    ),
                  ),
                  Container(
                    alignment: AlignmentDirectional.center,
                    decoration: BoxDecoration(
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
                        color: HexColor('#004AAD'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 24.h),
            padding: EdgeInsets.only(top: 90.h, right: 45.w, left: 45.w),
            width: double.infinity,
            height: 500.h,
            decoration: BoxDecoration(
              color: HexColor('#FFFFFF'),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
              ),
            ),
            child: Column(
              children: [
                // Image.asset(
                //   '',
                //   width: double.infinity,
                //   height: 235.h,
                // ),
                SizedBox(height: 234.h,),
                // RequestWidget(),
                Text(
                  'صديقي ... انت لم تقم بأنشاء أي طلب بعد',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: HexColor('#004AAD'),
                  ),
                ),
                Text(
                  'أي طلب سوف تقوم بانشاءه سيظهر هنا و يمكنك\n تصفح كافة التفاصيل الخاصة بطلباتك\n للتصفح المترجمين القريبين منك ',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: HexColor('#004AAD'),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(200.w, 48.h),
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
                        Icons.location_on_outlined,
                        size: 20,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        'انتقل للخريطة',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.white,
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
