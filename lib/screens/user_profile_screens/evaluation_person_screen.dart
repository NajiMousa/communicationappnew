
import 'package:communication/controller/fb_store_controller.dart';
import 'package:communication/model/evaluation_data_model.dart';
import 'package:ff_stars/ff_stars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../helpers/helpers.dart';
import '../../model/request_data_model.dart';

class EvaluationPersonScreen extends StatefulWidget {
   EvaluationPersonScreen({Key? key, required this.requestDataModel}) : super(key: key);

   RequestDataModel requestDataModel;

  @override
  _EvaluationPersonScreenState createState() => _EvaluationPersonScreenState();

}

class _EvaluationPersonScreenState extends State<EvaluationPersonScreen> with Helpers {

  double exteriorStar = 1;
  double dateStar = 1;
  double skillsStar = 1;
  double dealStar = 1;
  int avg = 0;
  bool status = false;
  late TextEditingController shorTDescriptionTextController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    shorTDescriptionTextController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    shorTDescriptionTextController.dispose();
    super.dispose();
  }

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
          'التقييم',
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
                              // 'ليلى المنصور',
                              widget.requestDataModel.translaterName,
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: HexColor('#004AAD'),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              // 'ana.ana@gmail.com',
                              widget.requestDataModel.phoneTranslater,
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
                    FFStars(
                      normalStar: Image.asset("images/25533.jpg"),
                      selectedStar: Image.asset("images/v978-14.jpg"),
                      starsChanged: (realStars, selectedStars) {
                        print("real: $selectedStars, final: $realStars");
                        setState(() {
                          exteriorStar = realStars;
                        });
                      },
                      step: 0.1,
                      defaultStars: 0.5,
                      starCount: 5,
                      starHeight: 22.h,
                      starWidth: 22.w,
                      starMargin: 5,
                      // justShow: true,
                      // rounded: true,
                      // followChange: true,
                    )
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
                    FFStars(
                      normalStar: Image.asset("images/25533.jpg"),
                      selectedStar: Image.asset("images/v978-14.jpg"),
                      starsChanged: (realStars, selectedStars) {
                        print("real: $selectedStars, final: $realStars");
                        setState(() {
                          dateStar = realStars;
                        });
                      },
                      step: 0.1,
                      defaultStars: 0.5,
                      starCount:5,
                      starHeight: 22.h,
                      starWidth: 22.w,
                      starMargin: 5,
                      // justShow: true,
                      // rounded: true,
                      // followChange: true,
                    )
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
                    FFStars(
                      normalStar: Image.asset("images/25533.jpg"),
                      selectedStar: Image.asset("images/v978-14.jpg"),
                      starsChanged: (realStars, selectedStars) {
                        print("real: $selectedStars, final: $realStars");
                        setState(() {
                          skillsStar = realStars;
                        });
                      },
                      step: 0.1,
                      defaultStars: 0.5,
                      starCount: 5,
                      starHeight: 22.h,
                      starWidth: 22.w,
                      starMargin: 5,
                      // justShow: true,
                      // rounded: true,
                      // followChange: true,
                    )
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
                    FFStars(
                      normalStar: Image.asset("images/25533.jpg"),
                      selectedStar: Image.asset("images/v978-14.jpg"),
                      starsChanged: (realStars, selectedStars) {
                        print("real: $selectedStars, final: $realStars");
                        setState(() {
                          dealStar = realStars;
                        });
                      },
                      step: 0.1,
                      defaultStars: 0.5,
                      starCount: 5,
                      starHeight: 22.h,
                      starWidth: 22.w,
                      starMargin: 5,
                      // justShow: true,
                      // rounded: true,
                      // followChange: true,
                    )
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
                  controller: shorTDescriptionTextController,
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
                  onPressed: () {
                     process();
                     Navigator.pushNamed(context,'/main_screen');
                  },
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
  void performProcess() async {
    print('startPerformProcess');
    if (checkData()) {
      process();
    }
  }

  bool checkData() {
    print('startCheckData');
    if (shorTDescriptionTextController.text.isNotEmpty) {
      print('startCheckDataTrue');
      return true;
    }
    showSnackBar(context: context, message: 'Enter required Data', error: true);
    print('startCheckDataFalse');
    return false;
  }

  void process() async {
    avg = (dateStar+skillsStar+dealStar+exteriorStar)~/4;
    await FbStoreController().createEvaluation(evaluationDataModel: evaluationDataModelMethod);
    await FbStoreController().updateRequest(requestDataModel: requestDataModelA);
    status = true;
  }

  EvaluationDataModel get evaluationDataModelMethod{
    EvaluationDataModel evaluationDataModel = EvaluationDataModel();
    evaluationDataModel.phoneTranslater = widget.requestDataModel.phoneTranslater;
    evaluationDataModel.translaterName = widget.requestDataModel.translaterName;
    evaluationDataModel.userName = widget.requestDataModel.userName;
    evaluationDataModel.phoneUser = widget.requestDataModel.phoneUser;
    evaluationDataModel.dateOfCreate = widget.requestDataModel.dateOfCreate;
    evaluationDataModel.shorTDescription = shorTDescriptionTextController.text;
    evaluationDataModel.dateStar = dateStar.toString();
    evaluationDataModel.skillsStar = skillsStar.toString();
    evaluationDataModel.dealStar = dealStar.toString();
    evaluationDataModel.exteriorStar = exteriorStar.toString();
    evaluationDataModel.allEvaluation = avg.toString();
    return evaluationDataModel;
  }
  RequestDataModel get requestDataModelA {
    print('startGet');
    RequestDataModel requestDataModelA = RequestDataModel();
    print('01');
    requestDataModelA.id = widget.requestDataModel.id;
    print('02');
    requestDataModelA.location = widget.requestDataModel.location;
    print('03');
    requestDataModelA.timeOfMeeting = widget.requestDataModel.timeOfMeeting;
    print('04');
    requestDataModelA.shorTDescription =
        widget.requestDataModel.shorTDescription;
    print('05');
    requestDataModelA.dateOfMeeting = widget.requestDataModel.dateOfMeeting;
    print('06');
    print('selected');
    // print(selected);
    requestDataModelA.requestStatus ='ending';
    print('07');
    requestDataModelA.phoneTranslater = widget.requestDataModel.phoneTranslater;
    print('08');
    requestDataModelA.dateOfCreate = widget.requestDataModel.dateOfCreate;
    print('09');
    requestDataModelA.latitude = widget.requestDataModel.latitude;
    print('10');
    requestDataModelA.longtude = widget.requestDataModel.longtude;
    print('11');
    requestDataModelA.phoneUser = widget.requestDataModel.phoneUser;
    print('12');
    requestDataModelA.translaterName = widget.requestDataModel.translaterName;
    print('13');
    requestDataModelA.userName = widget.requestDataModel.userName;
    print('14');
    print(widget.requestDataModel.hour.toString());
    requestDataModelA.hour = widget.requestDataModel.hour.toString();
    print('15');
    print('endGet');
    print(requestDataModelA);
    print(requestDataModelA.requestStatus);
    return requestDataModelA;
  }
}
