// import 'dart:html';
// import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:communication/pref/shread_pref.dart';
import 'package:communication/screens/nav_user_screens/job_screen.dart';
import 'package:communication/screens/nav_user_screens/main_screen.dart';
import 'package:communication/screens/user_profile_screens/user_profile_screen.dart';
import 'package:communication/screens/widgets/course_widget.dart';
import 'package:communication/screens/widgets/job_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../controller/fb_storage_controller.dart';
import '../../controller/fb_store_controller.dart';
import '../../controller/notification_controller.dart';
import '../../model/all_user_data_model.dart';
import '../../model/course_data_model.dart';
import '../../model/job_data_model.dart';
import '../user_profile_screens/edit_profile_user_screen.dart';
import 'main_map_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key , required this.allUserDataModel,required this.listLatLng,required this.listAllUserData}) : super(key: key);

  AllUserDataModel allUserDataModel;
  List<AllUserDataModel> listAllUserData;
  List<LatLng> listLatLng;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  // String fullName = '';
  List<JobDataModel> listJob = [];
  List<CourseDataModel> listCourse = [];
  @override
  void initState() {
    // TODO: implement initState
    // fullName = widget.allUserDataModel.fullName;
    // print(widget.allUserDataModel.fullName);
    getData();
    print('listCourse.length');
    print(listCourse.length);
    print('listJob.length');
    print(listJob.length);
    print(SharedPrefController().name);
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#FAFBFD'),
      body: ListView(
        padding: EdgeInsets.only(
          top: 25.h,
        ),
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: InkWell(
              onTap: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          UserProfileScreen(allUserDataModel: widget.allUserDataModel)),
                );
              },
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
                              )
                          );
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
          ),
          SizedBox(
            height: 24.h,
          ),
          CarouselSlider.builder(
            itemCount: 15,
            itemBuilder:
                (BuildContext context, int itemIndex, int pageViewIndex) =>
                    Container(
              // margin: EdgeInsets.symmetric(horizontal: 14.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: Image.asset(
                'images/slider.png',
                fit: BoxFit.fill,
              ),
            ),
            options: CarouselOptions(
              height: 200,
              aspectRatio: 12 / 12,
              viewportFraction: 0.8,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              // onPageChanged: callbackFunction,
              scrollDirection: Axis.horizontal,
            ),
          ),
          SizedBox(
            height: 6.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 24.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color: HexColor('#004AAD'),
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
              ),
              SizedBox(
                width: 6.w,
              ),
              Container(
                width: 12.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color: HexColor('#E5ECF6'),
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
              ),
              SizedBox(
                width: 6.w,
              ),
              Container(
                width: 12.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color: HexColor('#E5ECF6'),
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 24.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
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
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          MainMapScreen(listAllUserData: widget.listAllUserData, listLatLng: widget.listLatLng),
                    ),
                  ),
                  // onPressed: () => NotificationController.showNotification(
                  //     title: 'naji',
                  //     body: 'Hello Naji',
                  //     payload: 'naji.abs'
                  // ),
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
                        'بحث عن مترجمين',
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
                SharedPrefController().firstTimeAddData
                    ? ElevatedButton(
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
                        onPressed: () async {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditProfileUserScreen(
                                  title: 'create', allUserDataModel: null),
                            ),
                          );
                          setState(() {
                            SharedPrefController()
                                .setFirstTime(firstTimeAdd: false);
                          });
                        },
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
                              'قم بأستكمال ملفك الشخصي',
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: HexColor('#004AAD'),
                              ),
                            ),
                          ],
                        ),
                      )
                    : SizedBox(
                        height: 1.h,
                      ),
                SizedBox(
                  height: 24.h,
                ),
                Row(
                  children: [
                    Text(
                      'اخر الدورات',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: HexColor('#004AAD'),
                      ),
                    ),
                    Spacer(
                      flex: 10,
                    ),
                    InkWell(
                      // onTap: () => cruuentPageIndex=1;
                      child: Text(
                        'المزيد',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: HexColor('#AD6300'),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 16,
                      color: HexColor('#AD6300'),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12.h,
                ),
                // FutureBuilder<List<CourseDataModel>>(
                //   future: FbStoreController().getCourse(),
                //   builder: (context, snapshot) {
                //   if(snapshot.hasData){
                //     if(snapshot.data!.isNotEmpty){
                //       return CouurseWidget(courseDataModel: listCourse[0],);
                //     }
                //     else{
                //       return Center(
                //         child: Text(
                //           "لا يوجد دورات حتى الان",
                //           style: TextStyle(color: Colors.black, fontSize: 20.sp),
                //         ),
                //       );
                //     }
                //   } else{
                //     return Center(
                //       child: CircularProgressIndicator(),
                //     );
                //   }
                // },),
                // CouurseWidget(courseDataModel: listCourse[0],),
                SizedBox(
                  height: 24.h,
                ),
                Row(
                  children: [
                    Text(
                      'اخر الوظائف',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: HexColor('#004AAD'),
                      ),
                    ),
                    Spacer(
                      flex: 10,
                    ),
                    Text(
                      'المزيد',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: HexColor('#AD6300'),
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 16,
                      color: HexColor('#AD6300'),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12.h,),
                // FutureBuilder<List<CourseDataModel>>(
                //   future: FbStoreController().getCourse(),
                //   builder: (context, snapshot) {
                //     if(snapshot.hasData){
                //       if(snapshot.data!.isNotEmpty){
                //         return JobWidget(jobDataModel: listJob[0]);
                //       }
                //       else{
                //         return Center(
                //           child: Text(
                //             "لا يوجد وظائف حتى الان",
                //             style: TextStyle(color: Colors.black, fontSize: 20.sp),
                //           ),
                //         );
                //       }
                //     } else{
                //       return Center(
                //         child: CircularProgressIndicator(),
                //       );
                //     }
                //   },),
                  // JobWidget(jobDataModel: listJob[0]),
                SizedBox(
                  height: 30.h,
                )
              ],
            ),
          ),

        ],
      ),
    );
  }

  CourseDataModel mapCourseDataModelMethod(
      QueryDocumentSnapshot documentSnapshot) {
    CourseDataModel courseDataModel = CourseDataModel();
    courseDataModel.id = documentSnapshot['id'];
    courseDataModel.courseName = documentSnapshot['courseName'];
    courseDataModel.hourNumber = documentSnapshot['hourNumber'];
    courseDataModel.userLike = documentSnapshot['userLike'];
    courseDataModel.courseStatus = documentSnapshot['courseStatus'];
    courseDataModel.location = documentSnapshot['location'];
    courseDataModel.addDate = documentSnapshot['addDate'];
    courseDataModel.courseInfo = documentSnapshot['courseInfo'];
    courseDataModel.courseContent = documentSnapshot['courseContent'];
    courseDataModel.whatLearnInCourse = documentSnapshot['whatLearnInCourse'];
    courseDataModel.courseDate = documentSnapshot['courseDate'];
    courseDataModel.courseType = documentSnapshot['courseType'];
    courseDataModel.courseTriner = documentSnapshot['courseTriner'];
    courseDataModel.trinerInfo = documentSnapshot['trinerInfo'];
    courseDataModel.courseLink = documentSnapshot['courseLink'];
    return courseDataModel;
  }

  JobDataModel mapJobDataModel(QueryDocumentSnapshot documentSnapshot) {
    // عشان ناخذ البيانات نعرضها من اجل التحديث عليها
    JobDataModel requestDataModel = JobDataModel();
    requestDataModel.id = documentSnapshot.id;
    requestDataModel.jobName = documentSnapshot.get('jobName');
    requestDataModel.expertiseYear = documentSnapshot.get('expertiseYear');
    requestDataModel.jobStatus = documentSnapshot.get('jobStatus');
    requestDataModel.location = documentSnapshot.get('location');
    requestDataModel.addDate = documentSnapshot.get('addDate');
    requestDataModel.tasks = documentSnapshot.get('tasks');
    requestDataModel.conditions = documentSnapshot.get('conditions');
    requestDataModel.jobTitle = documentSnapshot.get('jobTitle');
    requestDataModel.lastDate = documentSnapshot.get('lastDate');
    requestDataModel.jobType = documentSnapshot.get('jobType');
    requestDataModel.level = documentSnapshot.get('level');
    requestDataModel.salary = documentSnapshot.get('salary');
    requestDataModel.degree = documentSnapshot.get('degree');
    requestDataModel.jobLink = documentSnapshot.get('jobLink');
    return requestDataModel;
  }

  void getData() async{
    print('startGetData');
    listJob = await FbStoreController().getJob();
    print('listJob.length');
    print(listJob.length);
    listCourse = await FbStoreController().getCourse();
    print('listCourse.length');
    print(listCourse.length);
  }
}
