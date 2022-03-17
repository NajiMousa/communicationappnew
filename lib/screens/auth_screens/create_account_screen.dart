import 'package:communication/controller/fb_store_controller.dart';
import 'package:communication/model/user_model.dart';
import 'package:communication/screens/auth_screens/add_code_screen.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../controller/fb_auth_controller.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({Key? key}) : super(key: key);

  @override
  _CreateAccountScreenState createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  late TextEditingController phoneEditingController;
  String verificationID = '';
  String userType = 'user';

  // late String phone ;
  // int typeUser =0;
  // late CountryCode countryCodeG;

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
          'انشاء الحساب',
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
                    height: 260.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(25),
                        bottomLeft: Radius.circular(25),
                      ),
                    ),
                    child: Image.asset(
                      'images/createAccount.png',
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(
                        top: 222.h, right: 30.w, left: 30.w, bottom: 40.h),
                    padding: EdgeInsets.only(
                        top: 15.h, right: 20.w, left: 20.w),
                    width: double.infinity,
                    height: 460.h,
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
                          'سعداء بقدومك',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: HexColor('#004AAD'),
                          ),
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        Text(
                          'يمكنك ان تكون فردا من عائلتنا بخطوة بسيطة كل ما نحتاجه رقم\n هاتفك',
                          style: TextStyle(
                            fontSize: 10.sp,
                            color: HexColor('#004AAD'),
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
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
                                // onChanged: _onCountryChange,
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
                        SizedBox(height: 30.h,),
                        Text(
                          'نوع الحساب',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: HexColor('#004AAD'),
                          ),
                        ),
                        SizedBox(height: 12.h,),
                        Row(
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(125.w, 48.h),
                                side: userType == 'translate' ? BorderSide(
                                  color: HexColor('#004AAD'),
                                  width: 2,
                                ) :
                                BorderSide(),
                                primary: userType == 'user' ? HexColor(
                                    '#004AAD') : HexColor('#FAFBFD'),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              onPressed: () {
                                setState(() {
                                  userType = 'user';
                                });
                              },
                              child: Text(
                                'مستخدم',
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
                                side: userType == 'user' ? BorderSide(
                                  color: HexColor('#004AAD'),
                                  width: 2,
                                ) :
                                BorderSide(),
                                minimumSize: Size(125.w, 48.h),
                                primary: userType == 'translate' ? HexColor(
                                    '#004AAD') : HexColor('#FAFBFD'),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              onPressed: () {
                                setState(() {
                                  userType = 'translate';
                                });
                              },
                              child: Text(
                                'مترجم',
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
                        SizedBox(height: 30.h,),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(double.infinity, 48.h),
                            primary: HexColor('#004AAD'),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          onPressed: () {
                            // Navigator.pushNamed(context, '/add_code_screen');
                            print('ClickButton');
                            performCreateAccount();
                          },
                          child: Text(
                            'تسجيل',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(height: 14.h,),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              'لدي حساب بالفعل ؟',
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

  Future<void> performCreateAccount() async {
    print('Begin Perform');
    if (await checkData()) {
      print('perform create account');
      await register();
    }
  }

  Future<bool> checkData() async {
    if (phoneEditingController.text.isNotEmpty) {
      // showSnackBar(context : context , message : 'Success', error : true);
      print('Begin CheckData');
      List<UserRegisterationModel> userList = await FbStoreController()
          .getUser();
      for (int i = 0; i < userList.length; i++) {
        if (userList[i].phone == phoneEditingController.text.toString()) {
          userType = userList[i].typeUser;
          // showSnackBar(
          //   context: context,
          //   message: 'الرقم موجود مسبقا قم بتسجيل  الدخول',
          //   error: true,
          // );
        }
      }
      print('CheckData');
      return true;
    }
    // showSnackBar(context : context , message : 'Enter Data', error : true);
    return false;
  }

  Future<void> register() async {
      try {
        print('Begin Register');
        _firebaseAuth.verifyPhoneNumber(
            phoneNumber: phoneEditingController.text,
            verificationCompleted: (AuthCredential credential) async {
              await _firebaseAuth.signInWithCredential(credential);
            },
            verificationFailed: (FirebaseAuthException exception) {
              print(exception.message);
            },
            codeSent: (String verificationId, int? forceResendingToken) {
              verificationID = verificationId;
              UserRegisterationModel userRegisterationModel = UserRegisterationModel(
                  phoneEditingController.text, userType);
              Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (context) =>
                    AddCodeScreen(
                      verificationId: verificationID,
                      userRegisterationModel: userRegisterationModel,),),);
              print('Finish Register');
            },
            codeAutoRetrievalTimeout: (String verificationId) {});
      } on FirebaseAuthException catch (e) {
        // _controlAuthException(context: context, e: e);
      } catch (e) {
        print(e);
      }
    // void _onCountryChange(CountryCode countryCode) {
    //   setState(() {
    //     countryCodeG = countryCode;
    //   });
    //   print("New Countr selected: " + countryCode.toString());
    // }
  }

}