// import 'dart:html';
// import 'dart:ui';

import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:communication/model/request_data_model.dart';
import 'package:communication/pref/shread_pref.dart';
import 'package:communication/screens/nav_user_screens/home_screen.dart';
import 'package:communication/screens/nav_user_screens/job_screen.dart';
import 'package:communication/screens/nav_user_screens/learn_screen.dart';
import 'package:communication/screens/nav_user_screens/request%20_screen.dart';
import 'package:communication/screens/nav_user_screens/settings%20_screen.dart';
import 'package:communication/screens/user_profile_screens/edit_profile_user_screen.dart';
import 'package:communication/screens/widgets/course_widget.dart';
import 'package:communication/screens/widgets/job_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../controller/translator_map_getx_controller.dart';

class MapScreen extends StatefulWidget {
   MapScreen({Key? key , this.requestDataModel}) : super(key: key);

  late RequestDataModel? requestDataModel ;

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  int cruuentPageIndex = 0;
  List pageTitle = ['الرئيسية', 'زد معرفتك', 'طلبات', 'وظائف', 'الاعدادات'];

  @override
  void initState() {
    // widget.requestDataModel != null ?
    // _markers.add(
    //     Marker(
    //       markerId: MarkerId(widget.requestDataModel!.phoneUser.toString()),
    //       position: LatLng(
    //           double.parse(widget.requestDataModel!.latitude), double.parse(widget.requestDataModel!.longtude)),
    //       // infoWindow: InfoWindow(title: 'naji', snippet: 'first'),
    //       icon: BitmapDescriptor.defaultMarker,
    //     )) :
    // _markers.add(
    //     Marker(
    //       markerId: MarkerId(widget.requestDataModel!.phoneUser.toString()),
    //       position: LatLng(
    //           double.parse(widget.requestDataModel!.latitude), double.parse(widget.requestDataModel!.longtude)),
    //       // infoWindow: InfoWindow(title: 'naji', snippet: 'first'),
    //       icon: BitmapDescriptor.defaultMarker,
    //     ));
    super.initState();
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
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(target: _center, zoom: 14.0),
            myLocationEnabled: true,
            myLocationButtonEnabled:true,
            markers: _markers,
            onTap: _handleTap,
          ),
          widget.requestDataModel == null ? Padding(
            padding: EdgeInsets.only(right: 30.w,left: 30.w,bottom: 30.h),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 48.h),
                primary: HexColor('#004AAD'),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),

              onPressed: () {
                // _onAddMarkerButtonPressed();
                print(latitudeG);
                print(longtudeG);
                SharedPrefController().setLocationUser(latitudeL: latitudeG, longtudeL: longtudeG);
                Navigator.pop(context);
              },
              child: Text(
                'تسجيل الموقع',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.white,
                ),
              ),
            ),
          ):SizedBox(),
        ],
      ),
    );
  }

  late String latitudeG ;
  late String longtudeG ;

  static final LatLng _center = LatLng(31.411340, 34.348297);             // تحديد النقطة المرجعية
  LatLng _lastMapPosition = _center;
  final Set<Marker> _markers = {};                                        // انشاء علامة
  Set<Marker> markerGlobal = {};                                        // انشاء علامة
  String _title = "";
  String _detail = "";

  _handleTap(LatLng point) {                                                // تحديد موقع
    print('first');
    latitudeG = point.latitude.toString();
    longtudeG = point.longitude.toString();
    print(point.toString());
    print(latitudeG);
    print(longtudeG);
    _markers.clear();
    // _getLocation(point);
    setState(() {
      _markers.add(
          Marker(
            markerId: MarkerId(point.toString()),
            position: point,
            // infoWindow: InfoWindow(title: 'naji', snippet: 'first'),
            icon: BitmapDescriptor.defaultMarker,
          )
      );
    });
  }

// _onAddMarkerButtonPressed() {                                       //  و حفظه اختيار موقع بناء على الضغط
//   setState(() {
//     markerGlobal = _markers;
//
//   });
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
// }
