import 'package:communication/controller/notification_controller.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import '../../main.dart';

class NaficationScreen extends StatefulWidget {
  const NaficationScreen({Key? key}) : super(key: key);

  @override
  _NaficationScreenState createState() => _NaficationScreenState();
}

class _NaficationScreenState extends State<NaficationScreen> {

  String notificationTitle = "no title";
  String notificationBody = "no body";
  String notificationData = "no data";


  @override
  void initState() {
    // TODO: implement initState
    final firebaseMessage = NotificationController();



    // firebaseMessage.setNotification();
    // firebaseMessage.streamCtrl.stream.listen(_changeData);
    // firebaseMessage.titleCtrl.stream.listen(_changeTitle);
    // firebaseMessage.bodyCtrl.stream.listen(_changeBody);

    super.initState();
  }

  // _changeData(String message) => setState(() => notificationData = message);
  //
  // _changeTitle(String message) => setState(() => notificationTitle = message);
  //
  // _changeBody(String message) => setState(() => notificationBody = message);


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
        backgroundColor: HexColor('#004AAD'),
        title: Text(
          'الاشعارات',
          style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: HexColor('#FAFBFD'),
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 50.h,
                decoration: BoxDecoration(
                  color: HexColor('#004AAD'),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10.h, right: 30.w, left: 30.w),
                padding: EdgeInsets.only(bottom: 20.h),
                clipBehavior: Clip.antiAlias,
                alignment: Alignment.center,
                width: double.infinity,
                height: 650.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                ),
                child: ListView.builder(
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.only(
                          top: 10.h, left: 15.w, right: 15.w, bottom: 10.h),
                      width: double.infinity,
                      height: 60.h,
                      decoration: BoxDecoration(
                        color: HexColor('#9EC2F3'),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.done_outlined,
                            color: HexColor('#004AAD'),
                            size: 14.h,
                          ),
                          SizedBox(
                            width: 6.w,
                          ),
                          CircleAvatar(
                            maxRadius: 20.h,
                            child: Image.asset(
                              'images/user.png',
                              fit: BoxFit.fill,
                            ),
                          ),
                          SizedBox(
                            width: 6.w,
                          ),
                          Text(
                            'أحمد جمال',
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                              color: HexColor('#004AAD'),
                            ),
                          ),
                          SizedBox(
                            width: 4.w,
                          ),
                          Text(
                            // 'قام بقبول طلبك في الموعد الذي طلبته',
                            notificationTitle,
                            style: TextStyle(
                              fontSize: 10.sp,
                              color: HexColor('#004AAD'),
                            ),
                          ),
                          Text(
                            // 'قام بقبول طلبك في الموعد الذي طلبته',
                            notificationBody,
                            style: TextStyle(
                              fontSize: 10.sp,
                              color: HexColor('#004AAD'),
                            ),
                          ),
                          Spacer(),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'الان',
                              style: TextStyle(
                                fontSize: 10.sp,
                                color: HexColor('#004AAD'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
