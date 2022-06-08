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
import '../../pref/shread_pref.dart';
import '../nav_user_screens/main_screen.dart';
import '../translator_screens/nav_translator_screens/main_translator_screen.dart';

class EditProfileUserScreen extends StatefulWidget {
  EditProfileUserScreen({
    Key? key,
    this.title = 'create',
    this.allUserDataModel,
  }) : super(key: key);

  final String title;

  final AllUserDataModel? allUserDataModel;

  @override
  _EditProfileUserScreenState createState() => _EditProfileUserScreenState();
}

class _EditProfileUserScreenState extends State<EditProfileUserScreen>
    with Helpers {
  late TextEditingController fullNameTextController;

  late TextEditingController shorTDescriptionTextController;

  late TextEditingController dateOfBirthTextController;

  late TextEditingController hourPriceTextController;

  late TextEditingController emailTextController;

  late TextEditingController locationTextController;

  String gender = 'male';

  String phoneG = SharedPrefController().phone;

  late String locationMap;

  DateTime selectedDate = DateTime.now();

  ImagePicker _imagePicker = ImagePicker();
  XFile? _pickedFile;
  double? _linearProgressValue = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fullNameTextController =
        TextEditingController(text: widget.allUserDataModel?.fullName ?? '');
    shorTDescriptionTextController = TextEditingController(
        text: widget.allUserDataModel?.shorTDescription ?? '');
    dateOfBirthTextController =
        TextEditingController(text: widget.allUserDataModel?.dateOfBirth ?? '');
    gender = widget.allUserDataModel?.gender ?? '';
    hourPriceTextController =
        TextEditingController(text: widget.allUserDataModel?.hourPrice ?? '');
    emailTextController =
        TextEditingController(text: widget.allUserDataModel?.email ?? '');
    locationTextController =
        TextEditingController(text: widget.allUserDataModel?.location ?? '');
    print(widget.allUserDataModel);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    fullNameTextController.dispose();
    shorTDescriptionTextController.dispose();
    dateOfBirthTextController.dispose();
    hourPriceTextController.dispose();
    emailTextController.dispose();
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
          widget.title,
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
                height: 57.h,
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
                padding: EdgeInsets.only(
                    top: 20.h, right: 25.w, left: 25.w, bottom: 20.h),
                alignment: Alignment.center,
                width: double.infinity,
                height: 903.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'خطوة رائعة',
                      style: TextStyle(
                        fontSize: 18.sp,
                        color: HexColor('#004AAD'),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      'ملأ بيانات و أكمال ملفك الشخصي يساعد الأخرين في التعرف عليك \nبشكل أفضل و يزيد من فرص ظهورك أمام الاخرين',
                      style: TextStyle(
                        fontSize: 10.sp,
                        color: HexColor('#004AAD'),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    LinearProgressIndicator(
                      minHeight: 10,
                      color: Colors.green,
                      backgroundColor: Colors.blue.shade200,
                      value: _linearProgressValue,
                    ),
                    SizedBox(
                      height: 10.h,
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
                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      'الاسم كاملا',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: HexColor('#004AAD'),
                      ),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    TextField(
                      controller: fullNameTextController,
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
                      'وصف مختصر',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: HexColor('#004AAD'),
                      ),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    TextField(
                      controller: shorTDescriptionTextController,
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
                      maxLines: 4,
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      'تاريخ الميلاد',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: HexColor('#004AAD'),
                      ),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            keyboardType: TextInputType.phone,
                            enabled: false,
                            controller: dateOfBirthTextController,
                            decoration: InputDecoration(
                              label: Text(
                                selectedDate.year.toString() +
                                    '/' +
                                    selectedDate.month.toString() +
                                    '/' +
                                    selectedDate.day.toString(),
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
                              // enabledBorder: OutlineInputBorder(
                              //   borderSide: BorderSide(
                              //     color: HexColor('#004AAD'),
                              //   ),
                              //   borderRadius: BorderRadius.circular(15.0),
                              // ),
                              disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: HexColor('#004AAD'),
                                ),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 6.w,
                        ),
                        InkWell(
                          onTap: () => _selectDate(context),
                          child: Container(
                            width: 52.h,
                            height: 52.h,
                            decoration: BoxDecoration(
                              color: HexColor('#004AAD'),
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                            ),
                            child: Icon(
                              Icons.date_range,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    Text(
                      'يمكنك اختيار تاريخ ميلادك بدلا من كتابته من خلال الايقونة في الجهة اليسرى',
                      style: TextStyle(
                        fontSize: 9.sp,
                        color: HexColor('#004AAD'),
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      'الجنس',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: HexColor('#004AAD'),
                      ),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Row(
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(120.w, 48.h),
                            side: gender == 'female'
                                ? BorderSide(
                                    color: HexColor('#004AAD'),
                                    width: 2,
                                  )
                                : const BorderSide(),
                            primary: gender == 'male'
                                ? HexColor('#004AAD')
                                : Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              gender = 'male';
                            });
                          },
                          child: Text(
                            'ذكر',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: gender == 'female'
                                  ? HexColor('#004AAD')
                                  : Colors.white,
                            ),
                          ),
                        ),
                        Spacer(),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            side: gender == 'male'
                                ? BorderSide(
                                    color: HexColor('#004AAD'),
                                    width: 2,
                                  )
                                : const BorderSide(),
                            minimumSize: Size(120.w, 48.h),
                            primary: gender == 'female'
                                ? HexColor('#004AAD')
                                : Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              gender = 'female';
                            });
                          },
                          child: Text(
                            'أنثى',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: gender == 'male'
                                  ? HexColor('#004AAD')
                                  : Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    Text(
                      'يمكنك اختيار أي منهما من خلال الضغط عليه سيكون الاختيار ذكر بشكل افتراضي اذا لم\n تقم بالتغيير ',
                      style: TextStyle(
                        fontSize: 8.sp,
                        color: HexColor('#004AAD'),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      'سعر ساعة العمل',
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
                      controller: hourPriceTextController,
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
                  ],
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 10.h, right: 30.w, left: 30.w),
            padding: EdgeInsets.only(
                top: 20.h, right: 25.w, left: 25.w, bottom: 20.h),
            alignment: Alignment.center,
            width: double.infinity,
            height: 225.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(25),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'بيانات التواصل',
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: HexColor('#004AAD'),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  'تساعد بيانات الاتصال و التواصل على ابقاءك ضمن دائرة المجتمع \nويزيد من قدرتك على التواصل مع الاخرين و الوصول لك ',
                  style: TextStyle(
                    fontSize: 10.sp,
                    color: HexColor('#004AAD'),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  'البريد الالكتروني',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: HexColor('#004AAD'),
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  controller: emailTextController,
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
              ],
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          Container(
            margin: EdgeInsets.only(top: 10.h, right: 30.w, left: 30.w),
            padding: EdgeInsets.only(
                top: 20.h, right: 25.w, left: 25.w, bottom: 20.h),
            alignment: Alignment.center,
            width: double.infinity,
            // height: 320.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(25),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  // widget.location,
                  '',
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: HexColor('#004AAD'),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  'تحديد موقعك يشجع الاخرين على التواصل معك حيث يولون الأهمية \nأحيانا للشخص الأقرب و الأكفأ ',
                  style: TextStyle(
                    fontSize: 10.sp,
                    color: HexColor('#004AAD'),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  'موقعك',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: HexColor('#004AAD'),
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: locationTextController,
                        decoration: InputDecoration(
                          label: Text(
                            'جازان',
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
                    ),
                    SizedBox(
                      width: 6.w,
                    ),
                    InkWell(
                      onTap: () => Navigator.pushNamed(context, '/map_screen'),
                      child: Container(
                        width: 52.h,
                        height: 52.h,
                        decoration: BoxDecoration(
                          color: HexColor('#004AAD'),
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        child: Icon(
                          Icons.location_searching,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 6.h,
                ),
                Text(
                  'يمكنك اختيار موقعك بدلا من كتابته من خلال الايقونة في الجهة اليسرى قد يتطلب الامر \n تشغيل تحديد الموقع لهاتفك',
                  style: TextStyle(
                    fontSize: 8.sp,
                    color: HexColor('#004AAD'),
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
                  onPressed: () => performProcess(),
                  child: Text(
                    'حفظ التغيير',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
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
    if (fullNameTextController.text.isNotEmpty &&
        shorTDescriptionTextController.text.isNotEmpty &&
        hourPriceTextController.text.isNotEmpty &&
        emailTextController.text.isNotEmpty &&
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
    print(SharedPrefController().latitude);
    print(SharedPrefController().longtude);
    print(widget.allUserDataModel);
    bool status = widget.allUserDataModel == null
        ? await FbStoreController()
            .create(allUserDataModel: allUserDataModelMethod)
        : await FbStoreController()
            .update(allUserDataModel: allUserDataModelMethod);
    print(fullNameTextController.text);
    print('startProcessEndIf');
    if (status) {
      print(status);
      print('startStatus');
      print(widget.allUserDataModel);
      if (SharedPrefController().typeUser == 'user') {
        print('user');
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (BuildContext context) => MainScreen()),
          ModalRoute.withName('/'),
        );
      } else {
        print('other');
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => MainTranslatorScreen()),
          ModalRoute.withName('/'),
        );
        // if(widget.allUserDataModel != null) {
        //   Navigator.pop(context);
        // } else {
        //   clear();
        // }
      }
    }

    ///showSnackBar(context : context , message : status ? 'Process Success' : 'Process Failed', error : true);
  }

  AllUserDataModel get allUserDataModelMethod {
    print('startGet');
    AllUserDataModel allUserDataModel = widget.allUserDataModel == null
        ? AllUserDataModel()
        : widget.allUserDataModel!;
    print('01');
    allUserDataModel.id = SharedPrefController().phone + 'user';
    print('02');
    allUserDataModel.phone = phoneG;
    print('03');
    allUserDataModel.fullName = fullNameTextController.text;
    print('04');
    allUserDataModel.shorTDescription = shorTDescriptionTextController.text;
    print('05');
    allUserDataModel.dateOfBirth = selectedDate.year.toString() +
        '/' +
        selectedDate.month.toString() +
        '/' +
        selectedDate.day.toString();
    print('06');
    allUserDataModel.gender = gender;
    print('07');
    allUserDataModel.hourPrice = hourPriceTextController.text;
    print('08');
    allUserDataModel.email = emailTextController.text;
    print('09');
    allUserDataModel.location = locationTextController.text;
    print('10');
    allUserDataModel.latitude = SharedPrefController().latitude;
    print('11');
    allUserDataModel.longtude = SharedPrefController().longtude;
    print('12');
    allUserDataModel.image = _pickedFile.toString();
    print('13');
    print(_pickedFile.toString());
    performUpload();
    print('14');
    print('endGet');
    print(allUserDataModel);
    // TranslatorMapGetxController().addUser(allUserDataModel);
    return allUserDataModel;
  }


  void clear() {
    fullNameTextController.text = '';
    shorTDescriptionTextController.text = '';
    dateOfBirthTextController.text = '';
    hourPriceTextController.text = '';
    gender = 'male';
    emailTextController.text = '';
    locationTextController.text = '';
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

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

//
//   Future<void> performSaveData() async {
//     print('Begin Perform');
//     if (await checkData()) {
//       print('perform log in');
//       await saveData();
//     }
//   }
//
//   bool checkDateOfBirth() {
//     if (dateOfBirthDTextController.text.isNotEmpty &&
//         dateOfBirthMTextController.text.isNotEmpty &&
//         dateOfBirthYTextController.text.isNotEmpty) {
//       print('fffffffff');
//       var dayNumber = int.parse(dateOfBirthDTextController.text);
//       var mNumber = int.parse(dateOfBirthMTextController.text);
//       var yearNumber = int.parse(dateOfBirthYTextController.text);
//       print(dayNumber);
//       print(mNumber);
//       print(yearNumber);
//       if ((dayNumber > 0 && dayNumber < 32) &&
//           (mNumber > 0 && mNumber < 13) &&
//           (yearNumber > 1970)) {
//         print(yearNumber);
//         setState(() {
//           dateOfBirthTextController =
//               dateOfBirthDTextController.text.toString() +
//                   '/' +
//                   dateOfBirthMTextController.text.toString() +
//                   '/' +
//                   dateOfBirthYTextController.text.toString();
//         });
//         print('checkDateOfBirthTrue');
//         return true;
//       } else {
//         showSnackBar(
//             context: context,
//             message: 'تاكد من اضافة تاريخ ميلادك بشكل صحيح',
//             error: true);
//         print('checkDateOfBirthFalse');
//         return false;
//       }
//     }
//     return false;
//   }
//
//   Future<bool> checkData() async {
//     if (checkDateOfBirth()) {
//       if (fullNameTextController.text.isNotEmpty &&
//           shorTDescriptionTextController.text.isNotEmpty &&
//           hourPriceTextController.text.isNotEmpty &&
//           emailTextController.text.isNotEmpty &&
//           locationTextController.text.isNotEmpty) {
//         print('Begin CheckData True');
//         return true;
//       }
//     }
//     showSnackBar(
//         context: context,
//         message: 'تاكد من ملأ جميع المربعات السابقة',
//         error: true);
//     print('CheckData False');
//     return false;
//   }
//
//   Future<void> saveData() async {
//     try {
//       if (!SharedPrefController().firstTimeAddData) {
//         print('Begin SaveData');
//         SharedPrefController().phone;
//         AllUserDataModel allUserDataModel = AllUserDataModel(
//             SharedPrefController().phone,
//             fullNameTextController.text.toString(),
//             shorTDescriptionTextController.text.toString(),
//             dateOfBirthTextController,
//             gender,
//             hourPriceTextController.text.toString(),
//             emailTextController.text.toString(),
//             locationTextController.text.toString(),
//             locationTextController.text.toString());
//         FbStoreController().addDataUser(allUserDataModel: allUserDataModel);
//
//         setState(() {
//           SharedPrefController().setFirstTime(firstTimeAdd: true);
//         });
//         showSnackBar(
//             context: context, message: 'تم حفظ بياناتك بنجاح', error: false);
//
//         if (SharedPrefController().typeUser == 'user') {
//           print('user');
//           Navigator.pushAndRemoveUntil(
//             context,
//             MaterialPageRoute(builder: (BuildContext context) => MainScreen()),
//             ModalRoute.withName('/'),
//           );
//         } else {
//           print('other');
//           Navigator.pushAndRemoveUntil(
//             context,
//             MaterialPageRoute(
//                 builder: (BuildContext context) => MainTranslatorScreen()),
//             ModalRoute.withName('/'),
//           );
//         }
//       } else {
//         print('Else');
//         List<AllUserDataModel> userOfDataList =
//             await FbStoreController().getDataUser();
//         for (int i = 0; i < userOfDataList.length; i++) {
//           if (userOfDataList[i].phone == SharedPrefController().phone) {
//             print(SharedPrefController().phone);
//             userOfDataListG = userOfDataList;
//             showSnackBar(
//               context: context,
//               message: 'قم بتحديث بياناتك',
//               error: false,
//             );
//             // setState(() {
//             //   loading = true;
//             // });
//             // return true;
//           }
//         }
//       }
//     } catch (e) {
//       print(e);
//     }
//   }
// }

}
