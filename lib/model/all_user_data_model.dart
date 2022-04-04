import 'package:google_maps_flutter/google_maps_flutter.dart';

class AllUserDataModel {
  late String phone ;
  late String fullName ;
  late String shorTDescription ;
  late String dateOfBirth ;
  late String gender ;
  late String hourPrice ;
  late String email ;
  // late LatLng location ;
  late String location ;
  late String image ;


  AllUserDataModel(
      this.phone,
      this.fullName,
      this.shorTDescription,
      this.dateOfBirth,
      this.gender,
      this.hourPrice,
      this.email,
      this.location,
      this.image);

  AllUserDataModel.fromJson(Map<dynamic, dynamic> documentMap) {
    phone = documentMap['phone'];
    fullName = documentMap['fullName'];
    shorTDescription = documentMap['shorTDescription'];
    dateOfBirth = documentMap['dateOfBirth'];
    gender = documentMap['gender'];
    hourPrice = documentMap['hourPrice'];
    email = documentMap['email'];
    location = documentMap['location'];
    image = documentMap['image'];
  }
}