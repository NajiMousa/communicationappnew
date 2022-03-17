// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:hexcolor/hexcolor.dart';
//
// import '../nav_user_screens/main_screen.dart';
//
// class AllWidget extends StatefulWidget {
//   const AllWidget({Key? key}) : super(key: key);
//
//   @override
//   State<AllWidget> createState() => _AllWidgetState();
// }
//
// class _AllWidgetState extends State<AllWidget> {
//
//
//   final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
//   late TextEditingController codeEditingController ;
//   late TextEditingController phoneEditingController;
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     codeEditingController = TextEditingController();
//     phoneEditingController = TextEditingController();
//   }
//   @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//     codeEditingController.dispose();
//     phoneEditingController.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Container(
//           padding: EdgeInsets.all(30),
//           child: Form(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text('Login'),
//                 SizedBox(
//                   height: 15.h,
//                 ),
//                 TextField(
//                   // decoration: InputDecoration(),
//                   controller: phoneEditingController,
//                 ),
//                 SizedBox(
//                   height: 15.h,
//                 ),
//                 ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     minimumSize: Size(double.infinity, 48.h),
//                     primary: HexColor('#004AAD'),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                   ),
//                   onPressed: () {
//                     // Navigator.pushNamed(context, '/add_code_screen');
//                     createAccount(context: context, phoneNumber: phoneEditingController.text, typeUser: 1);
//                   },
//                   child: Text(
//                     'تسجيل',
//                     style: TextStyle(
//                       fontSize: 14.sp,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Future<bool> createAccount(
//       // مخصصة لتسجيل جديد
//       {required BuildContext context,
//       required String phoneNumber,
//       required int typeUser}) async {
//     try {
//       // نظرا لانه يسبب throw Exception استخدمنا Try
//       _firebaseAuth.verifyPhoneNumber(
//           phoneNumber: phoneNumber,
//           verificationCompleted: (AuthCredential credential) async {
//             Navigator.pop(context);
//             UserCredential userCredential =
//                 await _firebaseAuth.signInWithCredential(credential);
//             // بدنا نضيفهم في الجدول
//             if (userCredential.user != null) {
//               Navigator.push(context, MaterialPageRoute(
//                 builder: (context) {
//                   return MainScreen();
//                 },
//               ));
//             } else {
//               print('error');
//             }
//           },
//           verificationFailed: (FirebaseAuthException exception) {
//             print(exception);
//           },
//           codeSent: (String verificationId, int? forceResendingToken) async {
//             showDialog(
//                 context: context,
//                 barrierDismissible: false,
//                 builder: (context) {
//                   return AlertDialog(
//                     title: Text('Give the code'),
//                     content: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         TextField(
//                           controller: codeEditingController,
//                         )
//                       ],
//                     ),
//                     actions: [
//                       ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           minimumSize: Size(double.infinity, 48.h),
//                           primary: HexColor('#004AAD'),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(15),
//                           ),
//                         ),
//                         onPressed: () async{
//                           // Navigator.pushNamed(context, '/add_code_screen');
//                           AuthCredential credential =
//                               PhoneAuthProvider.credential(
//                                   verificationId: verificationId,
//                                   smsCode: codeEditingController.text);
//                           UserCredential userCredential= await _firebaseAuth.signInWithCredential(credential);
//                           if (userCredential.user != null) {
//                             Navigator.push(context, MaterialPageRoute(
//                               builder: (context) {
//                                 return MainScreen();
//                               },
//                             ));
//                           } else {
//                             print('error');
//                           }
//                         },
//                         child: Text(
//                           'تاكيد',
//                           style: TextStyle(
//                             fontSize: 14.sp,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                     ],
//                   );
//                 });
//             // ShowSnakBar
//             final code =
//                 codeEditingController.text.trim(); // الكود اللي راح يبعته
//             AuthCredential credential = PhoneAuthProvider.credential(
//                 verificationId: verificationId, smsCode: code);
//             UserCredential userCredential =
//                 await _firebaseAuth.signInWithCredential(credential);
//             if (userCredential.user != null) {
//               Navigator.push(context, MaterialPageRoute(
//                 builder: (context) {
//                   return MainScreen();
//                 },
//               ));
//             } else {
//               print('error');
//             }
//           },
//           codeAutoRetrievalTimeout: (String verificationId) {
//             Duration(seconds: 60);
//           });
//       return true;
//     } on FirebaseAuthException catch (e) {
//       // _controlAuthException(context: context, e: e);
//     } catch (e) {
//       print(e);
//     }
//     return false;
//   }
// }

import 'package:communication/screens/nav_user_screens/main_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

class AllWidget extends StatelessWidget {
  final _phoneController = TextEditingController();
  final _codeController = TextEditingController();

  // final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<bool> createuser(String phone, BuildContext context) async {
    FirebaseAuth _auth = FirebaseAuth.instance;

    try {
      _auth.verifyPhoneNumber(
          phoneNumber: phone,
          timeout: Duration(seconds: 60),
          verificationCompleted: (AuthCredential credential) async {
            // Navigator.of(context).pop();
            UserCredential userCredential =
                await _auth.signInWithCredential(credential);
            // if (userCredential.user != null) {
            //   Navigator.push(context,
            //       MaterialPageRoute(builder: (context) => MainScreen()));
            // } else {
            //   print("Error");
            // }
          },
          verificationFailed: (FirebaseAuthException exception) {
            print(exception);
          },
          codeSent: (String verificationId, int? forceResendingToken) {
            showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) {
                  return AlertDialog(
                    title: Text('Give the code'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextField(
                          controller: _phoneController,
                        )
                      ],
                    ),
                    actions: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(double.infinity, 48.h),
                          primary: HexColor('#004AAD'),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        onPressed: () async {
                          // Navigator.pushNamed(context, '/add_code_screen');
                          final code = _codeController.text.trim();
                          AuthCredential credential =
                              PhoneAuthProvider.credential(
                                  verificationId: verificationId,
                                  smsCode: code);
                          UserCredential userCredential =
                              await _auth.signInWithCredential(credential);
                          if (userCredential.user != null) {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return MainScreen();
                              },
                            ));
                          } else {
                            print('error');
                          }
                        },
                        child: Text(
                          'تاكيد',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  );
                });
            // ShowSnakBar
          },
          codeAutoRetrievalTimeout: (String verificationId) async {
            // Navigator.pushNamed(context, '/add_code_screen');
            final code = _codeController.text.trim();
            AuthCredential credential = PhoneAuthProvider.credential(
                verificationId: verificationId, smsCode: code);
            UserCredential userCredential =
                await _auth.signInWithCredential(credential);
            if (userCredential.user != null) {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return MainScreen();
                },
              ));
            } else {
              print('error');
            }
            Duration(seconds: 60);
          });
    } on FirebaseAuthException catch (e) {
      // _controlAuthException(context: context, e: e);
    } catch (e) {
      print(e);
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(32),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Login",
                style: TextStyle(
                    color: Colors.lightBlue,
                    fontSize: 36,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 16,
              ),
              TextFormField(
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(color: Colors.grey)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(color: Colors.grey)),
                    filled: true,
                    fillColor: Colors.grey[100],
                    hintText: "Mobile Number"),
                controller: _phoneController,
              ),
              SizedBox(
                height: 16,
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
                  final phone = _phoneController.text.trim();
                  print(phone);

                  createuser(phone, context);
                },
                child: Text(
                  'تاكيد',
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
    ));
  }
}
