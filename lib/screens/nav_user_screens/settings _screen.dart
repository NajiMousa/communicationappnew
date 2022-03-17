import 'package:communication/screens/tabbar_screen/learn_screens/book_screen.dart';
import 'package:communication/screens/tabbar_screen/learn_screens/course_screen.dart';
import 'package:communication/screens/widgets/request_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#FAFBFD'),
      body: Padding(
        padding: EdgeInsets.only(top: 15.h, right: 30.w, left: 30.w),
        child: ListView(
          children: [
            Row(
              children: [
                CircleAvatar(
                  maxRadius: 33.h,
                  child: Image.asset('images/user.png'),
                ),
                SizedBox(
                  width: 12.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'شوق المنصور',
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: HexColor('#004AAD'),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      'ana.ana@gmail.com',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: HexColor('#82B1EF'),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 24.h,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.plumbing_rounded,
                        size: 20.h,
                        color: HexColor('#82B1EF'),
                      ),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            Container(
              alignment: AlignmentDirectional.center,
              width: double.infinity,
              height: 45.h,
              decoration: BoxDecoration(
                border: Border.all(
                  color: HexColor('#004AAD'),
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: ListTile(
                visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                leading: Icon(
                  Icons.notifications,
                  color: HexColor('#004AAD'),
                ),
                title: Text(
                  'الاشعارات',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: HexColor('#004AAD'),
                  ),
                ),
                trailing: Switch(
                  activeColor: HexColor('#82B1EF'),
                  value: true,
                  onChanged: (value) {},
                ),
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Container(
              alignment: AlignmentDirectional.center,
              width: double.infinity,
              height: 45.h,
              decoration: BoxDecoration(
                border: Border.all(
                  color: HexColor('#004AAD'),
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: ListTile(
                visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                leading: Icon(
                  Icons.headset_mic_rounded,
                  color: HexColor('#004AAD'),
                ),
                title: Text(
                  'تواصل معنا',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: HexColor('#004AAD'),
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: HexColor('#82B1EF'),
                  size: 18.h,
                ),
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Container(
              alignment: AlignmentDirectional.center,
              width: double.infinity,
              height: 45.h,
              decoration: BoxDecoration(
                border: Border.all(
                  color: HexColor('#004AAD'),
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: ListTile(
                visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                leading: Icon(
                  Icons.info,
                  color: HexColor('#004AAD'),
                ),
                title: Text(
                  'اقرأ عنا',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: HexColor('#004AAD'),
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: HexColor('#82B1EF'),
                  size: 18.h,
                ),
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Container(
              alignment: AlignmentDirectional.center,
              width: double.infinity,
              height: 45.h,
              decoration: BoxDecoration(
                border: Border.all(
                  color: HexColor('#004AAD'),
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: ListTile(
                visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                leading: Icon(
                  Icons.help,
                  color: HexColor('#004AAD'),
                ),
                title: Text(
                  'المساعدة و الدعم',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: HexColor('#004AAD'),
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: HexColor('#82B1EF'),
                  size: 18.h,
                ),
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Container(
              alignment: AlignmentDirectional.center,
              width: double.infinity,
              height: 45.h,
              decoration: BoxDecoration(
                border: Border.all(
                  color: HexColor('#004AAD'),
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: ListTile(
                visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                leading: Icon(
                  Icons.copy,
                  color: HexColor('#004AAD'),
                ),
                title: Text(
                  'سياسة الخصوصية',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: HexColor('#004AAD'),
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: HexColor('#82B1EF'),
                  size: 18.h,
                ),
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Container(
              alignment: AlignmentDirectional.center,
              width: double.infinity,
              height: 45.h,
              decoration: BoxDecoration(
                border: Border.all(
                  color: HexColor('#004AAD'),
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: ListTile(
                visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                leading: Icon(
                  Icons.file_copy_rounded,
                  color: HexColor('#004AAD'),
                ),
                title: Text(
                  'الشروط و الاحكام',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: HexColor('#004AAD'),
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: HexColor('#82B1EF'),
                  size: 18.h,
                ),
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Container(
              alignment: AlignmentDirectional.center,
              width: double.infinity,
              height: 45.h,
              decoration: BoxDecoration(
                border: Border.all(
                  color: HexColor('#004AAD'),
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: ListTile(
                visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                leading: Icon(
                  Icons.share,
                  color: HexColor('#004AAD'),
                ),
                title: Text(
                  'مشاركة التطبيق',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: HexColor('#004AAD'),
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: HexColor('#82B1EF'),
                  size: 18.h,
                ),
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Container(
              alignment: AlignmentDirectional.center,
              width: double.infinity,
              height: 45.h,
              decoration: BoxDecoration(
                border: Border.all(
                  color: HexColor('#004AAD'),
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: ListTile(
                visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                leading: Icon(
                  Icons.logout,
                  color: HexColor('#004AAD'),
                ),
                title: Text(
                  'تسجيل الخروج',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: HexColor('#004AAD'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
