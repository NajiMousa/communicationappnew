import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

class PersonalInfoScreen extends StatefulWidget {
  const PersonalInfoScreen({Key? key}) : super(key: key);

  @override
  _PersonalInfoScreenState createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 25.h,
        right: 65.w,
      ),
      child: Column(
        children: [
          ListTile(
            visualDensity: VisualDensity(horizontal: -4, vertical: -4),
            leading: Icon(
              Icons.call,
              color: HexColor('#004AAD'),
            ),
            title: Text(
              '+966 - 1234 123 12',
              style: TextStyle(
                fontSize: 16.sp,
                color: HexColor('#004AAD'),
              ),
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
          ListTile(
            visualDensity: VisualDensity(horizontal: -4, vertical: -4),
            leading: Icon(
              Icons.date_range,
              color: HexColor('#004AAD'),
            ),
            title: Text(
              '09 December 1996',
              style: TextStyle(
                fontSize: 16.sp,
                color: HexColor('#004AAD'),
              ),
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
          ListTile(
            visualDensity: VisualDensity(horizontal: -4, vertical: -4),
            leading: Icon(
              Icons.home_outlined,
              color: HexColor('#004AAD'),
            ),
            title: Text(
              'جازان',
              style: TextStyle(
                fontSize: 16.sp,
                color: HexColor('#004AAD'),
              ),
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
          ListTile(
            visualDensity: VisualDensity(horizontal: -4, vertical: -4),
            leading: Icon(
              Icons.transgender_outlined,
              color: HexColor('#004AAD'),
            ),
            title: Text(
              'أنثى',
              style: TextStyle(
                fontSize: 16.sp,
                color: HexColor('#004AAD'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
