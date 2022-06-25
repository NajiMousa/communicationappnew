import 'package:communication/pref/shread_pref.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';

class EvaluationDataModel {
  late String id;
  late String phoneUser ;
  late String phoneTranslater ;
  late String dateOfCreate ;
  late String shorTDescription ;
  late String translaterName ;
  late String userName ;
  late String allEvaluation ;
  late String exteriorStar ;
  late String dateStar ;
  late String skillsStar ;
  late String dealStar ;

  EvaluationDataModel();

  EvaluationDataModel.fromJson(Map<dynamic, dynamic> documentMap) {
    phoneUser = documentMap['phoneUser'];
    phoneTranslater = documentMap['phoneTranslater'];
    dateOfCreate = documentMap['dateOfCreate'];
    shorTDescription = documentMap['shorTDescription'];
    translaterName = documentMap['translaterName'];
    userName = documentMap['userName'];
    allEvaluation = documentMap['allEvaluation'];
    exteriorStar = documentMap['exteriorStar'];
    dateStar = documentMap['dateStar'];
    skillsStar = documentMap['skillsStar'];
    dealStar = documentMap['dealStar'];

  }

  Map<String ,dynamic> toMap(){
    print('startToMap');
    Map<String ,dynamic> map = <String ,dynamic> {};
    // map['id'] = id;
    map['phoneUser'] = phoneUser;
    map['phoneTranslater'] = phoneTranslater;
    map['dateOfCreate'] = dateOfCreate;
    map['shorTDescription'] = shorTDescription;
    map['translaterName'] = translaterName;
    map['userName'] = userName;
    map['allEvaluation'] = allEvaluation;
    map['exteriorStar'] = exteriorStar;
    map['dateStar'] = dateStar;
    map['skillsStar'] = skillsStar;
    map['dealStar'] = dealStar;

    print('endToMap');
    return map;
  }

}