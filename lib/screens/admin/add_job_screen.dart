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
import '../../model/job_data_model.dart';
import '../../pref/shread_pref.dart';
import '../nav_user_screens/main_screen.dart';
import '../translator_screens/nav_translator_screens/main_translator_screen.dart';

class AddJobScreen extends StatefulWidget {
  AddJobScreen({Key? key,}) : super(key: key);

  @override
  _AddJobScreenState createState() => _AddJobScreenState();
}

class _AddJobScreenState extends State<AddJobScreen>
    with Helpers {

  late TextEditingController jobNameTextController ;
  late TextEditingController hourNumberTextController ;
  late TextEditingController jobLinkTextController ;
  late TextEditingController degreeTextController ;
  late TextEditingController salaryTextController ;
  late TextEditingController levelTextController ;
  late TextEditingController jobTypeTextController ;
  late TextEditingController lastDateTextController ;
  late TextEditingController jobTitleTextController ;
  late TextEditingController conditionsTextController ;
  late TextEditingController tasksTextController ;
  late TextEditingController locationTextController ;

  DateTime selectedDate = DateTime.now();

  ImagePicker _imagePicker = ImagePicker();
  XFile? _pickedFile;
  double? _linearProgressValue = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    jobNameTextController  = TextEditingController();
    hourNumberTextController  = TextEditingController();
    jobLinkTextController  = TextEditingController();
    degreeTextController  = TextEditingController();
    salaryTextController  = TextEditingController();
    levelTextController  = TextEditingController();
    jobTypeTextController  = TextEditingController();
    lastDateTextController  = TextEditingController();
    jobTitleTextController  = TextEditingController();
    conditionsTextController  = TextEditingController();
    tasksTextController  = TextEditingController();
    locationTextController  = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    jobNameTextController.dispose();
    hourNumberTextController.dispose();
    jobLinkTextController.dispose();
    degreeTextController.dispose();
    salaryTextController.dispose();
    levelTextController.dispose();
    jobTypeTextController.dispose();
    lastDateTextController.dispose();
    jobTitleTextController.dispose();
    conditionsTextController.dispose();
    tasksTextController.dispose();
    locationTextController.dispose();
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
          'أضافة وظيفة جديدة',
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
                        'أسم الوظيفة',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: HexColor('#004AAD'),
                        ),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      TextField(
                        controller: jobNameTextController,
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
                        'عدد سنوات الخبرة المطلوبة',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: HexColor('#004AAD'),
                        ),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      TextField(
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
                        'مكان التوظيف',
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
                        'المهام المطلوبة',
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
                        controller: tasksTextController,
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
                        'الشروط',
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
                        controller: conditionsTextController,
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
                        'المسمى الوظيفي',
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
                        controller: jobTitleTextController,
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
                        'اخر موعد للتقديم',
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
                        controller: lastDateTextController,
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
                        'نوع الوظيفة',
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
                        controller: jobTypeTextController,
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
                        'المستوى',
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
                        controller: levelTextController,
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
                        'الراتب بالدولار',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: HexColor('#004AAD'),
                        ),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      TextField(
                        keyboardType: TextInputType.phone,
                        controller: salaryTextController,
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
                        'الدرجة العلمية',
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
                        controller: degreeTextController,
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
                        'رابط التسجيل',
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
                        controller: jobLinkTextController,
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
    if (jobNameTextController.text.isNotEmpty &&
        jobLinkTextController.text.isNotEmpty &&
        jobTitleTextController.text.isNotEmpty &&
        jobTypeTextController.text.isNotEmpty &&
        degreeTextController.text.isNotEmpty &&
        salaryTextController.text.isNotEmpty &&
        levelTextController.text.isNotEmpty &&
        lastDateTextController.text.isNotEmpty &&
        conditionsTextController.text.isNotEmpty &&
        tasksTextController.text.isNotEmpty &&
        hourNumberTextController.text.isNotEmpty &&
        locationTextController.text.isNotEmpty) {
      print('startCheckDataTrue');
      return true;
    }
    showSnackBar(context: context, message: 'Enter required Data', error: true);
    print('startCheckDataFalse');
    return false;
  }

  Future<void> process() async {
    print('startProcess');
    bool status = await FbStoreController()
            .createJob(jobDataModel:mapJobDataModel ,);

    print('startProcessEndIf');
    if (status) {
      print(status);
      print('startStatus');
      Navigator.pop(context);
    }

    ///showSnackBar(context : context , message : status ? 'Process Success' : 'Process Failed', error : true);
  }

  JobDataModel get mapJobDataModel{
    // عشان ناخذ البيانات نعرضها من اجل التحديث عليها
    JobDataModel jobDataModelMethod = JobDataModel();
    // requestDataModel.id =
    jobDataModelMethod.jobName = jobTypeTextController.text;
    jobDataModelMethod.expertiseYear = hourNumberTextController.text;
    jobDataModelMethod.jobStatus = 'open';
    jobDataModelMethod.location = locationTextController.text;
    jobDataModelMethod.addDate = selectedDate.year.toString() + '/' + selectedDate.month.toString() + '/' + selectedDate.day.toString();
    jobDataModelMethod.tasks = tasksTextController.text;
    jobDataModelMethod.conditions = conditionsTextController.text;
    jobDataModelMethod.jobTitle = jobTitleTextController.text;
    jobDataModelMethod.lastDate = lastDateTextController.text;
    jobDataModelMethod.jobType = jobTypeTextController.text;
    jobDataModelMethod.level = levelTextController.text;
    jobDataModelMethod.salary = salaryTextController.text;
    jobDataModelMethod.degree = degreeTextController.text;
    jobDataModelMethod.jobLink = jobLinkTextController.text;
    return jobDataModelMethod;
  }


  void clear() {
    jobNameTextController.text = '';
    hourNumberTextController.text = '';
    jobLinkTextController.text = '';
    degreeTextController.text = '';
    salaryTextController.text = '';
    levelTextController.text = '';
    jobTypeTextController.text = '';
    lastDateTextController.text = '';
    jobTitleTextController.text = '';
    conditionsTextController.text = '';
    tasksTextController.text = '';
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

  Future<void> performUpload() async{
    print('startPerformUpload');
    if(checkDataImage()){
      await uploadImage();
    }
  }
  bool checkDataImage(){
    print('startCheckDataImage');
    if(_pickedFile != null){
      print('true');
      return true;
    }
    // ShowSnackBar()
    print('false');
    return false;
  }

  Future<void> uploadImage() async{
    print('startUploadImage');
    _changeProgressValue(value: null);
    FbStorageController().uploadImage(path: _pickedFile!.path);
  }

  void _changeProgressValue({double? value}){
    setState(() {
      _linearProgressValue = value;
    });
  }
}
