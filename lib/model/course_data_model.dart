import 'package:communication/pref/shread_pref.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';

class CourseDataModel {
  late String id ;
  late String courseName ;
  late String hourNumber ;
  late String userLike ;
  late String courseStatus ;
  late String location ;
  late String addDate ;
  late String courseInfo ;
  late String courseContent ;
  late String whatLearnInCourse ;
  late String courseDate ;
  late String courseType ;
  late String courseTriner ;
  late String trinerInfo ;
  late String courseLink ;

  CourseDataModel();

  CourseDataModel.fromJson(Map<dynamic, dynamic> documentMap) {
    courseName = documentMap['courseName'];
    hourNumber = documentMap['hourNumber'];
    userLike = documentMap['userLike'];
    courseStatus  = documentMap['courseStatus'];
    location = documentMap['location'];
    addDate = documentMap['addDate'];
    courseInfo = documentMap['courseInfo'];
    courseContent = documentMap['courseContent'];
    whatLearnInCourse = documentMap['whatLearnInCourse'];
    courseDate = documentMap['courseDate'];
    courseType = documentMap['courseType'];
    courseTriner = documentMap['courseTriner'];
    trinerInfo = documentMap['trinerInfo'];
    courseLink = documentMap['courseLink'];
  }

  Map<String ,dynamic> toMap(){
    print('startToMap');
    Map<String ,dynamic> map = <String ,dynamic> {};
    map['courseName'] = courseName;
    map['hourNumber'] = hourNumber;
    map['userLike'] = userLike;
    map['courseStatus'] = courseStatus;
    map['location'] = location;
    map['addDate'] = addDate;
    map['courseInfo'] = courseInfo;
    map['location'] = location;
    map['courseContent'] = courseContent;
    map['whatLearnInCourse'] = whatLearnInCourse;
    map['courseDate'] = courseDate;
    map['courseType'] = courseType;
    map['courseTriner'] = courseTriner;
    map['trinerInfo'] = trinerInfo;
    map['courseLink'] = courseLink;
    print('endToMap');
    return map;
  }
}