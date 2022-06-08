import 'package:communication/pref/shread_pref.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';

class AllUserDataModel {
  late String id ;
  late String phone ;
  late String fullName ;
  late String shorTDescription ;
  late String dateOfBirth ;
  late String gender ;
  late String hourPrice ;
  late String email ;
  // late LatLng location ;
  late String location ;
  late String latitude ;
  late String longtude ;
  late String image ;

  AllUserDataModel();

  AllUserDataModel.fromJson(Map<dynamic, dynamic> documentMap) {
    // id = documentMap['id'];
    phone = documentMap['phone'];
    fullName = documentMap['fullName'];
    shorTDescription = documentMap['shorTDescription'];
    dateOfBirth = documentMap['dateOfBirth'];
    gender = documentMap['gender'];
    hourPrice = documentMap['hourPrice'];
    email = documentMap['email'];
    location = documentMap['location'];
    latitude = documentMap['latitude'];
    longtude = documentMap['longtude'];
    image = documentMap['image'];
  }

  Map<String ,dynamic> toMap(){
    print('startToMap');
    Map<String ,dynamic> map = <String ,dynamic> {};
    map['id'] = SharedPrefController().phone+'user';
    map['phone'] = SharedPrefController().phone;
    map['fullName'] = fullName;
    map['shorTDescription'] = shorTDescription;
    map['dateOfBirth'] = dateOfBirth;
    map['gender'] = gender;
    map['hourPrice'] = hourPrice;
    map['email'] = email;
    map['location'] = location;
    map['latitude'] = latitude;
    map['longtude'] = longtude;
    map['image'] = image;
    print('endToMap');
    return map;
  }
}