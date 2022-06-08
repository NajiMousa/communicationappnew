// import 'dart:html';
// import 'dart:ui';

import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:communication/pref/shread_pref.dart';
import 'package:communication/screens/nav_user_screens/home_screen.dart';
import 'package:communication/screens/nav_user_screens/job_screen.dart';
import 'package:communication/screens/nav_user_screens/learn_screen.dart';
import 'package:communication/screens/nav_user_screens/request%20_screen.dart';
import 'package:communication/screens/nav_user_screens/settings%20_screen.dart';
import 'package:communication/screens/user_profile_screens/edit_profile_user_screen.dart';
import 'package:communication/screens/user_profile_screens/show_translator_Profile_screen.dart';
import 'package:communication/screens/widgets/course_widget.dart';
import 'package:communication/screens/widgets/job_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../controller/fb_storage_controller.dart';
import '../../controller/translator_map_getx_controller.dart';
import '../../model/all_user_data_model.dart';

class MainMapScreen extends StatefulWidget {
  MainMapScreen(
      {Key? key, required this.listAllUserData, required this.listLatLng})
      : super(key: key);

  List<AllUserDataModel> listAllUserData;
  List<LatLng> listLatLng;

  @override
  _MainMapScreenState createState() => _MainMapScreenState();
}

class _MainMapScreenState extends State<MainMapScreen> {
  bool selected = false;
  late AllUserDataModel allUserDataModel;
  Completer<GoogleMapController> _controller = Completer();
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  @override
  void initState() {
    // TODO: implement initState
    // allUserDataModel = widget.listAllUserData[0];
    print('aAaAaA');
    // _controller = Completer();


    // for(int i=0;i<widget.listLatLng.length;i++){
    //   print(widget.listLatLng[i].latitude);
    // }
    // print('aAaAaA');
    // for(int i=0;i<TranslatorMapGetxController.to.usersMap.length; i++){
    //   _handleTap(TranslatorMapGetxController.to.usersMap[i]);
    //   print('for');
    //   m.add(
    //       Marker(
    //         markerId: MarkerId(point.toString()),
    //         position: point,
    //         infoWindow: InfoWindow(title: 'naji', snippet: 'first'),
    //         icon: BitmapDescriptor.defaultMarker,
    //       )
    //   print('111111111111111');
    //   print(TranslatorMapGetxController.to.usersMap[i]);
    // }
    // usersMapS = TranslatorMapGetxController.to.usersMap.
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor('#004AAD'),
        title: Text(
          'بحث عن مترجمين ',
          style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0,
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
      body: Stack(alignment: AlignmentDirectional.bottomCenter, children: [
        GoogleMap(
          onMapCreated: onCreated,
          initialCameraPosition: CameraPosition(target: _center, zoom: 10.0),
          myLocationEnabled: true,
          myLocationButtonEnabled: true,
          // markers: _markers,
          markers: Set<Marker>.of(markers.values),
          // trafficEnabled: true,
          // mapToolbarEnabled: false,
          //  mapType: MapType.satellite,
          // markers: _createMarker(),
          // mapType: _currentMapType,
          // onCameraMove: _onCameraMove,
          // onTap: _handleTap,
        ),
        selected
            ? InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ShowTranslatorProfileScreen(
                        allUserDataModel: allUserDataModel),
                  ),
                ),
                child: Container(
                  margin:
                      EdgeInsets.only(right: 30.w, left: 30.w, bottom: 30.h),
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
                  width: double.infinity,
                  height: 105.h,
                  decoration: BoxDecoration(
                    color: HexColor('#FAFBFD'),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      FutureBuilder<String>(
                        future: FbStorageController()
                            .readImage(name: allUserDataModel.phone),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return CircleAvatar(
                                radius: 30.r,
                                backgroundColor: Colors.transparent,
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
                                backgroundColor: Colors.transparent,
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
                      SizedBox(
                        width: 16.w,
                      ),
                      Column(
                        children: [
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    allUserDataModel.fullName,
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        color: HexColor('##004AAD')),
                                  ),
                                  Text(
                                    allUserDataModel.location,
                                    style: TextStyle(
                                        fontSize: 10.sp,
                                        color: HexColor('##004AAD')),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 55.h,
                              ),
                              Icon(Icons.arrow_forward_ios,
                                  size: 24.h, color: HexColor('##004AAD')),
                            ],
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                allUserDataModel.hourPrice,
                                style: TextStyle(
                                    fontSize: 10.sp,
                                    color: HexColor('##004AAD')),
                              ),
                              SizedBox(
                                width: 45.w,
                              ),
                              Text(
                                '10 - 15 دقيقة',
                                style: TextStyle(
                                    fontSize: 10.sp,
                                    color: HexColor('##004AAD')),
                              ),
                            ],
                          ),
                        ],
                      ),
                      // Container(
                      // margin:
                      // EdgeInsets.only(right: 70.w, left: 30.w),
                      // width: 80.w,
                      // height: 5.h,
                      // color: Colors.black,
                      // ),
                    ],
                  ),
                ),
              )
            : SizedBox(
                height: 1.h,
              )
      ]),
      floatingActionButton: FloatingActionButton(
        backgroundColor: HexColor('#004AAD'),
        onPressed: () => Navigator.pushNamed(context, '/map_screen'),
        child: Icon(
          Icons.my_location,
          color: Colors.white,
        ),
      ),
    );
  }

  late String latitudeG;
  late String longtudeG;
  static final LatLng _center =
      LatLng(31.411340, 34.348297); // تحديد النقطة المرجعية
  LatLng _lastMapPosition = _center;

  // final Set<Marker> _markers = {}; // انشاء علامة
  // Set<Marker> markerGlobal = {}; // انشاء علامة
  // String _title = "";
  // String _detail = "";

  // _handleTap(LatLng point) {
  //   // تحديد موقع
  //   print('first');
  //   latitudeG = point.latitude.toString();
  //   longtudeG = point.longitude.toString();
  //   print(point.toString());
  //   print(latitudeG);
  //   print(longtudeG);
  //   _markers.clear();
  //   // _getLocation(point);
  //   setState(() {
  //     _markers.add(Marker(
  //       markerId: MarkerId(point.toString()),
  //       position: point,
  //       infoWindow: InfoWindow(title: 'naji', snippet: 'first'),
  //       icon: BitmapDescriptor.defaultMarker,
  //     ));
  //   });
  // }

  // _onAddMarkerButtonPressed() {
  //   //  و حفظه اختيار موقع بناء على الضغط
  //   setState(() {
  //     markerGlobal = _markers;
  //   });
  // }

  void onCreated(GoogleMapController controller) async {
    // print('First');
    // print(widget.listLatLng.length);
    // print('Last');
    // _controller.complete(controller);
    // // if (widget.listLatLng.isNotEmpty) {
    // print('onTap');
    // for (int i = 0; i < widget.listLatLng.length; i++) {
    //   print('For01');
    //   for (int j = 0; j < widget.listAllUserData.length; j++) {
    //     print('For02');
    //     if ((widget.listAllUserData[j].longtude.toString() ==
    //             widget.listLatLng[i].longitude.toString()) &&
    //         (widget.listAllUserData[j].latitude.toString() ==
    //             widget.listLatLng[i].latitude.toString())) {
    //       print('If');
    //       allUserDataModel = widget.listAllUserData[j];
    //       print('allUserDataModel.phone');
    //       print(allUserDataModel.phone);
    //     }
    //   }
    // }

    for (int i = 0; i < widget.listLatLng.length; i++) {
      // if(widget.listLatLng[i].longitude.toString() == widget.listAllUserData[i].longtude.toString()){print('vvvvvvvvvv');}
      // print('vvvvvvvvvv');
      print(widget.listAllUserData[i].phone);
      // print('vvvvvvvvvv');
      markers[MarkerId(widget.listAllUserData[i].fullName)] = Marker(
        markerId: MarkerId(widget.listAllUserData[i].phone),
        position: LatLng(
            widget.listLatLng[i].latitude, widget.listLatLng[i].longitude),
        icon: BitmapDescriptor.defaultMarker,
        onTap: () {
          setState(() {
            selected = true;
            allUserDataModel = widget.listAllUserData[i];
          });
        },
      );
    }
    // for (int i = 0; i < widget.listLatLng.length; i++) {
    //   print('vvvvvvvvvv');
    //   markers[MarkerId('naji')] = Marker(
    //     markerId: MarkerId('najiId'),
    //     position: LatLng(31.411340, 34.348297),
    //     icon: BitmapDescriptor.defaultMarker,
    //     onTap: () {
    //       setState(() {
    //         selected = true;
    //       });
    //     },
    //   );
    // }
    // }
  }

// Set<Marker> _createMarker() {                                           // انشاء علامة
//   return {
//     Marker(                                                             // العلامة الاولى
//         markerId: MarkerId("marker_1"),
//         position: _center,
//         infoWindow: InfoWindow(title: 'Marker 1'),
//         rotation: 90),
//     Marker(                                                             // العلامة الثانية
//       markerId: MarkerId("marker_2"),
//       position: LatLng(35.411340, 22.348297),
//     ),
//   };
// }

// static final CameraPosition _kInitialPosition =                        // طريقة العرض
//     CameraPosition(target: _center, zoom: 14.0, tilt: 0, bearing: 0);

// void _onCameraMove(CameraPosition position) {                          // اظهار و تجديد المسار حال التحرك
//   _lastMapPosition = position.target;
// }

// _getLocation(LatLng point) async {
//   final coordinates = new Coordinates(point.latitude, point.longitude);
//   var addresses =
//   await Geocoder.local.findAddressesFromCoordinates(coordinates);
//   var first = addresses.first;
//   print("${first.featureName} : ${first.addressLine}");
//
//   setState(() {
//     _title = first.featureName;
//     _detail = first.addressLine;
//     _lane1.text = _title + "   " + _detail;
//   });
// }
//
// _getUserLocation() async {
//   Position position = await Geolocator()
//       .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
//   final coordinates = new Coordinates(position.latitude, position.longitude);
//   var addresses =
//   await Geocoder.local.findAddressesFromCoordinates(coordinates);
//   var first = addresses.first;
//   print("${first.featureName} : ${first.addressLine}");
//
//   final GoogleMapController controller = await _controller.future;
//   controller.animateCamera(
//     CameraUpdate.newCameraPosition(
//       CameraPosition(
//           target: LatLng(position.latitude, position.longitude), zoom: 16),
//     ),
//   );

// setState(() {
//   _title = first.featureName;
//   _detail = first.addressLine;
//   _lane1.text = _title + "   " + _detail;
// });
// }
}
