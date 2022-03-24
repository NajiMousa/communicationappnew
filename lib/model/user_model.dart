class UserRegisterationModel {
  late var phone ;
  late var typeUser ;

  UserRegisterationModel(this.phone, this.typeUser);

  UserRegisterationModel.fromJson(Map<dynamic, dynamic> documentMap) {
    phone = documentMap['phone'];
    typeUser = documentMap['typeUser'];
  }
}