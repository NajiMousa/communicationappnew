import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:communication/screens/widgets/course_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../controller/fb_store_controller.dart';
import '../../../model/course_data_model.dart';
import '../../../pref/shread_pref.dart';

class CourseScreen extends StatefulWidget {
  const CourseScreen({Key? key}) : super(key: key);

  @override
  _CourseScreenState createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(right: 30.w),
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
                  InkWell(
                    onTap: () => setState(() {
                      selected = 0;
                    }),
                    child: Container(
                      alignment: AlignmentDirectional.center,
                      decoration: selected == 0
                          ? BoxDecoration(
                              color: HexColor('#004AAD'),
                              borderRadius: BorderRadius.all(
                                Radius.circular(25),
                              ),
                            )
                          : BoxDecoration(
                              border: Border.all(
                                color: HexColor('#004AAD'),
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(25),
                              ),
                            ),
                      child: Text(
                        'الكل',
                        style: selected == 0
                            ? TextStyle(
                                fontSize: 12.sp,
                                color: HexColor('#FAFBFD'),
                              )
                            : TextStyle(
                                fontSize: 12.sp,
                                color: HexColor('#004AAD'),
                              ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => setState(() {
                      selected = 1;
                    }),
                    child: Container(
                      alignment: AlignmentDirectional.center,
                      decoration: selected == 1
                          ? BoxDecoration(
                              color: HexColor('#004AAD'),
                              borderRadius: BorderRadius.all(
                                Radius.circular(25),
                              ),
                            )
                          : BoxDecoration(
                              border: Border.all(
                                color: HexColor('#004AAD'),
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(25),
                              ),
                            ),
                      child: Text(
                        'المفضلة',
                        style: selected == 1
                            ? TextStyle(
                                fontSize: 12.sp,
                                color: HexColor('#FAFBFD'),
                              )
                            : TextStyle(
                                fontSize: 12.sp,
                                color: HexColor('#004AAD'),
                              ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => setState(() {
                      selected = 2;
                    }),
                    child: Container(
                      alignment: AlignmentDirectional.center,
                      decoration: selected == 2
                          ? BoxDecoration(
                              color: HexColor('#004AAD'),
                              borderRadius: BorderRadius.all(
                                Radius.circular(25),
                              ),
                            )
                          : BoxDecoration(
                              border: Border.all(
                                color: HexColor('#004AAD'),
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(25),
                              ),
                            ),
                      child: Text(
                        'حضوري',
                        style: selected == 2
                            ? TextStyle(
                                fontSize: 12.sp,
                                color: HexColor('#FAFBFD'),
                              )
                            : TextStyle(
                                fontSize: 12.sp,
                                color: HexColor('#004AAD'),
                              ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => setState(() {
                      selected = 3;
                    }),
                    child: Container(
                      alignment: AlignmentDirectional.center,
                      decoration: selected == 3
                          ? BoxDecoration(
                              color: HexColor('#004AAD'),
                              borderRadius: BorderRadius.all(
                                Radius.circular(25),
                              ),
                            )
                          : BoxDecoration(
                              border: Border.all(
                                color: HexColor('#004AAD'),
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(25),
                              ),
                            ),
                      child: Text(
                        'أونلاين',
                        style: selected == 3
                            ? TextStyle(
                                fontSize: 12.sp,
                                color: HexColor('#FAFBFD'),
                              )
                            : TextStyle(
                                fontSize: 12.sp,
                                color: HexColor('#004AAD'),
                              ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20.h,),
          StreamBuilder<QuerySnapshot>(
            stream: FbStoreController().readCourse(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
                List<QueryDocumentSnapshot> docu = snapshot.data!.docs;
                List<QueryDocumentSnapshot> docuA = [];
                List<QueryDocumentSnapshot> requestDataModelActive = [];
                List<QueryDocumentSnapshot> requestDataModelClose = [];
                List<QueryDocumentSnapshot> requestDataModelCansle = [];

                for (int i = 0; i < docu.length; i++) {
                  print('for');
                  if (docu[i].get('phoneUser') ==
                      SharedPrefController().phone) {
                    print('If');
                    docuA.add(docu[i]);
                  }
                }
                for (int i = 0; i < docuA.length; i++) {
                  print('for');
                  if (docuA[i].get('requestStatus') == 'Active' ||
                      docuA[i].get('requestStatus') == 'Accept' ||
                      docuA[i].get('requestStatus') == 'payment' ||
                      docuA[i].get('requestStatus') == 'ActiveFinch') {
                    print('If');
                    requestDataModelActive.add(docuA[i]);
                  } else if (docuA[i].get('requestStatus') == 'AcceptFinch' ||
                      docuA[i].get('requestStatus') == 'ending') {
                    print('If');
                    requestDataModelClose.add(docuA[i]);
                  } else if (docuA[i].get('requestStatus') == 'Cancel') {
                    print('If');
                    requestDataModelCansle.add(docuA[i]);
                  }
                }
                return Expanded(
                  child: ListView.builder(
                    itemCount: docu.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(right: 30.w, left: 30.w),
                        child: Column(
                          children: [
                            CouurseWidget(
                                courseDataModel:
                                    mapCourseDataModelMethod(docu[index])),
                            SizedBox(
                              height: 12.h,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              } else {
                return Center(
                  child: Column(
                    children: const [
                      Icon(
                        Icons.signal_cellular_nodata,
                        size: 85,
                      ),
                      Text('No Data'),
                    ],
                  ),
                );
              }
            },
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
}
