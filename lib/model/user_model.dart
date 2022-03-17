class UserRegisterationModel {
  late String phone ;
  late String typeUser ;

  UserRegisterationModel(this.phone, this.typeUser);

  UserRegisterationModel.fromJson(Map<dynamic, dynamic> documentMap) {
    phone = documentMap['phone'];
    typeUser = documentMap['typeUser'];
  }
}