import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:communication/model/all_user_data_model.dart';
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

  /// AllUserDataModel

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
}
