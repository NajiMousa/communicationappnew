import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:communication/model/all_user_data_model.dart';
import 'package:communication/model/course_data_model.dart';
import 'package:communication/model/evaluation_data_model.dart';
import 'package:communication/model/job_data_model.dart';
import 'package:communication/model/user_registeration_model.dart';

import '../model/request_data_model.dart';

class FbStoreController {
  final firebaseFirestore = FirebaseFirestore.instance;
  late UserRegisterationModel userRegisterationModel;

  late AllUserDataModel allUserDataModel;

  late RequestDataModel requestDataModel;

  // Future<void> addDataUser({required AllUserDataModel allUserDataModel}) async {
  //   await firebaseFirestore.collection("allDataUser").add({
  //     "phone": allUserDataModel.phone,
  //     "fullName": allUserDataModel.fullName,
  //     "shorTDescription": allUserDataModel.shorTDescription,
  //     "dateOfBirth": allUserDataModel.dateOfBirth,
  //     "gender": allUserDataModel.gender,
  //     "hourPrice": allUserDataModel.hourPrice,
  //     "email": allUserDataModel.email,
  //     "location": allUserDataModel.location,
  //     "image": allUserDataModel.image,
  //   });
  // }

  // /// NotificationController
  //
  // Future<bool> createNotification(
  //     {required EvaluationDataModel evaluationDataModel}) async {
  //   print('createNotification');
  //   return firebaseFirestore
  //       .collection('TokenUser')
  //       .doc(phone+'').set({
  //     'tokenFilledUser' : tokenId;
  //   });
  // }
  //
  // Stream<QuerySnapshot> readEvaluation() async* {
  //   print('read');
  //   yield* firebaseFirestore.collection('evaluationDataModel').snapshots();
  // }
  //
  /// EvaluationTranslator

  Future<bool> createEvaluation(
      {required EvaluationDataModel evaluationDataModel}) async {
    print('createRequest');
    return firebaseFirestore
        .collection('evaluationDataModel')
        .add(evaluationDataModel.toMap())
        .then((value) => true)
        .catchError((error) => false);
  }

  Stream<QuerySnapshot> readEvaluation() async* {
    print('read');
    yield* firebaseFirestore.collection('evaluationDataModel').snapshots();
  }

  /// Requests

  Future<bool> createRequest(
      {required RequestDataModel requestDataModel}) async {
    print('createRequest');
    return firebaseFirestore
        .collection('requestDataModel')
        .add(requestDataModel.toMap())
        .then((value) => true)
        .catchError((error) => false);
  }

  Future<bool> updateRequest(
      {required RequestDataModel requestDataModel}) async {
    print('update');
    print('requestDataModel.requestStatus');
    print(requestDataModel.requestStatus);
    return firebaseFirestore
        .collection('requestDataModel')
        // .where('id',isEqualTo: requestDataModel.id)
        .doc(requestDataModel.id)
        .update(requestDataModel.toMap())
        .then((value) => true)
        .catchError((error) => false);
  }

  Stream<QuerySnapshot> readRequest() async* {
    print('read');
    yield* firebaseFirestore.collection('requestDataModel').snapshots();
  }

  Future<List<RequestDataModel>> getAllRequestData() async {
    print('startGetAllRequestData');
    final messages =
        await firebaseFirestore.collection("requestDataModel").get();
    print('getAllRequestData');
    List<RequestDataModel> list =
        messages.docs.map((e) => RequestDataModel.fromJson(e.data())).toList();
    print('endGetAllRequestData');
    return list;
  }

  /// AllUserDataModel

  Future<bool> create({required AllUserDataModel allUserDataModel}) {
    print('create');
    return firebaseFirestore
        .collection('allDataUser')
        .add(allUserDataModel.toMap())
        .then((value) => true)
        .catchError((error) => false);
  }

  Future<bool> update({required AllUserDataModel allUserDataModel}) {
    print('update');
    print(allUserDataModel.id);
    return firebaseFirestore
        .collection('allDataUser')
        .doc(allUserDataModel.id)
        .update(allUserDataModel.toMap())
        .then((value) => true)
        .catchError((error) => false);
  }

  Future<List<AllUserDataModel>> getDataUser() async {
    print('startGetDataUser');
    final messages = await firebaseFirestore.collection("allDataUser").get();
    print('GetDataUser');
    List<AllUserDataModel> list =
        messages.docs.map((e) => AllUserDataModel.fromJson(e.data())).toList();
    print('endGetDataUser');
    return list;
  }


  ///  UserRegisterationModel

  Future<void> addUser(
      {required UserRegisterationModel userRegisterationModel}) async {
    await firebaseFirestore.collection("Users").add({
      "phone": userRegisterationModel.phone,
      "userType": userRegisterationModel.userType,
    });
  }

  Future<List<UserRegisterationModel>> getUser() async {
    final messages = await firebaseFirestore.collection("Users").get();
    List<UserRegisterationModel> list = messages.docs
        .map((e) => UserRegisterationModel.fromJson(e.data()))
        .toList();
    return list;
  }

  /// Job

  Future<bool> createJob(
      {required JobDataModel jobDataModel}) async {
    print('createJob');
    return firebaseFirestore
        .collection('jobDataModel')
        .add(jobDataModel.toMap())
        .then((value) => true)
        .catchError((error) => false);
  }

  Future<bool> updateJob(
      {required JobDataModel jobDataModel}) async {
    print('updateJob');
    return firebaseFirestore
        .collection('jobDataModel')
        .doc(jobDataModel.id)
        .update(jobDataModel.toMap())
        .then((value) => true)
        .catchError((error) => false);
  }

  Stream<QuerySnapshot> readJob() async* {
    print('readJob');
    yield* firebaseFirestore.collection('jobDataModel').snapshots();
  }

  Future<List<JobDataModel>> getJob() async {
    final messages = await firebaseFirestore.collection("jobDataModel").get();
    List<JobDataModel> list = messages.docs
        .map((e) => JobDataModel.fromJson(e.data()))
        .toList();
    return list;
  }

  /// Course

  Future<bool> createCourse(
      {required CourseDataModel courseDataModel}) async {
    print('createJob');
    return firebaseFirestore
        .collection('courseDataModel')
        .add(courseDataModel.toMap())
        .then((value) => true)
        .catchError((error) => false);
  }

  Future<bool> updateCourse(
      {required CourseDataModel courseDataModel}) async {
    print('updateCourse');
    return firebaseFirestore
        .collection('courseDataModel')
        .doc(courseDataModel.id)
        .update(courseDataModel.toMap())
        .then((value) => true)
        .catchError((error) => false);
  }

  Stream<QuerySnapshot> readCourse() async* {
    print('readJob');
    yield* firebaseFirestore.collection('courseDataModel').snapshots();
  }

  Future<List<CourseDataModel>> getCourse() async {
    final messages = await firebaseFirestore.collection("courseDataModel").get();
    List<CourseDataModel> list = messages.docs
        .map((e) => CourseDataModel.fromJson(e.data()))
        .toList();
    return list;
  }
}
