import 'package:communication/pref/shread_pref.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';

class JobDataModel {
  late String id ;
  late String jobName ;
  late String expertiseYear ;
  late String jobStatus ;
  late String location ;
  late String addDate ;
  late String tasks ;
  late String conditions ;
  late String jobTitle ;
  late String lastDate ;
  late String jobType ;
  late String level ;
  late String salary ;
  late String degree ;
  late String jobLink ;

  JobDataModel();

  JobDataModel.fromJson(Map<dynamic, dynamic> documentMap) {
    // id = documentMap['id'];
    jobName = documentMap['jobName'];
    expertiseYear = documentMap['expertiseYear'];
    jobStatus = documentMap['jobStatus'];
    location = documentMap['location'];
    addDate = documentMap['addDate'];
    tasks = documentMap['tasks'];
    conditions = documentMap['conditions'];
    jobTitle = documentMap['jobTitle'];
    lastDate = documentMap['lastDate'];
    jobType = documentMap['jobType'];
    level = documentMap['level'];
    salary = documentMap['salary'];
    degree = documentMap['degree'];
    jobLink = documentMap['jobLink'];
  }

  Map<String ,dynamic> toMap(){
    print('startToMap');
    Map<String ,dynamic> map = <String ,dynamic> {};
    map['jobName'] = jobName;
    map['expertiseYear'] = expertiseYear;
    map['jobStatus'] = jobStatus;
    map['location'] = location;
    map['addDate'] = addDate;
    map['tasks'] = tasks;
    map['conditions'] = conditions;
    map['jobTitle'] = jobTitle;
    map['lastDate'] = lastDate;
    map['jobType'] = jobType;
    map['level'] = level;
    map['salary'] = salary;
    map['degree'] = degree;
    map['jobLink'] = jobLink;
    print('endToMap');
    return map;
  }
}