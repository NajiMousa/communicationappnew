// import 'dart:html';
// import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:communication/controller/translator_map_getx_controller.dart';
import 'package:communication/model/all_user_data_model.dart';
import 'package:communication/model/request_data_model.dart';
import 'package:communication/model/user_registeration_model.dart';
import 'package:communication/screens/nav_user_screens/home_screen.dart';
import 'package:communication/screens/nav_user_screens/job_screen.dart';
import 'package:communication/screens/nav_user_screens/learn_screen.dart';
import 'package:communication/screens/nav_user_screens/main_map_screen.dart';
import 'package:communication/screens/nav_user_screens/request%20_screen.dart';
import 'package:communication/screens/nav_user_screens/settings%20_screen.dart';
import 'package:communication/screens/widgets/course_widget.dart';
import 'package:communication/screens/widgets/job_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../controller/fb_store_controller.dart';
import '../../pref/shread_pref.dart';
import '../translator_screens/nav_translator_screens/request _screen.dart';

class MainScreen extends StatefulWidget {
   MainScreen({Key? key,}) : super(key: key);

   // AllUserDataModel allUserDataModel;

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  List<AllUserDataModel> userList = [];
  late List<AllUserDataModel> userListG = [];
  List<RequestDataModel> allRequestDataModel = [];
  List<UserRegisterationModel> allUserRegisterationModel = [];
  List<UserRegisterationModel> allUserRegisterationModelG = [];
  // TranslatorMapGetxController controller = Get.put(TranslatorMapGetxController());

  AllUserDataModel allUserDataModel = AllUserDataModel();
  List<LatLng> listLatLng = [];

  // List<LatLng> listLatLngG = [];

  @override
  void initState() {
    // TODO: implement initState
    // getData();
    super.initState();

  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  int cruuentPageIndex = 0;
  List pageTitle = ['الرئيسية', 'زد معرفتك', 'طلبات', 'وظائف', 'الاعدادات'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor('#004AAD'),
        title: Text(
          cruuentPageIndex == 0
              ? pageTitle[0]
              : cruuentPageIndex == 1
                  ? pageTitle[1]
                  : cruuentPageIndex == 2
                      ? pageTitle[2]
                      : cruuentPageIndex == 3
                          ? pageTitle[3]
                          : pageTitle[4],
          style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0,
        shape: cruuentPageIndex == 3
            ? const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(0),
                ),
              )
            : const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_rounded,
              color: HexColor('#FAFBFD'),
              size: 24.h,
            ),
          ),
        ],
      ),
      backgroundColor: HexColor('#FAFBFD'),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
                size: 20.h,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.menu_book_outlined,
                size: 20.h,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.volume_up_outlined,
                size: 20.h,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.shop_outlined,
                size: 20.h,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
                size: 20.h,
              ),
              label: ''),
        ],
        currentIndex: cruuentPageIndex,
        // showSelectedLabels: false,
        unselectedItemColor: HexColor("#004AAD"),
        selectedItemColor: HexColor("#F79355"),
        backgroundColor: Colors.white,
        onTap: (int index) {
          setState(() {
            cruuentPageIndex = index;
          });
        },
      ),
      body: cruuentPageIndex == 0
          ?  HomeScreen(allUserDataModel: allUserDataModel,listAllUserData: userList,listLatLng: listLatLng)
          : cruuentPageIndex == 1
              ? const LearnScreen()
              : cruuentPageIndex == 2
                  // ?  RequestTranslatorScreen(allUserDataModel: userList,requestDataModel: allRequestDataModel,)
                  ?  RequestScreen()
                  : cruuentPageIndex == 3
                      ? const JobScreen()
                      : const SettingsScreen(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: HexColor('#004AAD'),
        onPressed: () async{
          await  getData();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  MainMapScreen(listAllUserData: userListG, listLatLng: listLatLng),
            ),
          );
        },
        child: Icon(Icons.my_location,color: Colors.white,),
      ),
    );
  }

  Future<void> getData () async{
    userList = await FbStoreController().getDataUser();
    allRequestDataModel = await FbStoreController().getAllRequestData();
    allUserRegisterationModel = await FbStoreController().getUser();
    print('ddddddddddddddddddddddddddddddddddddd');
    /// add Just Translate User in newList
    for (int i = 0; i < allUserRegisterationModel.length; i++){
      if(allUserRegisterationModel[i].userType == 'translate'){
        allUserRegisterationModelG.add(allUserRegisterationModel[i]);
      }
    }

    /// add Just Translate User Data in newList
    for (int i = 0; i < userList.length ; i++){
      print('forTwo');
      for (int j = 0; j<allUserRegisterationModelG.length; j++){
        print('forTwo01');
        if(userList[i].phone.toString() == allUserRegisterationModelG[j].phone.toString()){
          print('ifTure');
          userListG.add(userList[i]);
          print(userListG.length);
        }

      }
    }



    /// Add Translate Data And Location in list to show in map

    for (int i = 0; i < userList.length; i++) {
      for(int j = 0; j < allUserRegisterationModelG.length; j++){
        if(userList[i].phone == allUserRegisterationModelG[j].phone){
          print('userList[i].phone');
          print(userList[i].phone);
          listLatLng.add(LatLng(double.parse(userList[i].latitude),double.parse(userList[i].longtude)));
        }
        if (userList[i].phone == SharedPrefController().phone) {
          setState(() {
            allUserDataModel = userList[i];
          });
          SharedPrefController().setName(name: userList[i].fullName);
        }
      }
    }
  }
}
