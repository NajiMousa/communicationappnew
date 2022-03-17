import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

class BlogInfoScreen extends StatefulWidget {
  const BlogInfoScreen({Key? key}) : super(key: key);

  @override
  _BlogInfoScreenState createState() => _BlogInfoScreenState();
}

class _BlogInfoScreenState extends State<BlogInfoScreen> {
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
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                ),
                child: Image.asset(
                  'images/blog.png',
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
                height: 110.h,
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
                              'الأمل الغائب قادم',
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: HexColor('#004AAD'),
                              ),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Text(
                              'د .  سمير سمرين',
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
                      children: [
                        Text(
                          'مدونات عبد الكريم عطايا',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: HexColor('#82B1EF'),
                          ),
                        ),
                        Spacer(),
                        Icon(
                          Icons.access_time,
                          color: HexColor('#82B1EF'),
                        ),
                        Text(
                          '1 إلى 3 يوليو 2020',
                          style: TextStyle(
                            fontSize: 12.sp,
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
            padding: EdgeInsets.only(top: 12.h, right: 28.w, left: 28.w),
            width: double.infinity,
            height: 310.h,
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
                      'نص المدونة',
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
                Text(
                  ' آن للصم العرب الذين يركبون سفينة الحياة منذ عقود وعقود بل منذ قرون\n وقرون .. وهم على ظهرها ركود..  وقد طال رسوها وسط بحرهم الصامت \nأن يتحركوا نحو شاطئ الأمل .. شاطئ الأمن والأمان .. حيث الأمل بكل ألوان \nالطيف في انتظارهم ترفعه أيديكم .. ترسمه أياديهم بلغة إشارية فصحى\n ترتشف من معين لغتنا العربية سر مبناها وسحر معناها\n تدهش العيون حركاتها . تتدفق إلى القلوب . تهز مشاعرهم . كما هزت لغة\n الكلام قلوبنا  .! منها ينهلون ما طاب لهم من العلم.. وبحروفها يكتبون ما \nشاء لهم من طيب الكلم ',
                  style: TextStyle(
                    fontSize: 9.sp,
                    color: HexColor('#004AAD'),
                  ),
                ),
                SizedBox(
                  height: 6.h,
                ),
                Text(
                  ' آن للصم العرب الذين يركبون سفينة الحياة منذ عقود وعقود بل منذ قرون\n وقرون .. وهم على ظهرها ركود..  وقد طال رسوها وسط بحرهم الصامت \nأن يتحركوا نحو شاطئ الأمل .. شاطئ الأمن والأمان .. حيث الأمل بكل ألوان \nالطيف في انتظارهم ترفعه أيديكم .. ترسمه أياديهم بلغة إشارية فصحى\n ترتشف من معين لغتنا العربية سر مبناها وسحر معناها\n تدهش العيون حركاتها . تتدفق إلى القلوب . تهز مشاعرهم . كما هزت لغة\n الكلام قلوبنا  .! منها ينهلون ما طاب لهم من العلم.. وبحروفها يكتبون ما \nشاء لهم من طيب الكلم ',
                  style: TextStyle(
                    fontSize: 9.sp,
                    color: HexColor('#004AAD'),
                  ),
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
                    'رابط المدونة',
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
                    'https://www.google.com/',
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
