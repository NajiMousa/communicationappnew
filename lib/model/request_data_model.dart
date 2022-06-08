import 'package:communication/pref/shread_pref.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';

class RequestDataModel {
  late String id;
  late String phoneUser ;
  late String phoneTranslater ;
  late String dateOfMeeting ;
  late String dateOfCreate ;
  late String timeOfMeeting ;
  late String requestStatus ;
  late String shorTDescription ;
  late String translaterName ;
  late String userName ;
  late String hour ;
  late String latitude ;
  late String longtude ;
  // late String hoursNumber ;
  // late String fullNameUser ;
  // late String image ;
  // late String dateOfBirth ;
  // late String gender ;
  // late String hourPrice ;
  // late String email ;
  // late LatLng location ;
  late String location ;

  RequestDataModel();

  RequestDataModel.fromJson(Map<dynamic, dynamic> documentMap) {
    // id = documentMap['id'];
    phoneUser = documentMap['phoneUser'];
    phoneTranslater = documentMap['phoneTranslater'];
    dateOfMeeting = documentMap['dateOfMeeting'];
    shorTDescription = documentMap['shorTDescription'];
    dateOfCreate = documentMap['dateOfCreate'];
    hour = documentMap['hour'];
    timeOfMeeting = documentMap['timeOfMeeting'];
    requestStatus = documentMap['requestStatus'];
    latitude = documentMap['latitude'];
    longtude = documentMap['longtude'];
    translaterName = documentMap['translaterName'];
    userName = documentMap['userName'];
    location = documentMap['location'];

    // hoursNumber = documentMap['hoursNumber'];
  }

  Map<String ,dynamic> toMap(){
    print('startToMap');
    Map<String ,dynamic> map = <String ,dynamic> {};
    // map['id'] = id;
    map['phoneUser'] = phoneUser;
    map['phoneTranslater'] = phoneTranslater;
    map['shorTDescription'] = shorTDescription;
    map['dateOfMeeting'] = dateOfMeeting;
    map['dateOfCreate'] = dateOfCreate;
    map['timeOfMeeting'] = timeOfMeeting;
    map['requestStatus'] = requestStatus;
    map['latitude'] = latitude;
    map['longtude'] = longtude;
    // map['image'] = image;
    map['translaterName'] = translaterName;
    map['userName'] = userName;
    map['location'] = location;
    map['hour'] = hour;
    // map['hoursNumber'] = hoursNumber;
    print('endToMap');
    return map;
  }

}