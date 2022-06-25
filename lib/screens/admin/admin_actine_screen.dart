import 'package:communication/controller/notification_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../controller/fb_storage_controller.dart';
import '../../pref/shread_pref.dart';
import '../user_profile_screens/user_profile_screen.dart';

class AdminActionScreen extends StatefulWidget {
  const AdminActionScreen({Key? key}) : super(key: key);

  @override
  State<AdminActionScreen> createState() => _AdminActionScreenState();
}

class _AdminActionScreenState extends State<AdminActionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor('#004AAD'),
        title: Text(
          'لوحة التحكم',
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16.sp),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.only(
          top: 25.h,right: 30.w,left: 30.w
        ),
        children: [
          InkWell(
            // onTap: () async {
            //   Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) =>
            //             UserProfileScreen(allUserDataModel: widget.allUserDataModel)),
            //   );
            // },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  alignment: AlignmentDirectional.center,
                  width: 70.w,
                  height: 70.h,
                  decoration: BoxDecoration(
                    color: HexColor('#E5ECF6'),
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
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
                  // Image.asset(
                  //   'images/user.png',
                  //   fit: BoxFit.fill,
                  // ),
                ),
                SizedBox(
                  width: 12.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'أهلا بعودتك',
                      style: TextStyle(
                          fontSize: 22.sp,
                          color: HexColor('#004AAD'),
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      SharedPrefController().name,
                      style: TextStyle(
                          fontSize: 16.sp,
                          color: HexColor('#004AAD'),
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 48.h),
              primary: HexColor('#004AAD'),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            // onPressed: () => NotificationController.showNotification(
            //   title: 'naji',
            //   body: 'Hello Naji',
            //   payload: 'naji.abs'
            // ),
            onPressed: (){},
            child: Text(
              'أضافة مشرف',
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 48.h),
              primary: HexColor('#004AAD'),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/add_course_screen');
            },
            child: Text(
              'أضافة دورة جديدة',
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 48.h),
              primary: HexColor('#004AAD'),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/add_job_screen');
            },
            child: Text(
              'أضافة وظيفة جديدة',
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
