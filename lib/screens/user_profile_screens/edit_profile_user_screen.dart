import 'package:communication/controller/fb_store_controller.dart';
import 'package:communication/model/all_user_data_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../pref/shread_pref.dart';
import '../nav_user_screens/main_screen.dart';
import '../translator_screens/nav_translator_screens/main_translator_screen.dart';

class EditProfileUserScreen extends StatefulWidget {
  const EditProfileUserScreen({Key? key}) : super(key: key);

  @override
  _EditProfileUserScreenState createState() => _EditProfileUserScreenState();
}

class _EditProfileUserScreenState extends State<EditProfileUserScreen> {
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
          'تعديل الملف الشخصي',
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
                height: 800.h,
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
                        label: Text(
                          'ألياس محمود',
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
                            controller: dateOfBirthDTextController,
                            decoration: InputDecoration(
                              label: Text(
                                'يوم',
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
                        Expanded(
                          child: TextField(
                            controller: dateOfBirthMTextController,
                            decoration: InputDecoration(
                              label: Text(
                                'شهر',
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
                        Expanded(
                          child: TextField(
                            controller: dateOfBirthYTextController,
                            decoration: InputDecoration(
                              label: Text(
                                'سنة',
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
                        Container(
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
                            primary: HexColor('#004AAD'),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          onPressed: () {},
                          child: Text(
                            'ذكر',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Spacer(),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            side: BorderSide(
                              color: HexColor('#004AAD'),
                              width: 2,
                            ),
                            minimumSize: Size(120.w, 48.h),
                            primary: HexColor('#FAFBFD'),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          onPressed: () {},
                          child: Text(
                            'أنثى',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: HexColor('#004AAD'),
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
                      controller: hourPriceTextController,
                      decoration: InputDecoration(
                        label: Text(
                          '10 ريال',
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
              // Align(
              //   alignment: Alignment.bottomCenter,
              //   child: Container(
              //     width: double.infinity,
              //     height: 120.h,
              //     decoration: BoxDecoration(
              //       color: HexColor('#004AAD'),
              //       borderRadius: BorderRadius.only(
              //         topLeft: Radius.circular(25),
              //         topRight: Radius.circular(25),
              //       )
              //     ),
              //   ),
              // ),
            ],
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
                  controller: emailTextController,
                  decoration: InputDecoration(
                    label: Text(
                      'ahmed.jamal.1996@gmail.com',
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
                  'بيانات الموقع',
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
                            'سنة',
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
                    Container(
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
                  onPressed: () =>  performSaveData(),
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

  late TextEditingController fullNameTextController;

  late TextEditingController shorTDescriptionTextController;

  late TextEditingController dateOfBirthDTextController;

  late TextEditingController dateOfBirthMTextController;

  late TextEditingController dateOfBirthYTextController;

  late TextEditingController hourPriceTextController;

  late TextEditingController emailTextController;

  late TextEditingController locationTextController;

  String gender = 'male';

  String dateOfBirthTextController='';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fullNameTextController = TextEditingController();
    shorTDescriptionTextController = TextEditingController();
    dateOfBirthDTextController = TextEditingController();
    dateOfBirthMTextController = TextEditingController();
    dateOfBirthYTextController = TextEditingController();
    hourPriceTextController = TextEditingController();
    emailTextController = TextEditingController();
    locationTextController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    fullNameTextController.dispose();
    shorTDescriptionTextController.dispose();
    dateOfBirthDTextController.dispose();
    dateOfBirthMTextController.dispose();
    dateOfBirthYTextController.dispose();
    hourPriceTextController.dispose();
    emailTextController.dispose();
    locationTextController.dispose();
    super.dispose();
  }

  Future<void> performSaveData() async {
    print('Begin Perform');
    if (await checkData()) {
      print('perform log in');
      await saveData();
    }
  }

  Future<bool> checkData() async {
    if (fullNameTextController.text.isNotEmpty &&
        shorTDescriptionTextController.text.isNotEmpty &&
        dateOfBirthDTextController.text.isNotEmpty &&
        dateOfBirthMTextController.text.isNotEmpty &&
        dateOfBirthYTextController.text.isNotEmpty &&
        hourPriceTextController.text.isNotEmpty &&
        emailTextController.text.isNotEmpty &&
        locationTextController.text.isNotEmpty) {
      setState(() {
        dateOfBirthTextController =
            dateOfBirthDTextController.text.toString() +'/'+ dateOfBirthMTextController.text.toString() +'/'+
                dateOfBirthYTextController.text.toString();
      });
      print('Begin CheckData True');
      return true;
    }
    print('CheckData False');
    return false;
  }

  Future<void> saveData() async {
    try {
      if(SharedPrefController().firstTimeAddData){
        print('Begin SaveData');
        setState(() {
        });
        print(SharedPrefController().firstTimeAddData);
        SharedPrefController().phone;
        AllUserDataModel allUserDataModel = AllUserDataModel(
            SharedPrefController().phone,
            fullNameTextController.text.toString(),
            shorTDescriptionTextController.text.toString(),
            dateOfBirthTextController,
            gender,
            hourPriceTextController.text.toString(),
            emailTextController.text.toString(),
            locationTextController.text.toString(),
            locationTextController.text.toString());
        FbStoreController().addDataUser(allUserDataModel: allUserDataModel);
      }
      else{
        print('Else');
        print(SharedPrefController().firstTimeAddData);
      }

      print(SharedPrefController().firstTimeAddData && SharedPrefController().firstTimeAddData);
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
      }
    } catch (e) {
      print(e);
    }
  }
}
