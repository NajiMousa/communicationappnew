import 'package:communication/screens/tabbar_screen/learn_screens/book_screen.dart';
import 'package:communication/screens/tabbar_screen/learn_screens/course_screen.dart';
import 'package:communication/screens/widgets/job_widget.dart';
import 'package:communication/screens/widgets/request_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

class EvaluationPersonScreen extends StatefulWidget {
  const EvaluationPersonScreen({Key? key}) : super(key: key);

  @override
  _EvaluationPersonScreenState createState() => _EvaluationPersonScreenState();
}

class _EvaluationPersonScreenState extends State<EvaluationPersonScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 14.h,
          ),
        ),
        backgroundColor: HexColor('#004AAD'),
        title: Text(
          'من نحن',
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
                padding: EdgeInsets.only(top: 20.h, right: 25.w, left: 25.w),
                alignment: Alignment.center,
                width: double.infinity,
                height: 190.h,
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
                      'هل كانت تجربتك جيدة ؟',
                      style: TextStyle(
                        fontSize: 18.sp,
                        color: HexColor('#004AAD'),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      'نطلب هذا التقييم كونه يعطي أنطباع أولي عن الشخص الذي تعاملت معه\n و مدى توصيتك للأخرين بالتعامل معه',
                      style: TextStyle(
                        fontSize: 10.sp,
                        color: HexColor('#004AAD'),
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.person,
                          color: HexColor('#004AAD'),
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        CircleAvatar(
                          maxRadius: 25.h,
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'ليلى المنصور',
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: HexColor('#004AAD'),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'ana.ana@gmail.com',
                              style: TextStyle(
                                fontSize: 10.sp,
                                color: HexColor('#004AAD'),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Container(
            margin: EdgeInsets.only(right: 30.w, left: 30.w),
            padding: EdgeInsets.only(top: 20.h, right: 25.w, left: 25.w),
            alignment: Alignment.center,
            width: double.infinity,
            height: 260.h,
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
                  'تقييم تجربتك مع ذلك الشخص ',
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: HexColor('#004AAD'),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  'سوف تقوم بتقييم الشخص من خلال تعيين عدد النجوم لكل خيار',
                  style: TextStyle(
                    fontSize: 10.sp,
                    color: HexColor('#004AAD'),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: 115.w,
                      height: 28.h,
                      decoration: BoxDecoration(
                        color: HexColor('#C3D6EF'),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Text(
                        'المظهر العام',
                        style: TextStyle(
                          fontSize: 10.sp,
                          color: HexColor('#004AAD'),
                        ),
                      ),
                    ),
                    Spacer(),
                    Container(
                      alignment: Alignment.center,
                      width: 33.w,
                      height: 22.h,
                      decoration: BoxDecoration(
                        color: HexColor('#F1C40F'),
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      child: Text(
                        '4.1',
                        style: TextStyle(
                          fontSize: 10.sp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: 115.w,
                      height: 28.h,
                      decoration: BoxDecoration(
                        color: HexColor('#C3D6EF'),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Text(
                        'الالتزام بالمواعيد',
                        style: TextStyle(
                          fontSize: 10.sp,
                          color: HexColor('#004AAD'),
                        ),
                      ),
                    ),
                    Spacer(),
                    Container(
                      alignment: Alignment.center,
                      width: 33.w,
                      height: 22.h,
                      decoration: BoxDecoration(
                        color: HexColor('#F1C40F'),
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      child: Text(
                        '4.1',
                        style: TextStyle(
                          fontSize: 10.sp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: 115.w,
                      height: 28.h,
                      decoration: BoxDecoration(
                        color: HexColor('#C3D6EF'),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Text(
                        'مدى مهارته في الترجمة ',
                        style: TextStyle(
                          fontSize: 10.sp,
                          color: HexColor('#004AAD'),
                        ),
                      ),
                    ),
                    Spacer(),
                    Container(
                      alignment: Alignment.center,
                      width: 33.w,
                      height: 22.h,
                      decoration: BoxDecoration(
                        color: HexColor('#F1C40F'),
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      child: Text(
                        '4.1',
                        style: TextStyle(
                          fontSize: 10.sp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: 115.w,
                      height: 28.h,
                      decoration: BoxDecoration(
                        color: HexColor('#C3D6EF'),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Text(
                        'توصي بالتعامل معك',
                        style: TextStyle(
                          fontSize: 10.sp,
                          color: HexColor('#004AAD'),
                        ),
                      ),
                    ),
                    Spacer(),
                    Container(
                      alignment: Alignment.center,
                      width: 33.w,
                      height: 22.h,
                      decoration: BoxDecoration(
                        color: HexColor('#F1C40F'),
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      child: Text(
                        '4.1',
                        style: TextStyle(
                          fontSize: 10.sp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Container(
            margin: EdgeInsets.only(right: 30.w, left: 30.w),
            padding: EdgeInsets.only(top: 20.h, right: 25.w, left: 25.w),
            alignment: Alignment.center,
            width: double.infinity,
            height: 275.h,
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
                  'أوصف الشخص بطريقتك ',
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: HexColor('#004AAD'),
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                TextField(
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: HexColor('#004AAD'), width: 1),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: HexColor('#004AAD'), width: 1),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  maxLines: 4,
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
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.search_outlined,
                        size: 20,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        'حفظ التقييم',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
