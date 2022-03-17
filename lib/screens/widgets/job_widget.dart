import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

class JobWidget extends StatefulWidget {
  const JobWidget({Key? key}) : super(key: key);

  @override
  _JobWidgetState createState() => _JobWidgetState();
}

class _JobWidgetState extends State<JobWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () => Navigator.pushNamed(context, '/job_info_screen'),
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: 100.h,
                decoration: BoxDecoration(
                  color: HexColor('#FFFFFF'),
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 10.h, right: 10.w,left: 10.w),
                    clipBehavior: Clip.antiAlias,
                    width: 80.w,
                    height: 80.h,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    child: Image.asset(
                      'images/job.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'مصمم تجربة مستخدم',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: HexColor('#004AAD'),
                                ),
                              ),
                              SizedBox(
                                height: 4.h,
                              ),
                              Text(
                                'ثلاث سنوات خبرة',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: HexColor('#004AAD'),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 60.w),
                            alignment: Alignment.center,
                            width: 24.w,
                            height: 24.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(50.h),
                              ),
                              border: Border.all(
                                color: HexColor('#004AAD'),
                              ),
                            ),
                            child: Icon(
                              Icons.arrow_forward_ios_outlined,
                              size: 14.h,
                              color: HexColor('#004AAD'),
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        thickness: 1,
                        color: HexColor('#004AAD'),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            alignment: AlignmentDirectional.center,
                            width: 35.w,
                            height: 18.h,
                            decoration: BoxDecoration(
                              color: HexColor('#004AAD'),
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              ),
                            ),
                            child: Text(
                              'مفتوح',
                              style: TextStyle(
                                fontSize: 8.sp,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 15.w,
                          ),
                          Icon(
                            Icons.add_location,
                            size: 18.h,
                            color: HexColor('#82B1EF'),
                          ),
                          SizedBox(
                            width: 4.w,
                          ),
                          Text(
                            'جازان',
                            style: TextStyle(
                              fontSize: 8.sp,
                              color: HexColor('#82B1EF'),
                            ),
                          ),
                          SizedBox(
                            width: 34.w,
                          ),
                          Icon(
                            Icons.lock_clock,
                            size: 18.h,
                            color: HexColor('#82B1EF'),
                          ),
                          SizedBox(
                            width: 4.w,
                          ),
                          Text(
                            '10 دقائق',
                            style: TextStyle(
                              fontSize: 8.sp,
                              color: HexColor('#82B1EF'),
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 16.h,
        )
      ],
    );
  }
}
