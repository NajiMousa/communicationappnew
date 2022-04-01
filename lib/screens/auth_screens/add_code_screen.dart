import 'package:communication/controller/fb_store_controller.dart';
import 'package:communication/model/user_model.dart';
import 'package:communication/pref/shread_pref.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../helpers/helpers.dart';
import '../nav_user_screens/main_screen.dart';
import '../translator_screens/nav_translator_screens/main_translator_screen.dart';

class AddCodeScreen extends StatefulWidget {
  AddCodeScreen(
      {Key? key,
      required this.verificationId,
      required this.userRegisterationModel,
      required this.signOrLogin})
      : super(key: key);

  String verificationId = '';
  UserRegisterationModel userRegisterationModel;
  bool signOrLogin;

  @override
  _AddCodeScreenState createState() => _AddCodeScreenState();
}

class _AddCodeScreenState extends State<AddCodeScreen> with Helpers {
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
          'استعادة الحساب',
          style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
        ),
      ),
      backgroundColor: HexColor('#FAFBFD'),
      body: ListView(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                // padding: EdgeInsets.only(
                //     top: 40.h, right: 77.w, left: 77.w, bottom: 58.h),
                width: double.infinity,
                height: 100.h,
                decoration: BoxDecoration(
                  color: HexColor('#004AAD'),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(25),
                    topLeft: Radius.circular(25),
                  ),
                ),
              ),
              Stack(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                        top: 40.h, right: 77.w, left: 77.w, bottom: 58.h),
                    width: double.infinity,
                    height: 350.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(25),
                        bottomLeft: Radius.circular(25),
                      ),
                    ),
                    child: Image.asset(
                      'images/addCode.png',
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(
                        top: 270.h, right: 30.w, left: 30.w, bottom: 40.h),
                    padding:
                        EdgeInsets.only(top: 15.h, right: 20.w, left: 20.w),
                    width: double.infinity,
                    height: 312.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(25),
                      ),
                    ),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'خطوة أخرى بعد',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: HexColor('#004AAD'),
                          ),
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        Text(
                          'لقد ارسلنا لك على رقم الهاتف الذي أضفته رمز تحقق يتكون من أربعة \nأرقام يرجى منك تزويدنا بها ',
                          style: TextStyle(
                            fontSize: 10.sp,
                            color: HexColor('#004AAD'),
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          'رمز التحقق',
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
                          controller: codeTextEditingController,
                          decoration: InputDecoration(
                            label: Text(
                              'ادخل رمز التحقق هنا',
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
                          onPressed: () async {
                            await performSendCode();
                          },
                          child: Text(
                            'تأكيد الرمز',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 14.h,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            'أعادة أرسال الرمز ؟',
                            style: TextStyle(
                              fontSize: 10.sp,
                              color: HexColor('#004AAD'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  late TextEditingController codeTextEditingController;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    codeTextEditingController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    codeTextEditingController.dispose();
    super.dispose();
  }

  Future<void> performSendCode() async {
    print('bigen performSendCode');
    if (await checkData()) {
      sendCode();
    }
  }

  Future<bool> checkData() async {
    print('bigen checkData');
    if (codeTextEditingController.text.isNotEmpty) {
      print('true');
      return true;
    }
    showSnackBar(
      context: context,
      message: 'قم باضافة رمز التحقق',
      error: true,
    );
    print('false');
    return false;
  }

//
  Future<void> sendCode() async {
    print(codeTextEditingController.text);
    print('bigen sendCode');
    PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
        verificationId: widget.verificationId,
        smsCode: codeTextEditingController.text.toString());
    print(codeTextEditingController.text.toString());
    print('01');
      await _firebaseAuth.signInWithCredential(phoneAuthCredential).then(
      (value) async {
        // setState(() {
        //   // loding=false;
        // });
        print('02');
        if (widget.signOrLogin) {
          FbStoreController()
              .addUser(userRegisterationModel: widget.userRegisterationModel);
          print(widget.userRegisterationModel.phone);
          SharedPrefController().saveData(
              phone: widget.userRegisterationModel.phone,
              typeUser: widget.userRegisterationModel.userType);
        }
        print('if user');
        if (widget.signOrLogin) {
          FbStoreController()
              .addUser(userRegisterationModel: widget.userRegisterationModel);
        }
        print('02');
        if (widget.userRegisterationModel.userType == 'user') {
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
      },).whenComplete(
           () async {},
     );
  }
}
