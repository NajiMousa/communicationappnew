//
// import 'package:country_code_picker/country_code_picker.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:hexcolor/hexcolor.dart';
//
// import '../../controller/fb_auth_controller.dart';
//
// class LoginScreen extends StatefulWidget {
//   const LoginScreen({Key? key}) : super(key: key);
//
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//   late TextEditingController phoneTextEditingController;
//   late CountryCode countryCodeG;
//   bool typeUser = false;
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     phoneTextEditingController = TextEditingController();
//   }
//
//   @override
//   void dispose() {
//     // TODO: implement dispose
//     phoneTextEditingController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: HexColor('#004AAD'),
//         title: Text(
//           'تسجيل الدخول',
//           style: TextStyle(
//               fontSize: 18.sp,
//               fontWeight: FontWeight.bold,
//               color: Colors.white),
//         ),
//         centerTitle: true,
//         elevation: 0,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.only(
//             bottomLeft: Radius.circular(25),
//             bottomRight: Radius.circular(25),
//           ),
//         ),
//       ),
//       backgroundColor: HexColor('#FAFBFD'),
//       body: ListView(
//         children: [
//           Stack(
//             alignment: Alignment.bottomCenter,
//             children: [
//               Container(
//                 // padding: EdgeInsets.only(
//                 //     top: 40.h, right: 77.w, left: 77.w, bottom: 58.h),
//                 width: double.infinity,
//                 height: 100.h,
//                 decoration: BoxDecoration(
//                   color: HexColor('#004AAD'),
//                   borderRadius: BorderRadius.only(
//                     topRight: Radius.circular(25),
//                     topLeft: Radius.circular(25),
//                   ),
//                 ),
//               ),
//               Stack(
//                 children: [
//                   Container(
//                     padding: EdgeInsets.only(
//                         top: 40.h, right: 77.w, left: 77.w, bottom: 58.h),
//                     width: double.infinity,
//                     height: 356.h,
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.only(
//                         bottomRight: Radius.circular(25),
//                         bottomLeft: Radius.circular(25),
//                       ),
//                     ),
//                     child: Image.asset(
//                       'images/login.png',
//                     ),
//                   ),
//                   Container(
//                     alignment: Alignment.center,
//                     margin: EdgeInsets.only(
//                         top: 270.h, right: 25.w, left: 25.w, bottom: 40.h),
//                     padding: EdgeInsets.only(
//                         top: 15.h, right: 15.w, left: 15.w, bottom: 15.h),
//                     width: double.infinity,
//                     height: 320.h,
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.all(
//                         Radius.circular(25),
//                       ),
//                     ),
//                     child: Column(
//                       // mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'أهلا بعودتك',
//                           style: TextStyle(
//                             fontSize: 14.sp,
//                             color: HexColor('#004AAD'),
//                           ),
//                         ),
//                         SizedBox(
//                           height: 12.h,
//                         ),
//                         Text(
//                           'يمكنك تسجيل الدخول من خلال رقم هاتفك حال كنت مسجل\n بالفعل من قبل ',
//                           style: TextStyle(
//                             fontSize: 10.sp,
//                             color: HexColor('#004AAD'),
//                           ),
//                         ),
//                         SizedBox(
//                           height: 15.h,
//                         ),
//                         Text(
//                           'رقم الهاتف',
//                           style: TextStyle(
//                             fontSize: 14.sp,
//                             color: HexColor('#004AAD'),
//                           ),
//                         ),
//                         SizedBox(
//                           height: 12.h,
//                         ),
//                         Row(
//                           children: [
//                             Container(
//                               height: 52.h,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.all(
//                                   Radius.circular(15),
//                                 ),
//                                 border: Border.all(
//                                   color: HexColor('#82B1EF'),
//                                 ),
//                               ),
//                               child: CountryCodePicker(
//                                 onChanged: _onCountryChange,
//                                 textStyle: TextStyle(
//                                   color: HexColor('#004AAD'),
//                                   fontSize: 14.sp,
//                                 ),
//                                 searchDecoration: InputDecoration(
//                                   border: OutlineInputBorder(
//                                     borderSide: BorderSide(
//                                       color: HexColor('#004AAD'),
//                                     ),
//                                     borderRadius: BorderRadius.circular(15.0),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             SizedBox(
//                               width: 10.w,
//                             ),
//                             Expanded(
//                               child: TextField(
//                                 decoration: InputDecoration(
//                                   prefixIcon: Icon(
//                                     Icons.call,
//                                     color: HexColor('#004AAD'),
//                                   ),
//                                   label: Text(
//                                     '123 456 789',
//                                     style: TextStyle(
//                                       fontSize: 12.sp,
//                                       color: HexColor('#82B1EF'),
//                                     ),
//                                   ),
//                                   fillColor: Colors.white,
//                                   focusedBorder: OutlineInputBorder(
//                                     borderSide: BorderSide(
//                                       color: HexColor('#004AAD'),
//                                     ),
//                                     borderRadius: BorderRadius.circular(15.0),
//                                   ),
//                                   enabledBorder: OutlineInputBorder(
//                                     borderSide: BorderSide(
//                                       color: HexColor('#004AAD'),
//                                     ),
//                                     borderRadius: BorderRadius.circular(15.0),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                         SizedBox(
//                           height: 30.h,
//                         ),
//                         ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                             minimumSize: Size(double.infinity, 48.h),
//                             primary: HexColor('#004AAD'),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(15),
//                             ),
//                           ),
//                           onPressed: () {
//                             performLogin();
//                           },
//                           child: Text(
//                             'تسجيل الدخول',
//                             style: TextStyle(
//                               fontSize: 14.sp,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           height: 14.h,
//                         ),
//                         InkWell(
//                           onTap: () {
//                             Navigator.pushNamed(
//                                 context, '/create_account_screen');
//                           },
//                           child: Align(
//                             alignment: Alignment.center,
//                             child: Text(
//                               'ليس لدي حساب ؟',
//                               style: TextStyle(
//                                 fontSize: 10.sp,
//                                 color: HexColor('#004AAD'),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//
//   void _onCountryChange(CountryCode countryCode) {
//     print("New Country selected: " + countryCode.toString());
//     setState(() {
//       countryCodeG = countryCode;
//     });
//   }
//
//   Future<void> performLogin() async {
//     if (checkData()) {
//       await logIn();
//     }
//   }
//
//   bool checkData() {
//     if (phoneTextEditingController.text.isNotEmpty) {
//       // showSnackBar(context : context , message : 'Success', error : true);
//       return true;
//     }
//     // showSnackBar(context : context , message : 'Enter Data', error : true);
//     return false;
//   }
//
// //
//   Future<void> logIn() async {
//     bool status = await FbAuthController()
//         .signIn(context: context, phone: countryCodeG.toString()+phoneTextEditingController.text);
//     if (status) {
//       typeUser
//           ? Navigator.pushNamed(context, '/main_screen')
//           : Navigator.pushNamed(context, '/main_translator_screen');
//     }
//   }
// }
