import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:communication/model/user_model.dart';

class FbStoreController {
  final firebaseFirestore = FirebaseFirestore.instance;
  late UserRegisterationModel userRegisterationModel ;

  // Future<void> addUser({required UserRegisterationModel userRegisterationModel}) async{
  //   return await firebaseFirestore.collection('users')
  //       .add({
  //     'phone': userRegisterationModel.phone, // John Doe
  //     'userType': userRegisterationModel.typeUser, // Stokes and Sons
  //   })
  //       .then((value) => print("User Added"))
  //       .catchError((error) => print("Failed to add user: $error"));
  // }
  // Future<List<UserRegisterationModel>> getUser () async {
  //   print('Begin GetUser');
  //   final userA = await firebaseFirestore.collection('users').get();
  //   print('GetUser');
  //   List<UserRegisterationModel> list = userA.docs.map((e) => UserRegisterationModel.fromJson(e.data())).toList();
  //   print('gggg');
  //   print(list.toString());
  //   return list;
  // }

  Future<void> addUser({required UserRegisterationModel userRegisterationModel}) async {
    await firebaseFirestore.collection("Users").add({
      "phone": userRegisterationModel.phone,
      "userType": userRegisterationModel.typeUser,
    });
  }
  Future<List<UserRegisterationModel>> getUser() async {
    final messages = await firebaseFirestore.collection("Users").get();
    List<UserRegisterationModel> list =  messages.docs.map((e) =>
        UserRegisterationModel.fromJson(e.data())).toList();
    return list;
  }
}