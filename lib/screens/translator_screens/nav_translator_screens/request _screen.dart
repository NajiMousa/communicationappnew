
import 'package:communication/screens/widgets/request_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

class RequestTranslatorScreen extends StatefulWidget {
  const RequestTranslatorScreen({Key? key}) : super(key: key);

  @override
  _RequestTranslatorScreenState createState() => _RequestTranslatorScreenState();
}

class _RequestTranslatorScreenState extends State<RequestTranslatorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#FAFBFD'),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 24.h,
              right: 30.w,
            ),
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
                  Container(
                    alignment: AlignmentDirectional.center,
                    decoration: BoxDecoration(
                      color: HexColor('#004AAD'),
                      borderRadius: BorderRadius.all(
                        Radius.circular(25),
                      ),
                    ),
                    child: Text(
                      'الكل',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: HexColor('#FAFBFD'),
                      ),
                    ),
                  ),
                  Container(
                    alignment: AlignmentDirectional.center,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: HexColor('#004AAD'),
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(25),
                      ),
                    ),
                    child: Text(
                      'قيد التنفيذ',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: HexColor('#004AAD'),
                      ),
                    ),
                  ),
                  Container(
                    alignment: AlignmentDirectional.center,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: HexColor('#004AAD'),
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(25),
                      ),
                    ),
                    child: Text(
                      'منتهية',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: HexColor('#004AAD'),
                      ),
                    ),
                  ),
                  Container(
                    alignment: AlignmentDirectional.center,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: HexColor('#004AAD'),
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(25),
                      ),
                    ),
                    child: Text(
                      'ملغية',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: HexColor('#004AAD'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      EdgeInsets.only(right: 30.w, left: 30.w, bottom: 16.h),
                  child: RequestWidget(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
