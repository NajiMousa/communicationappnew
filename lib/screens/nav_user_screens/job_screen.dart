import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:communication/model/job_data_model.dart';
import 'package:communication/screens/tabbar_screen/learn_screens/book_screen.dart';
import 'package:communication/screens/tabbar_screen/learn_screens/course_screen.dart';
import 'package:communication/screens/widgets/job_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../controller/fb_store_controller.dart';
import '../../pref/shread_pref.dart';

class JobScreen extends StatefulWidget {
   JobScreen({Key? key ,}) : super(key: key);

  @override
  _JobScreenState createState() => _JobScreenState();
}

class _JobScreenState extends State<JobScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#FAFBFD'),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 40.h,
            decoration: BoxDecoration(
                color: HexColor('#004AAD'),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                )),
          ),
          StreamBuilder<QuerySnapshot>(
            stream: FbStoreController().readJob(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
                List<QueryDocumentSnapshot> docu = snapshot.data!.docs;
                return ListView.builder(
                  itemCount: docu.length,
                  padding: EdgeInsets.only(top: 15.h, right: 30.w, left: 30.w),
                  itemBuilder: (context, index) {
                    return JobWidget(
                      jobDataModel: mapJobDataModel(docu[index]),
                    );
                  },
                );
              } else {
                return Center(
                  child: Column(
                    children:  [
                      SizedBox(height: 60.h,),
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
}
