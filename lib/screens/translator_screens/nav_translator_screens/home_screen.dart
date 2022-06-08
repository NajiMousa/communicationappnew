// import 'dart:html';
// import 'dart:ui';

import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../controller/fb_storage_controller.dart';
import '../../../model/all_user_data_model.dart';
import '../../../pref/shread_pref.dart';
import '../../user_profile_screens/edit_profile_user_screen.dart';
import '../../user_profile_screens/user_profile_screen.dart';

class HomeTranslatorScreen extends StatefulWidget {
  HomeTranslatorScreen({Key? key,required this.allUserDataModel}) : super(key: key);

  AllUserDataModel allUserDataModel;

  @override
  _HomeTranslatorScreenState createState() => _HomeTranslatorScreenState();
}

class _HomeTranslatorScreenState extends State<HomeTranslatorScreen> {
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
            height: 30.h,
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
          Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: SharedPrefController().firstTimeAddData
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
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 20.h, right: 30.w, left: 30.w),
            child: ConstrainedBox(
              constraints:
                  BoxConstraints(maxHeight: 500.h, minWidth: double.infinity),
              child: GridView.builder(
                itemCount: 5,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 15.h,
                  crossAxisSpacing: 15.w,
                  childAspectRatio: 150 / 230,
                ),
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          color: HexColor('#EBF0F8'),
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            height: 150.h,
                            child: Image.asset('images/blog_small.png'),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Text(
                            'ضعف تعليم الصم..؟\n الأسباب والحلول',
                            style: TextStyle(
                              fontSize: 10.sp,
                              color: HexColor('#004AAD'),
                            ),
                          )
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
