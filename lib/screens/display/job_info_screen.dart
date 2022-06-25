import 'package:communication/model/job_data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

class JobInfoScreen extends StatefulWidget {
  JobInfoScreen({Key? key , required this.jobDataModel}) : super(key: key);

  JobDataModel jobDataModel;

  @override
  _JobInfoScreenState createState() => _JobInfoScreenState();
}

class _JobInfoScreenState extends State<JobInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 490.h,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                ),
                child: Image.asset(
                  'images/job.png',
                  fit: BoxFit.fill,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  margin: EdgeInsets.only(top: 30.h, right: 30.w),
                  padding: EdgeInsets.only(right: 6.w),
                  alignment: Alignment.center,
                  width: 30.w,
                  height: 30.h,
                  decoration: BoxDecoration(
                    color: HexColor('#417ECE'),
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                    size: 14.h,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: 450.h, right: 30.w, left: 30.w, bottom: 15.h),
                padding: EdgeInsets.only(top: 12.h, right: 28.w, left: 28.w),
                width: double.infinity,
                height: 105.h,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    )),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.jobDataModel.jobName,
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: HexColor('#004AAD'),
                              ),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Text(
                              widget.jobDataModel.expertiseYear,
                              style: TextStyle(
                                fontSize: 10.sp,
                                color: HexColor('#004AAD'),
                              ),
                            ),
                          ],
                        ),
                        Icon(
                          Icons.favorite_border_outlined,
                          color: HexColor('#004AAD'),
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
                            widget.jobDataModel.jobStatus,
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
                          widget.jobDataModel.location,
                          style: TextStyle(
                            fontSize: 8.sp,
                            color: HexColor('#82B1EF'),
                          ),
                        ),
                        SizedBox(
                          width: 44.w,
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
                          widget.jobDataModel.addDate,
                          style: TextStyle(
                            fontSize: 8.sp,
                            color: HexColor('#82B1EF'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(right: 30.w, left: 30.w, bottom: 15.h),
            padding: EdgeInsets.only(top: 20.h, right: 20.w, left: 20.w),
            width: double.infinity,
            height: 180.h,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                )),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'المهام والمسؤوليات',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: HexColor('#004AAD'),
                      ),
                    ),
                    Icon(
                      Icons.favorite_border_outlined,
                      color: HexColor('#004AAD'),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12.h,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.done_outlined,
                      size: 12.h,
                      color: HexColor('#004AAD'),
                    ),
                    SizedBox(
                      width: 6.w,
                    ),
                    Text(
                      widget.jobDataModel.tasks,
                      style: TextStyle(
                        fontSize: 10.sp,
                        color: HexColor('#004AAD'),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8.h,
                ),
                // Row(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     Icon(
                //       Icons.done_outlined,
                //       size: 10.h,
                //       color: HexColor('#004AAD'),
                //     ),
                //     SizedBox(
                //       width: 6.w,
                //     ),
                //     Text(
                //       'يحتفظ تطبيق وثاق بحقه في تجميد أي حساب أو حتى إيقافه بشكل\n دائم والذي يطبّق على حساب العميل بسبب استخدام غير قانوني أو\nغير مناسب لخدمات التطبيق',
                //       style: TextStyle(
                //         fontSize: 9.sp,
                //         color: HexColor('#004AAD'),
                //       ),
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 30.w, left: 30.w, bottom: 15.h),
            padding: EdgeInsets.only(top: 20.h, right: 20.w, left: 20.w),
            width: double.infinity,
            height: 180.h,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                )),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'الشروط و المتطلبات',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: HexColor('#004AAD'),
                      ),
                    ),
                    Icon(
                      Icons.favorite_border_outlined,
                      color: HexColor('#004AAD'),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12.h,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.done_outlined,
                      size: 12.h,
                      color: HexColor('#004AAD'),
                    ),
                    SizedBox(
                      width: 6.w,
                    ),
                    Text(
                     widget.jobDataModel.conditions,
                      style: TextStyle(
                        fontSize: 10.sp,
                        color: HexColor('#004AAD'),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8.h,
                ),
                // Row(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     Icon(
                //       Icons.done_outlined,
                //       size: 10.h,
                //       color: HexColor('#004AAD'),
                //     ),
                //     SizedBox(
                //       width: 6.w,
                //     ),
                //     Text(
                //       'يحتفظ تطبيق وثاق بحقه في تجميد أي حساب أو حتى إيقافه بشكل\n دائم والذي يطبّق على حساب العميل بسبب استخدام غير قانوني أو\nغير مناسب لخدمات التطبيق',
                //       style: TextStyle(
                //         fontSize: 9.sp,
                //         color: HexColor('#004AAD'),
                //       ),
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 30.w, left: 30.w, bottom: 15.h),
            padding: EdgeInsets.only(top: 20.h, right: 30.w, left: 30.w),
            width: double.infinity,
            height: 350.h,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                )),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'تفاصيل الوظيفة',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: HexColor('#004AAD'),
                      ),
                    ),
                    Icon(
                      Icons.favorite_border_outlined,
                      color: HexColor('#004AAD'),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12.h,
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          'المسمى الوظيفي',
                          style: TextStyle(
                            fontSize: 10.sp,
                            color: HexColor('#004AAD'),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 9.h,
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: 106.w,
                          height: 28.h,
                          decoration: BoxDecoration(
                            color: HexColor('#C3D6EF'),
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                          child: Text(
                            widget.jobDataModel.jobTitle,
                            style: TextStyle(
                              fontSize: 10.sp,
                              color: HexColor('#004AAD'),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Column(
                      children: [
                        Text(
                          'أخر موعد للتقديم',
                          style: TextStyle(
                            fontSize: 10.sp,
                            color: HexColor('#004AAD'),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 9.h,
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: 106.w,
                          height: 28.h,
                          decoration: BoxDecoration(
                            color: HexColor('#C3D6EF'),
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                          child: Text(
                            widget.jobDataModel.lastDate,
                            style: TextStyle(
                              fontSize: 10.sp,
                              color: HexColor('#004AAD'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 19.h,
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          'نوع الوظيفة',
                          style: TextStyle(
                            fontSize: 10.sp,
                            color: HexColor('#004AAD'),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 9.h,
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: 106.w,
                          height: 28.h,
                          decoration: BoxDecoration(
                            color: HexColor('#C3D6EF'),
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                          child: Text(
                            widget.jobDataModel.jobType,
                            style: TextStyle(
                              fontSize: 10.sp,
                              color: HexColor('#004AAD'),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Column(
                      children: [
                        Text(
                          'المستوى المهني',
                          style: TextStyle(
                            fontSize: 10.sp,
                            color: HexColor('#004AAD'),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 9.h,
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: 106.w,
                          height: 28.h,
                          decoration: BoxDecoration(
                            color: HexColor('#C3D6EF'),
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                          child: Text(
                            widget.jobDataModel.level,
                            style: TextStyle(
                              fontSize: 10.sp,
                              color: HexColor('#004AAD'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 19.h,
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          'الراتب',
                          style: TextStyle(
                            fontSize: 10.sp,
                            color: HexColor('#004AAD'),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 9.h,
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: 106.w,
                          height: 28.h,
                          decoration: BoxDecoration(
                            color: HexColor('#C3D6EF'),
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                          child: Text(
                            widget.jobDataModel.salary,
                            style: TextStyle(
                              fontSize: 10.sp,
                              color: HexColor('#004AAD'),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Column(
                      children: [
                        Text(
                          'الدرجة العلمية',
                          style: TextStyle(
                            fontSize: 10.sp,
                            color: HexColor('#004AAD'),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 9.h,
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: 106.w,
                          height: 28.h,
                          decoration: BoxDecoration(
                            color: HexColor('#C3D6EF'),
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                          child: Text(
                            widget.jobDataModel.degree,
                            style: TextStyle(
                              fontSize: 10.sp,
                              color: HexColor('#004AAD'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 19.h,
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          'الخبرة',
                          style: TextStyle(
                            fontSize: 10.sp,
                            color: HexColor('#004AAD'),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 9.h,
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: 106.w,
                          height: 28.h,
                          decoration: BoxDecoration(
                            color: HexColor('#C3D6EF'),
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                          child: Text(
                            widget.jobDataModel.expertiseYear,
                            style: TextStyle(
                              fontSize: 10.sp,
                              color: HexColor('#004AAD'),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Column(
                      children: [
                        Text(
                          'المكان',
                          style: TextStyle(
                            fontSize: 10.sp,
                            color: HexColor('#004AAD'),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 9.h,
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: 106.w,
                          height: 28.h,
                          decoration: BoxDecoration(
                            color: HexColor('#C3D6EF'),
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                          child: Text(
                            widget.jobDataModel.location,
                            style: TextStyle(
                              fontSize: 10.sp,
                              color: HexColor('#004AAD'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 30.w, left: 30.w, bottom: 15.h),
            padding: EdgeInsets.only(top: 20.h, right: 28.w, left: 28.w),
            width: double.infinity,
            height: 130.h,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                )),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    'التسجيل للوظيفة',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: HexColor('#004AAD'),
                    ),
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Text(
                  'يمكنك قراءة المزيد من خلال الرابط التالي',
                  style: TextStyle(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.bold,
                    color: HexColor('#004AAD'),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 15.h),
                  width: 140.w,
                  height: 28.h,
                  decoration: BoxDecoration(
                    color: HexColor('#C3D6EF'),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Text(
                    widget.jobDataModel.jobLink,
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
    );
  }
}
