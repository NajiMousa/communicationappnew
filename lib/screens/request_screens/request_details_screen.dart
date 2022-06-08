
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:communication/screens/nav_user_screens/map_screen.dart';
import 'package:communication/screens/request_screens/add_request_screen.dart';
import 'package:communication/screens/tabbar_screen/learn_screens/book_screen.dart';
import 'package:communication/screens/tabbar_screen/learn_screens/course_screen.dart';
import 'package:communication/screens/widgets/job_widget.dart';
import 'package:communication/screens/widgets/request_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../controller/fb_store_controller.dart';
import '../../model/request_data_model.dart';
import '../../pref/shread_pref.dart';

class RequestDetailsScreen extends StatefulWidget {
  RequestDetailsScreen({Key? key, required this.requestDataModel})
      : super(key: key);

  RequestDataModel requestDataModel;

  @override
  _RequestDetailsScreenState createState() => _RequestDetailsScreenState();
}

class _RequestDetailsScreenState extends State<RequestDetailsScreen> {
  bool selected = false;
  bool hidden = false;
  int selectedA = 0;

  late String status;

  @override
  void initState() {
    print(widget.requestDataModel.userName);
    print(widget.requestDataModel.translaterName);
    // TODO: implement initState
    status = widget.requestDataModel.requestStatus;
    super.initState();
  }

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
        // toolbarHeight: 140.h,
        backgroundColor: HexColor('#004AAD'),
        title: Text(
          'تفاصيل الطلب',
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
                height: 192.h,
                decoration: BoxDecoration(
                  color: HexColor('#004AAD'),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 12.h, right: 30.w, left: 30.w),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        Text(
                          'العميل',
                          style:
                              TextStyle(fontSize: 12.sp, color: Colors.white),
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        CircleAvatar(
                          maxRadius: 25.h,
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              // 'ليلى المنصور',
                              // widget.requestDataModel.phoneUser,
                              // SharedPrefController().name,
                              widget.requestDataModel.userName,
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              widget.requestDataModel.phoneUser,
                              style: TextStyle(
                                fontSize: 10.sp,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        Text(
                          'المترجم',
                          style:
                              TextStyle(fontSize: 12.sp, color: Colors.white),
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        CircleAvatar(
                          maxRadius: 25.h,
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              // 'ليلى المنصور',
                              widget.requestDataModel.translaterName,
                              // SharedPrefController().name,
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              widget.requestDataModel.phoneTranslater,
                              style: TextStyle(
                                fontSize: 10.sp,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    Container(
                      padding:
                          EdgeInsets.only(top: 24.h, right: 30.w, left: 30.w),
                      width: double.infinity,
                      height: 400.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(25),
                        ),
                      ),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              'تفاصيل الطلب',
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: HexColor('#004AAD'),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 13.h,
                          ),
                          Row(
                            children: [
                              Column(
                                children: [
                                  Text(
                                    'حالة الطلب',
                                    style: TextStyle(
                                      fontSize: 10.sp,
                                      color: HexColor('#004AAD'),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 9.h,
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    width: 106.w,
                                    height: 28.h,
                                    decoration: BoxDecoration(
                                      color: widget.requestDataModel
                                                  .requestStatus ==
                                              'Cancel'
                                          ? Colors.red
                                          : widget.requestDataModel
                                                      .requestStatus ==
                                                  'AcceptFinch'
                                              ? Colors.black
                                              : Colors.green,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(5),
                                      ),
                                    ),
                                    child: Text(
                                      // 'قيد التنفيذ',
                                      widget.requestDataModel.requestStatus,
                                      style: TextStyle(
                                        fontSize: 10.sp,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Spacer(),
                              Column(
                                children: [
                                  Text(
                                    'عدد ساعات الحجز',
                                    style: TextStyle(
                                      fontSize: 10.sp,
                                      color: HexColor('#004AAD'),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 9.h,
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    width: 106.w,
                                    height: 28.h,
                                    decoration: BoxDecoration(
                                      color: HexColor('#C3D6EF'),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(5),
                                      ),
                                    ),
                                    child: Text(
                                      // '3 ساعات',
                                      widget.requestDataModel.hour,
                                      style: TextStyle(
                                        fontSize: 10.sp,
                                        color: HexColor('#004AAD'),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 19.h,
                          ),
                          Row(
                            children: [
                              Column(
                                children: [
                                  Text(
                                    'تاريخ الطلب',
                                    style: TextStyle(
                                      fontSize: 10.sp,
                                      color: HexColor('#004AAD'),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 9.h,
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    width: 106.w,
                                    height: 28.h,
                                    decoration: BoxDecoration(
                                      color: HexColor('#C3D6EF'),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(5),
                                      ),
                                    ),
                                    child: Text(
                                      // 'الثلاثاء 02/01/2022',
                                      widget.requestDataModel.dateOfCreate,
                                      style: TextStyle(
                                        fontSize: 10.sp,
                                        color: HexColor('#004AAD'),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Spacer(),
                              Column(
                                children: [
                                  Text(
                                    'تاريخ الالتقاء',
                                    style: TextStyle(
                                      fontSize: 10.sp,
                                      color: HexColor('#004AAD'),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 9.h,
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    width: 106.w,
                                    height: 28.h,
                                    decoration: BoxDecoration(
                                      color: HexColor('#C3D6EF'),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(5),
                                      ),
                                    ),
                                    child: Text(
                                      // 'الخميس 04/01/2022',
                                      widget.requestDataModel.dateOfMeeting,
                                      style: TextStyle(
                                        fontSize: 10.sp,
                                        color: HexColor('#004AAD'),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 19.h,
                          ),
                          Row(
                            children: [
                              Column(
                                children: [
                                  Text(
                                    'موعد اللقاء',
                                    style: TextStyle(
                                      fontSize: 10.sp,
                                      color: HexColor('#004AAD'),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 9.h,
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    width: 106.w,
                                    height: 28.h,
                                    decoration: BoxDecoration(
                                      color: HexColor('#C3D6EF'),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(5),
                                      ),
                                    ),
                                    child: Text(
                                      // '02:00 PM',
                                      widget.requestDataModel.timeOfMeeting,
                                      style: TextStyle(
                                        fontSize: 10.sp,
                                        color: HexColor('#004AAD'),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Spacer(),
                              Column(
                                children: [
                                  Text(
                                    'مكان اللقاء',
                                    style: TextStyle(
                                      fontSize: 10.sp,
                                      color: HexColor('#004AAD'),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 9.h,
                                  ),
                                  InkWell(
                                    onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => MapScreen(
                                            requestDataModel:
                                                widget.requestDataModel),
                                      ),
                                    ),
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: 106.w,
                                      height: 28.h,
                                      decoration: BoxDecoration(
                                        color: HexColor('#004AAD'),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(5),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.location_on,
                                            size: 18.h,
                                            color: Colors.white,
                                          ),
                                          SizedBox(
                                            width: 2.w,
                                          ),
                                          Text(
                                            'انتقل للخريطة',
                                            style: TextStyle(
                                              fontSize: 10.sp,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 19.h,
                          ),
                          Text(
                            'وصف الطلب',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 10.sp,
                              color: HexColor('#004AAD'),
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: double.infinity,
                            height: 75.h,
                            decoration: BoxDecoration(
                              color: HexColor('#C3D6EF'),
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              ),
                            ),
                            child: Text(
                              // 'التشبيك والتنسيق والتعاون مع مجموعات الدعم الذاتي بما يضمن\n وصولهم للخدمات ومشاركتهم الفاعلة في أنشطة المشروع لمشاركة\n بفعالية في حملات الضغط والمناصرة التي تنظمها جمعية الثقافة\n والفكر الحر لتحسين واقع الاشخاص ذوي الاعاقة',
                              widget.requestDataModel.shorTDescription,
                              style: TextStyle(
                                fontSize: 9.sp,
                                color: HexColor('#004AAD'),
                              ),
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
          Padding(
              padding: EdgeInsets.only(
                  top: 18.h, right: 30.w, left: 30.w, bottom: 30.h),
              child: selected == 2
                  ? Center(
                      child: Column(
                        children: [
                          Text(
                            'لقد قام احدكما بألغاء هذا الطلب من قبل لا يمكنك التراجع عن ذلك ',
                            style: TextStyle(
                              fontSize: 18.sp,
                              color: Colors.black,
                            ),
                          ),
                          // Image.asset('images/aa.png'),
                        ],
                      ),
                    )
                  : status == 'Active'
                      ? Column(
                          children: [
                            selected
                                ? SizedBox(
                                    height: 1.h,
                                  )

                                /// الغاء الطلب العميل
                                : ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      minimumSize: Size(double.infinity, 48.h),
                                      primary: HexColor('#004AAD'),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                    onPressed: () async {
                                      setState(() {
                                        selected = true;
                                        selectedA = 2;
                                      });
                                      await FbStoreController().updateRequest(
                                          requestDataModel: requestDataModelA);
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                          'ألغاء الطلب',
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
                            selected
                                ? SizedBox(
                                    height: 1.h,
                                  )

                                /// تعديل الطلب العميل
                                : ElevatedButton(
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
                                      setState(() {
                                        // selected = true;
                                        // selectedA = 3;
                                      });
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                AddRequestScreen(
                                                    title: 'update',
                                                    requestDataModel: widget
                                                        .requestDataModel),
                                          ));
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                          'تعديل الطلب',
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                            color: HexColor('#004AAD'),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                            SizedBox(
                              height: 10.h,
                            ),
                          ],
                        )
                      : status == 'Accept'
                          ? Column(children: [
                              selected
                                  ? SizedBox(
                                      height: 1.h,
                                    )

                                  /// رسالة اتمام الدفع العميل
                                  : ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        elevation: 0,
                                        side: BorderSide(
                                          color: HexColor('#004AAD'),
                                          width: 2,
                                        ),
                                        minimumSize:
                                            Size(double.infinity, 48.h),
                                        primary: HexColor('#FAFBFD'),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                      ),
                                      onPressed: () async {
                                        hidden
                                            ? SizedBox(
                                                height: 1.h,
                                              )
                                            : showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return AlertDialog(
                                                    content: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Image.asset(
                                                            'images/user.png'),
                                                        Text(
                                                          'تذكير',
                                                          style: TextStyle(
                                                              fontSize: 28.sp),
                                                        ),
                                                        Text(
                                                          'المبلغ سوف يبقى  في المنصة لحين انهاء الحجز من كلا الطرفين المترجم و العميل ',
                                                          style: TextStyle(
                                                              fontSize: 14.sp),
                                                        ),
                                                        SizedBox(
                                                          height: 10.h,
                                                        ),
                                                        ElevatedButton(
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                            elevation: 0,
                                                            side: BorderSide(
                                                              color: HexColor(
                                                                  '#004AAD'),
                                                              width: 2,
                                                            ),
                                                            minimumSize: Size(
                                                                double.infinity,
                                                                48.h),
                                                            primary: HexColor(
                                                                '#FAFBFD'),
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15),
                                                            ),
                                                          ),
                                                          onPressed: () async {
                                                            setState(() {
                                                              selected = true;
                                                              selectedA = 3;
                                                            });
                                                            await FbStoreController()
                                                                .updateRequest(
                                                                    requestDataModel:
                                                                        requestDataModelA);
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Icon(
                                                                Icons
                                                                    .accessibility_sharp,
                                                                size: 20,
                                                                color: HexColor(
                                                                    '#004AAD'),
                                                              ),
                                                              SizedBox(
                                                                width: 10.w,
                                                              ),
                                                              Text(
                                                                'أتمام الدفع',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize:
                                                                      14.sp,
                                                                  color: HexColor(
                                                                      '#004AAD'),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 10.h,
                                                        ),
                                                        ElevatedButton(
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                            elevation: 0,
                                                            side: BorderSide(
                                                              color: HexColor(
                                                                  '#004AAD'),
                                                              width: 2,
                                                            ),
                                                            minimumSize: Size(
                                                                double.infinity,
                                                                48.h),
                                                            primary: HexColor(
                                                                '#FAFBFD'),
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15),
                                                            ),
                                                          ),
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                            setState(() {
                                                              selected = false;
                                                            });
                                                          },
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Icon(
                                                                Icons
                                                                    .accessibility_sharp,
                                                                size: 20,
                                                                color: HexColor(
                                                                    '#004AAD'),
                                                              ),
                                                              SizedBox(
                                                                width: 10.w,
                                                              ),
                                                              Text(
                                                                'الغاء',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize:
                                                                      14.sp,
                                                                  color: HexColor(
                                                                      '#004AAD'),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                });
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
                                            'تأكيد و دفع',
                                            style: TextStyle(
                                              fontSize: 14.sp,
                                              color: HexColor('#004AAD'),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                              SizedBox(
                                height: 15.h,
                              ),
                              selected
                                  ? SizedBox(
                                      height: 1.h,
                                    )
                                  : ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        elevation: 0,
                                        side: BorderSide(
                                          color: HexColor('#004AAD'),
                                          width: 2,
                                        ),
                                        minimumSize:
                                            Size(double.infinity, 48.h),
                                        primary: HexColor('#FAFBFD'),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                      ),
                                      onPressed: () async {
                                        setState(() {
                                          selected = true;
                                          selectedA = 2;
                                        });
                                        await FbStoreController().updateRequest(
                                            requestDataModel:
                                                requestDataModelA);
                                        Navigator.pop(context);
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
                                            'ألغاء الحجز',
                                            style: TextStyle(
                                              fontSize: 14.sp,
                                              color: HexColor('#004AAD'),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                            ])
                          : status == 'ActiveFinch'
                              ? Column(children: [
                                  selected
                                      ? SizedBox(
                                          height: 1.h,
                                        )

                                      /// رسالة الموافقة على انهاء الطلب االعميل
                                      : ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            elevation: 0,
                                            side: BorderSide(
                                              color: HexColor('#004AAD'),
                                              width: 2,
                                            ),
                                            minimumSize:
                                                Size(double.infinity, 48.h),
                                            primary: HexColor('#FAFBFD'),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                          ),
                                          onPressed: () async {
                                            showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return AlertDialog(
                                                    content: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Image.asset(
                                                            'images/user.png'),
                                                        Text(
                                                          'تاكيد',
                                                          style: TextStyle(
                                                              fontSize: 28.sp),
                                                        ),
                                                        Text(
                                                          'بمجرد موافقتك على طلب انهاء الحجز يمكنك تقييم المترجم و  يستطيع المترجم استلام مستحقاته المضافة في المنصة من خلالك ',
                                                          style: TextStyle(
                                                              fontSize: 14.sp),
                                                        ),
                                                        SizedBox(
                                                          height: 10.h,
                                                        ),
                                                        ElevatedButton(
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                            elevation: 0,
                                                            side: BorderSide(
                                                              color: HexColor(
                                                                  '#004AAD'),
                                                              width: 2,
                                                            ),
                                                            minimumSize: Size(
                                                                double.infinity,
                                                                48.h),
                                                            primary: HexColor(
                                                                '#FAFBFD'),
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15),
                                                            ),
                                                          ),
                                                          onPressed: () async {
                                                            setState(() {
                                                              selected = true;
                                                              selectedA = 5;
                                                            });
                                                            await FbStoreController()
                                                                .updateRequest(
                                                                    requestDataModel:
                                                                        requestDataModelA);
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Icon(
                                                                Icons
                                                                    .accessibility_sharp,
                                                                size: 20,
                                                                color: HexColor(
                                                                    '#004AAD'),
                                                              ),
                                                              SizedBox(
                                                                width: 10.w,
                                                              ),
                                                              Text(
                                                                'انهاء الطلب',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize:
                                                                      14.sp,
                                                                  color: HexColor(
                                                                      '#004AAD'),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 10.h,
                                                        ),
                                                        ElevatedButton(
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                            elevation: 0,
                                                            side: BorderSide(
                                                              color: HexColor(
                                                                  '#004AAD'),
                                                              width: 2,
                                                            ),
                                                            minimumSize: Size(
                                                                double.infinity,
                                                                48.h),
                                                            primary: HexColor(
                                                                '#FAFBFD'),
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15),
                                                            ),
                                                          ),
                                                          onPressed: () async {
                                                            Navigator.pop(
                                                                context);
                                                            setState(() {
                                                              selected = false;
                                                            });
                                                          },
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Icon(
                                                                Icons
                                                                    .accessibility_sharp,
                                                                size: 20,
                                                                color: HexColor(
                                                                    '#004AAD'),
                                                              ),
                                                              SizedBox(
                                                                width: 10.w,
                                                              ),
                                                              Text(
                                                                'الغاء',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize:
                                                                      14.sp,
                                                                  color: HexColor(
                                                                      '#004AAD'),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                });
                                          },
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
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
                                                'انهاء الطلب',
                                                style: TextStyle(
                                                  fontSize: 14.sp,
                                                  color: HexColor('#004AAD'),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                ])
                              : status == 'AcceptFinch'
                                  ? Column(children: [
                                      selected
                                          ? SizedBox(
                                              height: 1.h,
                                            )

                                          /// تقييم المترجم من االعميل
                                          : ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                elevation: 0,
                                                side: BorderSide(
                                                  color: HexColor('#004AAD'),
                                                  width: 2,
                                                ),
                                                minimumSize:
                                                    Size(double.infinity, 48.h),
                                                primary: HexColor('#FAFBFD'),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                ),
                                              ),
                                              onPressed: () async {},
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
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
                                                    'تقييم',
                                                    style: TextStyle(
                                                      fontSize: 14.sp,
                                                      color:
                                                          HexColor('#004AAD'),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                    ])
                                  : SizedBox())
        ],
      ),
    );
  }

  RequestDataModel get requestDataModelA {
    print('startGet');
    RequestDataModel requestDataModelA = RequestDataModel();
    print('01');
    requestDataModelA.id = widget.requestDataModel.id;
    print('02');
    requestDataModelA.location = widget.requestDataModel.location;
    print('03');
    requestDataModelA.timeOfMeeting = widget.requestDataModel.timeOfMeeting;
    print('04');
    requestDataModelA.shorTDescription =
        widget.requestDataModel.shorTDescription;
    print('05');
    requestDataModelA.dateOfMeeting = widget.requestDataModel.dateOfMeeting;
    print('06');
    print('selected');
    print(selected);
    requestDataModelA.requestStatus = selectedA == 1
        ? 'Accept'
        : selectedA == 2
            ? 'Cancel'
            : selectedA == 3
                ? 'payment'
                : selectedA == 4
                    ? 'ActiveFinch'
                    : selectedA == 5
                        ? 'AcceptFinch'
                        : 'Active';
    print('07');
    requestDataModelA.phoneTranslater = widget.requestDataModel.phoneTranslater;
    print('08');
    requestDataModelA.dateOfCreate = widget.requestDataModel.dateOfCreate;
    print('09');
    requestDataModelA.latitude = widget.requestDataModel.latitude;
    print('10');
    requestDataModelA.longtude = widget.requestDataModel.longtude;
    print('11');
    requestDataModelA.phoneUser = widget.requestDataModel.phoneUser;
    print('12');
    requestDataModelA.translaterName = widget.requestDataModel.translaterName;
    print('13');
    requestDataModelA.userName = widget.requestDataModel.userName;
    print('14');
    print(widget.requestDataModel.hour.toString());
    requestDataModelA.hour = widget.requestDataModel.hour.toString();
    print('15');
    print('endGet');
    print(requestDataModelA);
    print(requestDataModelA.requestStatus);
    return requestDataModelA;
  }
}
