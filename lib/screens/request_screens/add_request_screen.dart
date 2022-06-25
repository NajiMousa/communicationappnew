import 'package:communication/model/all_user_data_model.dart';
import 'package:communication/model/request_data_model.dart';
import 'package:communication/screens/tabbar_screen/learn_screens/book_screen.dart';
import 'package:communication/screens/tabbar_screen/learn_screens/course_screen.dart';
import 'package:communication/screens/widgets/job_widget.dart';
import 'package:communication/screens/widgets/request_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../controller/fb_store_controller.dart';
import '../../controller/notification_controller.dart';
import '../../helpers/helpers.dart';
import '../../pref/shread_pref.dart';
import '../nav_user_screens/main_screen.dart';
import '../translator_screens/nav_translator_screens/main_translator_screen.dart';

class AddRequestScreen extends StatefulWidget {
  const AddRequestScreen({
    Key? key,
    this.title = 'create',
    this.requestDataModel,
    required this.allUserDataModel,
    // required this.allUserDataModel,
  }) : super(key: key);

  final String title;
  final RequestDataModel? requestDataModel;
  final AllUserDataModel allUserDataModel;

  // final AllUserDataModel allUserDataModel;

  @override
  _AddRequestScreenState createState() => _AddRequestScreenState();
}

class _AddRequestScreenState extends State<AddRequestScreen> with Helpers {
  TimeOfDay _time = TimeOfDay(hour: 7, minute: 15);

  late TextEditingController locationTextController;
  late TextEditingController dateOfMeetingTextController;
  late TextEditingController timeTextController;
  late TextEditingController shorTDescriptionTextController;
  late TextEditingController hoursNumberTextController;
  late DateTime createDate;
  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    createDate = DateTime.now();
    locationTextController =
        TextEditingController(text: widget.requestDataModel?.location ?? '');
    dateOfMeetingTextController = TextEditingController(
        text: widget.requestDataModel?.dateOfMeeting ?? '');
    timeTextController = TextEditingController(
        text: widget.requestDataModel?.timeOfMeeting ?? '');
    shorTDescriptionTextController = TextEditingController(
        text: widget.requestDataModel?.shorTDescription ?? '');
    hoursNumberTextController = TextEditingController(
        text: widget.requestDataModel?.hour?? '');
  }


  @override
  void dispose() {
    // TODO: implement dispose
    locationTextController.dispose();
    dateOfMeetingTextController.dispose();
    timeTextController.dispose();
    shorTDescriptionTextController.dispose();
    hoursNumberTextController.dispose();
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
          'أضافة حجز',
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
                padding: EdgeInsets.only(
                    top: 20.h, right: 25.w, left: 25.w, bottom: 20.h),
                alignment: Alignment.center,
                width: double.infinity,
                height: 860.h,
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
                      'بخطوة واحدة',
                      style: TextStyle(
                        fontSize: 18.sp,
                        color: HexColor('#004AAD'),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      'يمكن حجز مترجم في أي موعد تريده و ارسال طلب له بحيث انه سيقوم\n بالموافقة أو رفض طلبك',
                      style: TextStyle(
                        fontSize: 9.sp,
                        color: HexColor('#004AAD'),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      'عدد ساعات الحجز',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: HexColor('#004AAD'),
                      ),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    TextField(
                      controller:  hoursNumberTextController,
                      decoration: InputDecoration(
                        label: Text(
                          '10',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: HexColor('#82B1EF'),
                          ),
                        ),
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: HexColor('#004AAD'),
                          ),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: HexColor('#004AAD'),
                          ),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      'موقع اللقاء',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: HexColor('#004AAD'),
                      ),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: locationTextController,
                            decoration: InputDecoration(
                              label: Text(
                                'جازان',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: HexColor('#82B1EF'),
                                ),
                              ),
                              fillColor: Colors.white,
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: HexColor('#004AAD'),
                                ),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: HexColor('#004AAD'),
                                ),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 6.w,
                        ),
                        InkWell(
                          onTap: () =>
                              Navigator.pushNamed(context, '/map_screen'),
                          child: Container(
                            width: 52.h,
                            height: 52.h,
                            decoration: BoxDecoration(
                              color: HexColor('#004AAD'),
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                            ),
                            child: Icon(
                              Icons.location_searching,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    Text(
                      'يمكنك اختيار موقعك بدلا من كتابته من خلال الايقونة في الجهة اليسرى قد يتطلب الامر\n تشغيل تحديد الموقع لهاتفك',
                      style: TextStyle(
                        fontSize: 8.sp,
                        color: HexColor('#004AAD'),
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      'تاريخ اللقاء',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: HexColor('#004AAD'),
                      ),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            keyboardType: TextInputType.phone,
                            enabled: false,
                            controller: dateOfMeetingTextController,
                            decoration: InputDecoration(
                              label: Text(
                                selectedDate.year.toString() +
                                    '/' +
                                    selectedDate.month.toString() +
                                    '/' +
                                    selectedDate.day.toString(),
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: HexColor('#82B1EF'),
                                ),
                              ),
                              fillColor: Colors.white,
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: HexColor('#004AAD'),
                                ),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              // enabledBorder: OutlineInputBorder(
                              //   borderSide: BorderSide(
                              //     color: HexColor('#004AAD'),
                              //   ),
                              //   borderRadius: BorderRadius.circular(15.0),
                              // ),
                              disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: HexColor('#004AAD'),
                                ),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 6.w,
                        ),
                        InkWell(
                          onTap: () => _selectDate(context),
                          child: Container(
                            width: 52.h,
                            height: 52.h,
                            decoration: BoxDecoration(
                              color: HexColor('#004AAD'),
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                            ),
                            child: Icon(
                              Icons.date_range,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    Text(
                      'يمكنك اختيار تاريخ ميلادك بدلا من كتابته من خلال الايقونة في الجهة اليسرى',
                      style: TextStyle(
                        fontSize: 9.sp,
                        color: HexColor('#004AAD'),
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      'موعد اللقاء',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: HexColor('#004AAD'),
                      ),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            keyboardType: TextInputType.phone,
                            enabled: false,
                            controller: timeTextController,
                            decoration: InputDecoration(
                              label: Text('${_time.format(context)}'),
                              fillColor: Colors.white,
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: HexColor('#004AAD'),
                                ),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              // enabledBorder: OutlineInputBorder(
                              //   borderSide: BorderSide(
                              //     color: HexColor('#004AAD'),
                              //   ),
                              //   borderRadius: BorderRadius.circular(15.0),
                              // ),
                              disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: HexColor('#004AAD'),
                                ),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 6.w,
                        ),
                        InkWell(
                          onTap: () => _selectTime(),
                          child: Container(
                            width: 52.h,
                            height: 52.h,
                            decoration: BoxDecoration(
                              color: HexColor('#004AAD'),
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                            ),
                            child: Icon(
                              Icons.timelapse_outlined,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    Text(
                      'يمكنك اختيار وقت اللقاء بدلا من كتابته من خلال الايقونة في الجهة اليسرى',
                      style: TextStyle(
                        fontSize: 9.sp,
                        color: HexColor('#004AAD'),
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      'وصف مختصر',
                      style: TextStyle(
                        fontSize: 14.sp,
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
                          borderSide: BorderSide(
                            color: HexColor('#004AAD'),
                          ),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: HexColor('#004AAD'),
                          ),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                      maxLines: 4,
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 48.h),
                        primary: HexColor('#004AAD'),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      onPressed: () {
                        performProcess();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.send,
                            size: 20,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            'أرسال الطلب',
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
        ],
      ),
    );
  }

  Future<void> performProcess() async {
    print('startPerformProcess');
    if (checkData()) {
      await process();
    }
  }

  bool checkData() {
    print('startCheckData');
    if (locationTextController.text.isNotEmpty &&
        shorTDescriptionTextController.text.isNotEmpty &&
        hoursNumberTextController.text.isNotEmpty) {
      print('startCheckDataTrue');
      return true;
    }
    showSnackBar(context: context, message: 'Enter required Data', error: true);
    print('startCheckDataFalse');
    return false;
  }

  Future<void> process() async {
    print('startProcess');
    bool status = widget.requestDataModel == null
        ? await FbStoreController()
            .createRequest(requestDataModel: requestDataModel)
        : await FbStoreController()
            // .updateRequest(requestDataModel: requestDataModel , id: requestDataModel.id);
            .updateRequest(requestDataModel: requestDataModel);
    // print(locationTextController.text);
    // print('startProcessEndIf');
    if (status) {

      // String token = NotificationController().getToken(widget.allUserDataModel.phone);
      // print(token.toString());


      NotificationController().sendPushMessage('لقد ارسل لك طلب جديد', 'طلب جديد', 'c1n_mQitQNqPbHWDABwl2f:APA91bErtzgs34yylebKfd03VOEqgcPUw1iR0J-0vznLXt1sCfVBCxt-UwOz2GBUNbanN-XHIFcSQWvKNzZxMgn_dfdL5wpdAqohYERjNY1tDu1KqDIClaOMMFSWy9vP4CuzMZSKR2lR', phone: widget.allUserDataModel.phone);

      print('startStatus');
      if (SharedPrefController().typeUser == 'user')
      {

        print('user');
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (BuildContext context) => MainScreen()),
          ModalRoute.withName('/'),
        );
      } else {
        print('other');
        Navigator.pushAndRemoveUntil(
          context,

          MaterialPageRoute(
              builder: (BuildContext context) => MainTranslatorScreen()),
          ModalRoute.withName('/'),
        );
      }
    }

    ///showSnackBar(context : context , message : status ? 'Process Success' : 'Process Failed', error : true);
  }

  RequestDataModel get requestDataModel {
    print('startGet');
    RequestDataModel requestDataModel = widget.requestDataModel == null
        ? RequestDataModel()
        : widget.requestDataModel!;
    print('01');
    // requestDataModel.id = SharedPrefController().phone + 'user';
    print('02');
    requestDataModel.location = locationTextController.text;
    print('03');
    requestDataModel.timeOfMeeting = _time.hour.toString() +':'+ _time.minute.toString();
    print('04');
    requestDataModel.shorTDescription = shorTDescriptionTextController.text;
    print('05');
    requestDataModel.dateOfMeeting = selectedDate.year.toString() +
        '/' +
        selectedDate.month.toString() +
        '/' +
        selectedDate.day.toString();

    print('06');
    // widget.requestDataModel == null ? requestDataModel.requestStatus = 'new': requestDataModel.requestStatus = 'update';
    requestDataModel.requestStatus = 'Active';
    print('07');
    requestDataModel.phoneTranslater = SharedPrefController().phoneTranlator;
    print('08');
    requestDataModel.dateOfCreate = createDate.year.toString() +
        '/' +
        createDate.month.toString() +
        '/' +
        createDate.day.toString();

    print('09');
    requestDataModel.latitude = SharedPrefController().latitude;
    print('10');
    requestDataModel.longtude = SharedPrefController().longtude;
    print('11');
    requestDataModel.phoneUser = SharedPrefController().phone;
    print('12');
    requestDataModel.translaterName = SharedPrefController().tranlatorName;
    print('13');
    requestDataModel.userName = SharedPrefController().name;
    print('14');
    requestDataModel.hour = hoursNumberTextController.text;
    print('15');
    print('endGet');
    print(requestDataModel);
    return requestDataModel;
  }


  void _selectTime() async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: _time,
    );
    if (newTime != null) {
      setState(() {
        _time = newTime;
      });
    }
  }

  void clear() {
    locationTextController.text = '';
    shorTDescriptionTextController.text = '';
    dateOfMeetingTextController.text = '';
    timeTextController.text = '';
    hoursNumberTextController.text = '';
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }
}


