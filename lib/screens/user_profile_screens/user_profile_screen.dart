import 'package:communication/controller/translator_map_getx_controller.dart';
import 'package:communication/screens/user_profile_screens/edit_profile_user_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../controller/fb_storage_controller.dart';
import '../../controller/fb_store_controller.dart';
import '../../model/all_user_data_model.dart';
import '../../pref/shread_pref.dart';

class UserProfileScreen extends StatefulWidget {
  UserProfileScreen({
    Key? key,
   required this.allUserDataModel,
  }) : super(key: key);
  final AllUserDataModel allUserDataModel;

  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // enterData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 14.h,
          ),
        ),
        backgroundColor: HexColor('#004AAD'),
        title: Text(
          'الملف الشخصي',
          style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () => editProfile(),
            icon: Icon(
              Icons.edit,
              color: HexColor('#FAFBFD'),
              size: 24.h,
            ),
          ),
        ],
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
                height: 184.h,
                decoration: BoxDecoration(
                  color: HexColor('#004AAD'),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.h, right: 30.w, left: 30.w),
                child: Row(
                  children: [
                    Container(
                      width: 109.w,
                      height: 143.h,
                      decoration: BoxDecoration(
                        color: HexColor('#82B1EF'),
                        borderRadius: BorderRadius.all(
                          Radius.circular(25),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            child: FutureBuilder<String>(
                              future: FbStorageController()
                                  .readImage(
                                  name: SharedPrefController().phone),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return CircleAvatar(
                                      radius: 30.r,
                                      backgroundColor:
                                      Colors.transparent,
                                      child: ClipOval(
                                        child: Image.network(
                                          snapshot.data.toString(),
                                          fit: BoxFit.cover,
                                          height: 60.h,
                                          width: 60.w,
                                        ),
                                      ));
                                } else {
                                  return CircleAvatar(
                                      radius: 30.r,
                                      backgroundColor:
                                      Colors.transparent,
                                      child: ClipOval(
                                        child: Image.asset(
                                          "images/user.png",
                                          fit: BoxFit.cover,
                                          height: 60.h,
                                          width: 60.w,
                                        ),
                                      ));
                                }
                              },
                            ),
                            maxRadius: 33.h,
                          ),
                          SizedBox(
                            height: 14.h,
                          ),
                          InkWell(
                            onTap: () {
                                print('startOnTap');
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) =>
                                //         EditProfileUserScreen(
                                //             title: 'create',
                                //             allUserDataModel : null),
                                //   ),
                                // );
                              editProfile();
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.edit,
                                  color: HexColor('#004AAD'),
                                  size: 16.h,
                                ),
                                SizedBox(
                                  width: 8.w,
                                ),
                                Text(
                                  'تعديل الملف الشخصي',
                                  style: TextStyle(
                                      fontSize: 8.sp, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 17.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              // 'شوق المنصور',
                              widget.allUserDataModel.fullName,
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 4.w,
                            ),
                            Icon(
                              Icons.check_circle,
                              size: 16.h,
                              color: HexColor('#B0EEE4'),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Text(
                          widget.allUserDataModel.email,
                          style: TextStyle(
                            fontSize: 10.sp,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        Text(
                          widget.allUserDataModel.shorTDescription,
                          style: TextStyle(
                            fontSize: 9.sp,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 25.h,
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: 30.w),
                width: 140.w,
                height: 70.h,
                decoration: BoxDecoration(
                  color: HexColor('#82B1EF'),
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.help_center,
                      size: 24.h,
                      color: HexColor('#004AAD'),
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    Text(
                      'المساعدة',
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                          color: HexColor('#004AAD')),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Container(
                margin: EdgeInsets.only(left: 30.w),
                width: 140.w,
                height: 70.h,
                decoration: BoxDecoration(
                  color: HexColor('#82B1EF'),
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.wallet_giftcard,
                      size: 24.h,
                      color: HexColor('#004AAD'),
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    Text(
                      'المحفظة',
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                          color: HexColor('#004AAD')),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 25.h,
              right: 65.w,
            ),
            child: Column(
              children: [
                ListTile(
                  visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                  leading: Icon(
                    Icons.call,
                    color: HexColor('#004AAD'),
                  ),
                  title: Text(
                    SharedPrefController().phone,
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: HexColor('#004AAD'),
                    ),
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                ListTile(
                  visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                  leading: Icon(
                    Icons.date_range,
                    color: HexColor('#004AAD'),
                  ),
                  title: Text(
                    widget.allUserDataModel.dateOfBirth,
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: HexColor('#004AAD'),
                    ),
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                ListTile(
                  visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                  leading: Icon(
                    Icons.home_outlined,
                    color: HexColor('#004AAD'),
                  ),
                  title: Text(
                    widget.allUserDataModel.location,
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: HexColor('#004AAD'),
                    ),
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                ListTile(
                  visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                  leading: Icon(
                    Icons.transgender_outlined,
                    color: HexColor('#004AAD'),
                  ),
                  title: Text(
                    widget.allUserDataModel.gender,
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: HexColor('#004AAD'),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void editProfile () async{
    List<AllUserDataModel> userList =
        await FbStoreController().getDataUser();
    print('editProfile');
    for (int i = 0; i < userList.length; i++) {
      print(SharedPrefController().phone);
      if (userList[i].phone ==
          SharedPrefController().phone) {
        print('ddddddd');
        // print(userList[i]);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                EditProfileUserScreen(
                  title: 'update',
                  allUserDataModel: userList[i],
                ),
          ),
        );
      }
      print(userList[i].fullName);
      print('hhhhhhhhh');
    }
    print(userList.length);
  }
}