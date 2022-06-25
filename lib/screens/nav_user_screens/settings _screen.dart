import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../controller/fb_storage_controller.dart';
import '../../pref/shread_pref.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  @override
  void initState() {
    // TODO: implement initState
    print('SharedPrefController().name');
    print(SharedPrefController().name);
    super.initState();
  }
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
                  child: FutureBuilder<String>(
                    future: FbStorageController()
                        .readImage(name: SharedPrefController().phone),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return CircleAvatar(
                            radius: 30.r,
                            backgroundColor: Colors.transparent,
                            child: ClipOval(
                              child: Image.network(
                                snapshot.data.toString(),
                                fit: BoxFit.cover,
                                height: 60.h,
                                width: 60.w,
                              ),
                            ));
                      } else {
                        return CircleAvatar(
                            radius: 30.r,
                            backgroundColor: Colors.transparent,
                            child: ClipOval(
                              child: Image.asset(
                                "images/user.png",
                                fit: BoxFit.cover,
                                height: 60.h,
                                width: 60.w,
                              ),
                            ));
                      }
                    },
                  ),
                ),
                SizedBox(
                  width: 12.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      SharedPrefController().name,
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: HexColor('#82B1EF'),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      SharedPrefController().phone,
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: HexColor('#82B1EF'),
                      ),
                    ),
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
            InkWell(
              onTap: () async {
                Navigator.pushNamed(context, '/help_faqs_screen');
              },
              child: Container(
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
            ),
            SizedBox(
              height: 16.h,
            ),
            InkWell(
              onTap: () async {
                print('logOut');
                Navigator.pushNamed(context, '/about_us_screen');
              },
              child: Container(
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
            ),
            SizedBox(
              height: 16.h,
            ),
            InkWell(
              onTap: () async {
                print('logOut');
                Navigator.pushNamed(context, '/help_faqs_screen');
              },
              child: Container(
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
            ),
            SizedBox(
              height: 16.h,
            ),
            InkWell(
              onTap: () async {
                print('logOut');
                Navigator.pushNamed(context, '/privacy_policy_screen');
              },
              child: Container(
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
            ),
            SizedBox(
              height: 16.h,
            ),
            InkWell(
              onTap: () async {
                print('logOut');
                Navigator.pushNamed(context, '/terms_conditions_screen');
              },
              child: Container(
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
            InkWell(
              onTap: () async {
                print('logOut');
                await SharedPrefController().clear();
                Navigator.pushReplacementNamed(context, '/login_screen');
              },
              child: Container(
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
            ),
          ],
        ),
      ),
    );
  }
}
