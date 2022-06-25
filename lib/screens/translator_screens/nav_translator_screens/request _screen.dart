import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:communication/controller/fb_store_controller.dart';
import 'package:communication/model/request_data_model.dart';
import 'package:communication/pref/shread_pref.dart';
import 'package:communication/screens/translator_screens/request_details_translator_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../controller/fb_storage_controller.dart';
import '../../request_screens/request_details_screen.dart';

class RequestTranslatorScreen extends StatefulWidget {
  RequestTranslatorScreen({
    Key? key,
  }) : super(key: key);

  @override
  _RequestTranslatorScreenState createState() =>
      _RequestTranslatorScreenState();
}

class _RequestTranslatorScreenState extends State<RequestTranslatorScreen> {
  int selected = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        'قيد التنفيذ',
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
                        'منتهية',
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
                        'ملغية',
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
          SizedBox(
            height: 16.h,
          ),
          StreamBuilder<QuerySnapshot>(
            stream: FbStoreController().readRequest(),
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
                  print('SharedPrefController().phone');
                  print(SharedPrefController().phone);
                  print('SharedPrefController().name');
                  print(SharedPrefController().tranlatorName);
                  if (docu[i].get('phoneTranslater') ==
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
                    itemCount:
                        // docuA.length,
                        selected == 0
                            ? docuA.length
                            : selected == 1
                                ? requestDataModelActive.length
                                : selected == 2
                                    ? requestDataModelClose.length
                                    : selected == 3
                                        ? requestDataModelCansle.length
                                        : 0,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  RequestDetailsTranslatorScreen(
                                      requestDataModel:
                                          mapRequestDataModel(docuA[index])),
                            ),
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.only(
                              right: 30.w, left: 30.w, bottom: 16.h),
                          child: InkWell(
                            child: Container(
                              padding: EdgeInsets.only(
                                  top: 10.h,
                                  right: 20.w,
                                  left: 20.w,
                                  bottom: 15.h),
                              width: double.infinity,
                              height: 92.h,
                              decoration: BoxDecoration(
                                color: HexColor('#004AAD'),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        maxRadius: 15.h,
                                        child: Stack(
                                          children: [
                                            FutureBuilder<String>(
                                              future: FbStorageController()
                                                  .readImage(
                                                name: selected == 0
                                                    ? docuA[index]
                                                        .get('phoneUser')
                                                    : selected == 1
                                                        ? requestDataModelActive[
                                                                index]
                                                            .get('phoneUser')
                                                        : selected == 2
                                                            ? requestDataModelClose[
                                                                    index]
                                                                .get(
                                                                    'phoneUser')
                                                            : selected == 3
                                                                ? requestDataModelCansle[
                                                                        index]
                                                                    .get(
                                                                        'phoneUser')
                                                                : '',
                                              ),
                                              builder: (context, snapshot) {
                                                if (snapshot.hasData) {
                                                  return CircleAvatar(
                                                      radius: 30.r,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      child: ClipOval(
                                                        child: Image.network(
                                                          snapshot.data
                                                              .toString(),
                                                          fit: BoxFit.cover,
                                                          height: 60.h,
                                                          width: 60.w,
                                                        ),
                                                      ));
                                                } else {
                                                  return CircleAvatar(
                                                      radius: 30.r,
                                                      backgroundColor:
                                                          Colors.transparent,
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
                                            Align(
                                              alignment: AlignmentDirectional
                                                  .bottomEnd,
                                              child: Container(
                                                alignment:
                                                    AlignmentDirectional.center,
                                                width: 11.w,
                                                height: 11.h,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(15),
                                                  ),
                                                ),
                                                child: Text(
                                                  '4.1',
                                                  style: TextStyle(
                                                    fontSize: 6.sp,
                                                    color: HexColor('#004AAD'),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      Text(
                                        // allUserDataModel[index].fullName,
                                        // docu[index].get('userName'),
                                        selected == 0
                                            ? docuA[index].get('userName')
                                            : selected == 1
                                                ? requestDataModelActive[index]
                                                    .get('userName')
                                                : selected == 2
                                                    ? requestDataModelClose[
                                                            index]
                                                        .get('userName')
                                                    : selected == 3
                                                        ? requestDataModelCansle[
                                                                index]
                                                            .get('userName')
                                                        : '',
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Spacer(),
                                      Container(
                                        width: 64.w,
                                        height: 18.h,
                                        alignment: AlignmentDirectional.center,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(5),
                                          ),
                                        ),
                                        child: Text(
                                          // docu[index].get('requestStatus'),
                                          selected == 0
                                              ? docuA[index]
                                                  .get('requestStatus')
                                              : selected == 1
                                                  ? requestDataModelActive[
                                                          index]
                                                      .get('requestStatus')
                                                  : selected == 2
                                                      ? requestDataModelClose[
                                                              index]
                                                          .get('requestStatus')
                                                      : selected == 3
                                                          ? requestDataModelCansle[
                                                                  index]
                                                              .get(
                                                                  'requestStatus')
                                                          : '',
                                          style: TextStyle(
                                            fontSize: 8.sp,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Divider(
                                    color: HexColor('#82B1EF'),
                                    thickness: 1,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 10.w, right: 10.w),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.location_on,
                                          size: 12.h,
                                          color: HexColor('#82B1EF'),
                                        ),
                                        SizedBox(
                                          width: 4.w,
                                        ),
                                        Text(
                                          // docu[index].get('location'),
                                          selected == 0
                                              ? docuA[index].get('location')
                                              : selected == 1
                                                  ? requestDataModelActive[
                                                          index]
                                                      .get('location')
                                                  : selected == 2
                                                      ? requestDataModelClose[
                                                              index]
                                                          .get('location')
                                                      : selected == 3
                                                          ? requestDataModelCansle[
                                                                  index]
                                                              .get('location')
                                                          : '',
                                          style: TextStyle(
                                              fontSize: 8.sp,
                                              color: Colors.white),
                                        ),
                                        Spacer(),
                                        Icon(
                                          Icons.calendar_today,
                                          size: 12.h,
                                          color: HexColor('#82B1EF'),
                                        ),
                                        SizedBox(
                                          width: 4.w,
                                        ),
                                        Text(
                                          // docu[index].get('dateOfMeeting'),
                                          selected == 0
                                              ? docuA[index]
                                                  .get('dateOfMeeting')
                                              : selected == 1
                                                  ? requestDataModelActive[
                                                          index]
                                                      .get('dateOfMeeting')
                                                  : selected == 2
                                                      ? requestDataModelClose[
                                                              index]
                                                          .get('dateOfMeeting')
                                                      : selected == 3
                                                          ? requestDataModelCansle[
                                                                  index]
                                                              .get(
                                                                  'dateOfMeeting')
                                                          : '',
                                          style: TextStyle(
                                              fontSize: 8.sp,
                                              color: Colors.white),
                                        ),
                                        Spacer(),
                                        Icon(
                                          Icons.lock_clock,
                                          size: 12.h,
                                          color: HexColor('#82B1EF'),
                                        ),
                                        SizedBox(
                                          width: 4.w,
                                        ),
                                        Text(
                                          // docu[index].get('timeOfMeeting'),
                                          selected == 0
                                              ? docuA[index]
                                                  .get('timeOfMeeting')
                                              : selected == 1
                                                  ? requestDataModelActive[
                                                          index]
                                                      .get('timeOfMeeting')
                                                  : selected == 2
                                                      ? requestDataModelClose[
                                                              index]
                                                          .get('timeOfMeeting')
                                                      : selected == 3
                                                          ? requestDataModelCansle[
                                                                  index]
                                                              .get(
                                                                  'timeOfMeeting')
                                                          : '',
                                          style: TextStyle(
                                              fontSize: 8.sp,
                                              color: Colors.white),
                                        ),
                                        Spacer(),
                                        Icon(
                                          Icons.keyboard_arrow_down_sharp,
                                          color: HexColor('#82B1EF'),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
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

  RequestDataModel mapRequestDataModel(QueryDocumentSnapshot documentSnapshot) {
    // عشان ناخذ البيانات نعرضها من اجل التحديث عليها
    RequestDataModel requestDataModel = RequestDataModel();
    requestDataModel.id = documentSnapshot.id;
    requestDataModel.phoneUser = documentSnapshot.get('phoneUser');
    requestDataModel.longtude = documentSnapshot.get('longtude');
    requestDataModel.latitude = documentSnapshot.get('latitude');
    requestDataModel.dateOfCreate = documentSnapshot.get('dateOfCreate');
    requestDataModel.shorTDescription =
        documentSnapshot.get('shorTDescription');
    requestDataModel.dateOfMeeting = documentSnapshot.get('dateOfMeeting');
    requestDataModel.phoneTranslater = documentSnapshot.get('phoneTranslater');
    requestDataModel.timeOfMeeting = documentSnapshot.get('timeOfMeeting');
    requestDataModel.location = documentSnapshot.get('location');
    requestDataModel.requestStatus = documentSnapshot.get('requestStatus');
    requestDataModel.translaterName = documentSnapshot.get('translaterName');
    requestDataModel.userName = documentSnapshot.get('userName');
    requestDataModel.hour = documentSnapshot.get('hour');
    return requestDataModel;
  }
}
