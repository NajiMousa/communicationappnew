import 'dart:io';

import 'package:communication/controller/fb_store_controller.dart';
import 'package:communication/model/all_user_data_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';

import '../../controller/fb_storage_controller.dart';
import '../../controller/translator_map_getx_controller.dart';
import '../../helpers/helpers.dart';
import '../../model/course_data_model.dart';
import '../../model/job_data_model.dart';
import '../../pref/shread_pref.dart';
import '../nav_user_screens/main_screen.dart';
import '../translator_screens/nav_translator_screens/main_translator_screen.dart';

class AddCourseScreen extends StatefulWidget {
  AddCourseScreen({
    Key? key,
  }) : super(key: key);

  @override
  _AddCourseScreenState createState() => _AddCourseScreenState();
}

class _AddCourseScreenState extends State<AddCourseScreen> with Helpers {
  late TextEditingController courseNameTextController;

  late TextEditingController hourNumberTextController;

  late TextEditingController locationTextController;

  late TextEditingController courseInfoTextController;

  late TextEditingController courseContentTextController;

  late TextEditingController whatLearnInCourseTextController;

  late TextEditingController courseDateTextController;

  late TextEditingController courseTypeTextController;

  late TextEditingController courseTrinerTextController;

  late TextEditingController trinerInfoTextController;

  late TextEditingController courseLinkTextController;

  DateTime selectedDate = DateTime.now();

  ImagePicker _imagePicker = ImagePicker();
  XFile? _pickedFile;
  double? _linearProgressValue = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    courseNameTextController = TextEditingController();
    hourNumberTextController = TextEditingController();
    locationTextController = TextEditingController();
    courseInfoTextController = TextEditingController();
    courseContentTextController = TextEditingController();
    whatLearnInCourseTextController = TextEditingController();
    courseDateTextController = TextEditingController();
    courseTypeTextController = TextEditingController();
    courseTrinerTextController = TextEditingController();
    trinerInfoTextController = TextEditingController();
    courseLinkTextController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    courseNameTextController.dispose();
    hourNumberTextController.dispose();
    locationTextController.dispose();
    courseInfoTextController.dispose();
    courseContentTextController.dispose();
    whatLearnInCourseTextController.dispose();
    courseDateTextController.dispose();
    courseTypeTextController.dispose();
    courseTrinerTextController.dispose();
    trinerInfoTextController.dispose();
    courseLinkTextController.dispose();
    super.dispose();
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
        backgroundColor: HexColor('#004AAD'),
        title: Text(
          'أضافة دورة جديدة',
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
                // height: 57.h,
                decoration: BoxDecoration(
                  color: HexColor('#004AAD'),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: 10.h, right: 30.w, left: 30.w),
                  padding: EdgeInsets.only(
                      top: 20.h, right: 25.w, left: 25.w, bottom: 20.h),
                  alignment: Alignment.center,
                  width: double.infinity,
                  // height: 903.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(25),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LinearProgressIndicator(
                        minHeight: 10,
                        color: Colors.green,
                        backgroundColor: Colors.blue.shade200,
                        value: _linearProgressValue,
                      ),
                      _pickedFile != null
                          ? Image.file(
                              File(_pickedFile!.path),
                              height: 60.h,
                              width: 100.w,
                            )
                          : InkWell(
                              onTap: () {
                                print('addPhoto');
                                print(_pickedFile);
                                _pickImage();
                              },
                              child: Container(
                                // clipBehavior: Clip.antiAlias,
                                width: double.infinity,
                                height: 100.h,
                                child: Row(
                                  children: [
                                    Icon(Icons.add_a_photo_outlined),
                                    SizedBox(
                                      width: 6.w,
                                    ),
                                    Text(
                                      'أضف صورة',
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        color: HexColor('#004AAD'),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                      Text(
                        'أسم الدورة',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: HexColor('#004AAD'),
                        ),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      TextField(
                        controller: courseNameTextController,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: HexColor('#004AAD'),
                            ),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: HexColor('#004AAD'),
                            ),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Text(
                        'عدد ساعات الدورة',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: HexColor('#004AAD'),
                        ),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      TextField(
                        keyboardType: TextInputType.number,
                        controller: hourNumberTextController,
                        decoration: InputDecoration(
                          label: Text(
                            // widget.shorTDescription,
                            '',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: HexColor('#82B1EF'),
                            ),
                          ),
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: HexColor('#004AAD'),
                            ),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: HexColor('#004AAD'),
                            ),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        'مكان الدورة',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: HexColor('#004AAD'),
                        ),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      TextField(
                        keyboardType: TextInputType.text,
                        controller: locationTextController,
                        decoration: InputDecoration(
                          label: Text(
                            // widget.hourPrice,
                            '',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: HexColor('#82B1EF'),
                            ),
                          ),
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: HexColor('#004AAD'),
                            ),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: HexColor('#004AAD'),
                            ),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Text(
                        'نبذة عن الدورة',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: HexColor('#004AAD'),
                        ),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      TextField(
                        keyboardType: TextInputType.text,
                        controller: courseInfoTextController,
                        decoration: InputDecoration(
                          label: Text(
                            // widget.email,
                            '',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: HexColor('#82B1EF'),
                            ),
                          ),
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: HexColor('#004AAD'),
                            ),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: HexColor('#004AAD'),
                            ),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                        maxLines: 4,
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Text(
                        'محتويات الدورة',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: HexColor('#004AAD'),
                        ),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      TextField(
                        keyboardType: TextInputType.text,
                        controller: courseContentTextController,
                        decoration: InputDecoration(
                          label: Text(
                            // widget.email,
                            '',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: HexColor('#82B1EF'),
                            ),
                          ),
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: HexColor('#004AAD'),
                            ),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: HexColor('#004AAD'),
                            ),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                        maxLines: 4,
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Text(
                        'ماذا سيتعلم خلال الدورة',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: HexColor('#004AAD'),
                        ),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      TextField(
                        keyboardType: TextInputType.text,
                        controller: whatLearnInCourseTextController,
                        decoration: InputDecoration(
                          label: Text(
                            // widget.email,
                            '',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: HexColor('#82B1EF'),
                            ),
                          ),
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: HexColor('#004AAD'),
                            ),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: HexColor('#004AAD'),
                            ),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                        maxLines: 4,
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Text(
                        'موعد الدورة',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: HexColor('#004AAD'),
                        ),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      TextField(
                        keyboardType: TextInputType.datetime,
                        controller: courseDateTextController,
                        decoration: InputDecoration(
                          label: Text(
                            // widget.email,
                            '',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: HexColor('#82B1EF'),
                            ),
                          ),
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: HexColor('#004AAD'),
                            ),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: HexColor('#004AAD'),
                            ),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Text(
                        'نوع الدورة',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: HexColor('#004AAD'),
                        ),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      TextField(
                        keyboardType: TextInputType.text,
                        controller: courseTypeTextController,
                        decoration: InputDecoration(
                          label: Text(
                            // widget.email,
                            '',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: HexColor('#82B1EF'),
                            ),
                          ),
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: HexColor('#004AAD'),
                            ),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: HexColor('#004AAD'),
                            ),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Text(
                        'مدرب الدورة',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: HexColor('#004AAD'),
                        ),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      TextField(
                        keyboardType: TextInputType.text,
                        controller: courseTrinerTextController,
                        decoration: InputDecoration(
                          label: Text(
                            // widget.email,
                            '',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: HexColor('#82B1EF'),
                            ),
                          ),
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: HexColor('#004AAD'),
                            ),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: HexColor('#004AAD'),
                            ),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Text(
                        'نبذة عن المدرب',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: HexColor('#004AAD'),
                        ),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      TextField(
                        keyboardType: TextInputType.text,
                        controller: trinerInfoTextController,
                        decoration: InputDecoration(
                          label: Text(
                            // widget.email,
                            '',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: HexColor('#82B1EF'),
                            ),
                          ),
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: HexColor('#004AAD'),
                            ),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: HexColor('#004AAD'),
                            ),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                        maxLines: 4,
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Text(
                        'رابط الدورة',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: HexColor('#004AAD'),
                        ),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      TextField(
                        keyboardType: TextInputType.text,
                        controller: courseLinkTextController,
                        decoration: InputDecoration(
                          label: Text(
                            // widget.email,
                            '',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: HexColor('#82B1EF'),
                            ),
                          ),
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: HexColor('#004AAD'),
                            ),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: HexColor('#004AAD'),
                            ),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
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
                        onPressed: () {
                          performProcess();
                        },
                        child: Text(
                          'أضافة ',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.white,
                          ),
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
    );
  }

  Future<void> performProcess() async {
    print('startPerformProcess');
    if (checkData()) {
      await process();
    }
  }

  bool checkData() {
    print('startCheckData');
    if (courseNameTextController.text.isNotEmpty &&
        hourNumberTextController.text.isNotEmpty &&
        locationTextController.text.isNotEmpty &&
        courseInfoTextController.text.isNotEmpty &&
        courseContentTextController.text.isNotEmpty &&
        whatLearnInCourseTextController.text.isNotEmpty &&
        courseDateTextController.text.isNotEmpty &&
        courseTypeTextController.text.isNotEmpty &&
        courseTrinerTextController.text.isNotEmpty &&
        trinerInfoTextController.text.isNotEmpty &&
        courseLinkTextController.text.isNotEmpty ) {
      print('startCheckDataTrue');
      return true;
    }
    showSnackBar(context: context, message: 'Enter required Data', error: true);
    print('startCheckDataFalse');
    return false;
  }

  Future<void> process() async {
    print('startProcess');
    bool status = await FbStoreController().createCourse(
      courseDataModel: mapCourseDataModel,
    );

    print('startProcessEndIf');
    if (status) {
      print(status);
      print('startStatus');
      Navigator.pop(context);
    }

    ///showSnackBar(context : context , message : status ? 'Process Success' : 'Process Failed', error : true);
  }

  CourseDataModel get mapCourseDataModel {
    // عشان ناخذ البيانات نعرضها من اجل التحديث عليها
    CourseDataModel courseDataModel = CourseDataModel();
    // requestDataModel.id =
    courseDataModel.courseName = courseNameTextController.text;
    courseDataModel.hourNumber = hourNumberTextController.text;
    courseDataModel.userLike = '0';
    courseDataModel.courseStatus = 'open';
    courseDataModel.addDate = selectedDate.year.toString() +
        '/' +
        selectedDate.month.toString() +
        '/' +
        selectedDate.day.toString();
    courseDataModel.location = locationTextController.text;
    courseDataModel.courseInfo = courseInfoTextController.text;
    courseDataModel.courseContent = courseContentTextController.text;
    courseDataModel.whatLearnInCourse = whatLearnInCourseTextController.text;
    courseDataModel.courseDate = courseDateTextController.text;
    courseDataModel.courseType = courseTypeTextController.text;
    courseDataModel.courseTriner = courseTrinerTextController.text;
    courseDataModel.trinerInfo = trinerInfoTextController.text;
    courseDataModel.courseLink = courseLinkTextController.text;
    return courseDataModel;
  }

  void clear() {
    courseNameTextController.text = '';
    hourNumberTextController.text = '';
    locationTextController.text = '';
    courseInfoTextController.text = '';
    courseContentTextController.text = '';
    whatLearnInCourseTextController.text = '';
    courseDateTextController.text = '';
    courseTypeTextController.text = '';
    courseTrinerTextController.text = '';
    trinerInfoTextController.text = '';
    courseLinkTextController.text = '';
    locationTextController.text = '';
  }

  // Future<void> _selectDate(BuildContext context) async {
  //   final DateTime? picked = await showDatePicker(
  //       context: context,
  //       initialDate: selectedDate,
  //       firstDate: DateTime(2015, 8),
  //       lastDate: DateTime(2101));
  //   if (picked != null && picked != selectedDate) {
  //     setState(() {
  //       selectedDate = picked;
  //     });
  //   }
  // }

  Future<void> _pickImage() async {
    print('start_pickImage');
    XFile? imageFile = await _imagePicker.pickImage(
        source: ImageSource.gallery); //مصدر الصور من الاستديو الجهاز
    print('Middle_pickImage');
    if (imageFile != null) {
      print('if_pickImage');
      setState(() {
        print('setState_pickImage');
        _pickedFile = imageFile; // حتى ياخذ القيمة و يعرضها
      });
    }
  }

  Future<void> performUpload() async {
    print('startPerformUpload');
    if (checkDataImage()) {
      await uploadImage();
    }
  }

  bool checkDataImage() {
    print('startCheckDataImage');
    if (_pickedFile != null) {
      print('true');
      return true;
    }
    // ShowSnackBar()
    print('false');
    return false;
  }

  Future<void> uploadImage() async {
    print('startUploadImage');
    _changeProgressValue(value: null);
    FbStorageController().uploadImage(path: _pickedFile!.path);
  }

  void _changeProgressValue({double? value}) {
    setState(() {
      _linearProgressValue = value;
    });
  }
}
