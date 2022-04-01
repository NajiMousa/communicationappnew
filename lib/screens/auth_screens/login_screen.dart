import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../controller/fb_auth_controller.dart';
import '../../controller/fb_store_controller.dart';
import '../../helpers/helpers.dart';
import '../../model/user_model.dart';
import 'add_code_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with Helpers {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor('#004AAD'),
        title: Text(
          'تسجيل الدخول',
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
                    height: 356.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(25),
                        bottomLeft: Radius.circular(25),
                      ),
                    ),
                    child: Image.asset(
                      'images/login.png',
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(
                        top: 270.h, right: 25.w, left: 25.w, bottom: 40.h),
                    padding: EdgeInsets.only(
                        top: 15.h, right: 15.w, left: 15.w, bottom: 15.h),
                    width: double.infinity,
                    height: 320.h,
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
                          'أهلا بعودتك',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: HexColor('#004AAD'),
                          ),
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        Text(
                          'يمكنك تسجيل الدخول من خلال رقم هاتفك حال كنت مسجل\n بالفعل من قبل ',
                          style: TextStyle(
                            fontSize: 10.sp,
                            color: HexColor('#004AAD'),
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Text(
                          'رقم الهاتف',
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
                            Container(
                              height: 52.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),
                                border: Border.all(
                                  color: HexColor('#82B1EF'),
                                ),
                              ),
                              child: CountryCodePicker(
                                onChanged: _onCountryChange,
                                textStyle: TextStyle(
                                  color: HexColor('#004AAD'),
                                  fontSize: 14.sp,
                                ),
                                searchDecoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: HexColor('#004AAD'),
                                    ),
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Expanded(
                              child: TextField(
                                keyboardType: TextInputType.phone,
                                controller: phoneEditingController,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.call,
                                    color: HexColor('#004AAD'),
                                  ),
                                  label: Text(
                                    '123 456 789',
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
                          ],
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
                            performLogIn();
                          },
                          child: Text(
                            'تسجيل الدخول',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 14.h,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, '/create_account_screen');
                          },
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              'ليس لدي حساب ؟',
                              style: TextStyle(
                                fontSize: 10.sp,
                                color: HexColor('#004AAD'),
                              ),
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

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  late TextEditingController phoneEditingController;
  String verificationID = '';
  String userType = 'user';
  bool login = true;
  late String countryCodeG;
  bool loading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    phoneEditingController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    phoneEditingController.dispose();
  }

  Future<void> performLogIn() async {
    print('Begin Perform');
    if (await checkData()) {
      print('perform create account');
      await logIn();
    }
  }

  Future<bool> checkData() async {
    if (phoneEditingController.text.isNotEmpty) {
      setState(() {
        loading = true;
      });
      print('Begin CheckData');
      List<UserRegisterationModel> userList =
          await FbStoreController().getUser();
      for (int i = 0; i < userList.length; i++) {
        if (userList[i].phone ==
            countryCodeG.toString() + phoneEditingController.text) {
          print(countryCodeG.toString() + phoneEditingController.text);
          userType = userList[i].userType;
          showSnackBar(
            context: context,
            message: 'ارسلنا لك رسالة برمز التحقق',
            error: false,
          );
          setState(() {
            loading = true;
          });
          return false;
        }
      }
      print('CheckData');
      showSnackBar(
          context: context,
          message: 'ليس لديك حساب قم بانشاء حساب جديد ',
          error: true);
      return false;
    }
    showSnackBar(
        context: context, message: 'قم باضافة البيانات المطلوبة', error: true);
    return false;
  }

  Future<void> logIn() async {
    try {
      print('Begin logIn');
      _firebaseAuth.verifyPhoneNumber(
          phoneNumber: countryCodeG.toString() + phoneEditingController.text,
          verificationCompleted: (AuthCredential credential) async {
            print(countryCodeG.toString() + phoneEditingController.text);
            await _firebaseAuth.signInWithCredential(credential);
          },
          verificationFailed: (FirebaseAuthException exception) {
            print(exception.message);
          },
          codeSent: (String verificationId, int? forceResendingToken) {
            verificationID = verificationId;
            UserRegisterationModel userRegisterationModel =
                UserRegisterationModel(
                    countryCodeG.toString() + phoneEditingController.text,
                    userType);
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => AddCodeScreen(
                  signOrLogin: login,
                  verificationId: verificationID,
                  userRegisterationModel: userRegisterationModel,
                ),
              ),
            );
            print('Finish logIn');
          },
          codeAutoRetrievalTimeout: (String verificationId) {});
    } on FirebaseAuthException catch (e) {
      // _controlAuthException(context: context, e: e);
    } catch (e) {
      print(e);
    }
  }

  void _onCountryChange(CountryCode countryCode) {
    setState(() {
      countryCodeG = countryCode.toString();
    });
    print("New country selected: " + countryCode.toString());
  }
}
