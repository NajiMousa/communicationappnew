import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:communication/model/all_user_data_model.dart';
import 'package:communication/model/user_registeration_model.dart';

class FbStoreController {
  final firebaseFirestore = FirebaseFirestore.instance;
  late UserRegisterationModel userRegisterationModel ;
  late AllUserDataModel allUserDataModel ;

  Future<void> addDataUser({required AllUserDataModel allUserDataModel}) async {
    await firebaseFirestore.collection("allDataUser").add({
      "phone": allUserDataModel.phone,
      "fullName": allUserDataModel.fullName,
      "shorTDescription": allUserDataModel.shorTDescription,
      "dateOfBirth": allUserDataModel.dateOfBirth,
      "gender": allUserDataModel.gender,
      "hourPrice": allUserDataModel.hourPrice,
      "email": allUserDataModel.email,
      "location": allUserDataModel.location,
      "image": allUserDataModel.image,
    });
  }

  Future<void> addUser({required UserRegisterationModel userRegisterationModel}) async {
    await firebaseFirestore.collection("Users").add({
      "phone": userRegisterationModel.phone,
      "userType": userRegisterationModel.userType,
    });
  }
  Future<List<UserRegisterationModel>> getUser() async {
    final messages = await firebaseFirestore.collection("Users").get();
    List<UserRegisterationModel> list =  messages.docs.map((e) =>
        UserRegisterationModel.fromJson(e.data())).toList();
    return list;
  }
}