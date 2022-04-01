class UserRegisterationModel {
  late var phone ;
  late var userType ;

  UserRegisterationModel(this.phone, this.userType);

  UserRegisterationModel.fromJson(Map<dynamic, dynamic> documentMap) {
    phone = documentMap['phone'];
    userType = documentMap['userType'];
  }
}