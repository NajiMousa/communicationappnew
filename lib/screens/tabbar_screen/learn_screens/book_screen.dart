import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

class BookScreen extends StatefulWidget {
  const BookScreen({Key? key}) : super(key: key);

  @override
  _BookScreenState createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {

  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(right: 30.w),
            child: ConstrainedBox(
              constraints:
              BoxConstraints(maxHeight: 35.h, minWidth: double.infinity),
              child: GridView(
                scrollDirection: Axis.horizontal,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisSpacing: 12.w,
                  childAspectRatio: 35 / 75,
                ),
                children: [
                  InkWell(
                    onTap: () => setState(() {
                      selected = 0;
                    }),
                    child: Container(
                      alignment: AlignmentDirectional.center,
                      decoration: selected == 0
                          ? BoxDecoration(
                        color: HexColor('#004AAD'),
                        borderRadius: BorderRadius.all(
                          Radius.circular(25),
                        ),
                      )
                          : BoxDecoration(
                        border: Border.all(
                          color: HexColor('#004AAD'),
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(25),
                        ),
                      ),
                      child: Text(
                        'الحروف',
                        style: selected == 0
                            ? TextStyle(
                          fontSize: 12.sp,
                          color: HexColor('#FAFBFD'),
                        )
                            : TextStyle(
                          fontSize: 12.sp,
                          color: HexColor('#004AAD'),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => setState(() {
                      selected = 1;
                    }),
                    child: Container(
                      alignment: AlignmentDirectional.center,
                      decoration: selected == 1
                          ? BoxDecoration(
                        color: HexColor('#004AAD'),
                        borderRadius: BorderRadius.all(
                          Radius.circular(25),
                        ),
                      )
                          : BoxDecoration(
                        border: Border.all(
                          color: HexColor('#004AAD'),
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(25),
                        ),
                      ),
                      child: Text(
                        'الأرقام',
                        style: selected == 1
                            ? TextStyle(
                          fontSize: 12.sp,
                          color: HexColor('#FAFBFD'),
                        )
                            : TextStyle(
                          fontSize: 12.sp,
                          color: HexColor('#004AAD'),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => setState(() {
                      selected = 2;
                    }),
                    child: Container(
                      alignment: AlignmentDirectional.center,
                      decoration: selected == 2
                          ? BoxDecoration(
                        color: HexColor('#004AAD'),
                        borderRadius: BorderRadius.all(
                          Radius.circular(25),
                        ),
                      )
                          : BoxDecoration(
                        border: Border.all(
                          color: HexColor('#004AAD'),
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(25),
                        ),
                      ),
                      child: Text(
                        'الحيوانات',
                        style: selected == 2
                            ? TextStyle(
                          fontSize: 12.sp,
                          color: HexColor('#FAFBFD'),
                        )
                            : TextStyle(
                          fontSize: 12.sp,
                          color: HexColor('#004AAD'),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => setState(() {
                      selected = 3;
                    }),
                    child: Container(
                      alignment: AlignmentDirectional.center,
                      decoration: selected == 3
                          ? BoxDecoration(
                        color: HexColor('#004AAD'),
                        borderRadius: BorderRadius.all(
                          Radius.circular(25),
                        ),
                      )
                          : BoxDecoration(
                        border: Border.all(
                          color: HexColor('#004AAD'),
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(25),
                        ),
                      ),
                      child: Text(
                        'الحركات',
                        style: selected == 3
                            ? TextStyle(
                          fontSize: 12.sp,
                          color: HexColor('#FAFBFD'),
                        )
                            : TextStyle(
                          fontSize: 12.sp,
                          color: HexColor('#004AAD'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 15.h,),
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(right: 30.w, left: 30.w),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 4.h),
                            alignment: Alignment.center,
                            width: double.infinity,
                            // height: 115.h,
                            decoration: BoxDecoration(
                              color: HexColor('#C6DCFB'),
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                            ),
                            child: Container(
                              child: Image.asset(
                                'images/Untitled.png',
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12.h,),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
