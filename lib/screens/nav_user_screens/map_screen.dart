// import 'dart:html';
// import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:communication/screens/nav_user_screens/home_screen.dart';
import 'package:communication/screens/nav_user_screens/job_screen.dart';
import 'package:communication/screens/nav_user_screens/learn_screen.dart';
import 'package:communication/screens/nav_user_screens/request%20_screen.dart';
import 'package:communication/screens/nav_user_screens/settings%20_screen.dart';
import 'package:communication/screens/widgets/course_widget.dart';
import 'package:communication/screens/widgets/job_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hexcolor/hexcolor.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  int cruuentPageIndex = 0;
  List pageTitle = ['الرئيسية', 'زد معرفتك', 'طلبات', 'وظائف', 'الاعدادات'];

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
      body: GoogleMap(
        initialCameraPosition: _kInitialPosition,
        myLocationEnabled: true,
        // mapType: MapType.satellite,
        markers: _createMarker(),
        trafficEnabled: true,
        // mapToolbarEnabled: true,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: HexColor('#004AAD'),
        onPressed: () => Navigator.pushNamed(context, '/map_screen'),
        child: Icon(Icons.my_location,color: Colors.white,),
      ),
    );
  }

  static final LatLng _kMapCenter = LatLng(31.411340, 34.348297);

  static final CameraPosition _kInitialPosition =
      CameraPosition(target: _kMapCenter, zoom: 14.0, tilt: 0, bearing: 0);

  Set<Marker> _createMarker() {
    return {
      Marker(
          markerId: MarkerId("marker_1"),
          position: _kMapCenter,
          infoWindow: InfoWindow(title: 'Marker 1'),
          rotation: 90),
      Marker(
        markerId: MarkerId("marker_2"),
        position: LatLng(18.997962200185533, 72.8379758747611),
      ),
    };
  }
}
