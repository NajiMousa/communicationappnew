import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../pref/shread_pref.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  _LaunchScreenState createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  bool status = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Future.delayed(const Duration(seconds: 3),(){
    //   // String route = state ? '/notes_screen' : '/login_screen';
    //   Navigator.pushReplacementNamed(context, '/onboarding_first_screen');
    // });
    // status
    //     ? Future.delayed(const Duration(seconds: 3), () {
    //         Navigator.pushReplacementNamed(context, '/onboarding_first_screen');
    //       })
    String User = SharedPrefController().typeUser == 'user'? '/main_screen': SharedPrefController().typeUser == 'admin'? '/admin_action_screen' :'/main_translator_screen';
    Future.delayed(const Duration(seconds: 3), () {
      print(!SharedPrefController().loggedIn);
            String route = SharedPrefController().loggedIn
                ? User
                : '/onboarding_first_screen';
      print(SharedPrefController().phone);
            Navigator.pushReplacementNamed(context, route);
          });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          'images/logo.png',
          width: 270.w,
          height: 270.h,
        ),
      ),
    );
  }
}
