import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

class CouurseWidget extends StatefulWidget {
  const CouurseWidget({Key? key}) : super(key: key);

  @override
  _CouurseWidgetState createState() => _CouurseWidgetState();
}

class _CouurseWidgetState extends State<CouurseWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, '/course_info_screen');
          },
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: 200.h,
                decoration: BoxDecoration(
                  color: HexColor('#FFFFFF'),
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                ),
              ),
              Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 140.h,
                    decoration: BoxDecoration(
                      color: HexColor('#FFFFFF'),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                      ),
                    ),
                    child: Image.asset(
                      'images/coruse.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: 10.h, right: 24.w, left: 24.w),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'لغة الإشارة و اساليبها',
                              style: TextStyle(
                                fontSize: 12,
                                color: HexColor('#004AAD'),
                              ),
                            ),
                            SizedBox(
                              height: 4.h,
                            ),
                            Text(
                              'ثلاث ساعات',
                              style: TextStyle(
                                fontSize: 10,
                                color: HexColor('#004AAD'),
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Container(
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
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
