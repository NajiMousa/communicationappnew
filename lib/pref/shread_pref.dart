import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum prefKey {
  loggedIn,
  phone,
  langnge,
  typeUser,
  firstTimeAddData,
  latitude,
  longtude,
  imagePath,
  name,
  phoneTranlator,
  tranlatorName,
}

class SharedPrefController {
  //Singleton Design Pattern

  static final SharedPrefController _instance =
      SharedPrefController._internal();

  late SharedPreferences _sharedPreferences;

  SharedPrefController._internal();

  factory SharedPrefController() {
    return _instance;
  }

  Future<void> initSharedPref() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> saveData(
      {required String phone, required String typeUser}) async {
    print('Pref save Data');
    await _sharedPreferences.setBool(prefKey.loggedIn.toString(), true);
    // await _sharedPreferences.setBool(prefKey.firstTimeAddData.toString(), false);
    print(prefKey.firstTimeAddData.toString());
    print('Yes');
    print(prefKey.loggedIn.toString());
    await _sharedPreferences.setString(prefKey.phone.toString(), phone);
    await _sharedPreferences.setString(prefKey.typeUser.toString(), typeUser);
  }

  String get phone =>
      _sharedPreferences.getString(prefKey.phone.toString()) ?? 'noPhone';

  String get typeUser =>
      _sharedPreferences.getString(prefKey.typeUser.toString()) ?? 'user';

  Future<void> setLanguage() async {
    await _sharedPreferences.setString(
        prefKey.langnge.toString(), language == 'en' ? 'ar' : 'en');
  }

  String get language =>
      _sharedPreferences.getString(prefKey.langnge.toString()) ?? 'en';

  Future<void> setPhoneTranlator({required String phoneTranlator}) async {
    await _sharedPreferences.setString(
        prefKey.phoneTranlator.toString(), phoneTranlator);
  }

  String get phoneTranlator =>
      _sharedPreferences.getString(prefKey.phoneTranlator.toString()) ?? '';

  Future<void> setTranlatorName({required String tranlatorName}) async {
    await _sharedPreferences.setString(
        prefKey.tranlatorName.toString(), tranlatorName);
  }

  String get tranlatorName =>
      _sharedPreferences.getString(prefKey.tranlatorName.toString()) ?? '';

  Future<void> setImage({required String imagePath}) async {
    await _sharedPreferences.setString(prefKey.imagePath.toString(), imagePath);
  }

  String get image =>
      _sharedPreferences.getString(prefKey.langnge.toString()) ?? '';

  Future<void> setFirstTime({required bool firstTimeAdd}) async {
    await _sharedPreferences.setBool(
        prefKey.firstTimeAddData.toString(), firstTimeAdd);
  }

  bool get firstTimeAddData =>
      _sharedPreferences.getBool(prefKey.firstTimeAddData.toString()) ?? true;

  Future<void> setLocationUser(
      {required String latitudeL, required String longtudeL}) async {
    print('setLocationUser');
    print(latitudeL);
    print(longtudeL);
    await _sharedPreferences.setString(prefKey.latitude.toString(), latitudeL);
    await _sharedPreferences.setString(prefKey.longtude.toString(), longtudeL);
  }

  String get latitude =>
      _sharedPreferences.getString(prefKey.latitude.toString()) ?? '';

  String get longtude =>
      _sharedPreferences.getString(prefKey.longtude.toString()) ?? '';

  // Future<void> setLocationMeeting({required String latitudeLMeet ,required String longtudeLMeet}) async {
  //   print('setLocationUser');
  //   print(latitudeLMeet);
  //   print(longtudeLMeet);
  //   await _sharedPreferences.setString(prefKey.latitude.toString(), latitudeLMeet);
  //   await _sharedPreferences.setString(prefKey.longtude.toString(), longtudeLMeet);
  // }
  // String get latitudeLMeet => _sharedPreferences.getString(prefKey.latitudeLMeet.toString()) ?? '' ;
  // String get longtudeLMeet => _sharedPreferences.getString(prefKey.longtudeLMeet.toString()) ?? '' ;

  Future<void> setName({required String name}) async {
    await _sharedPreferences.setString(prefKey.name.toString(), name);
  }

  String get name =>
      _sharedPreferences.getString(prefKey.name.toString()) ?? '';

  bool get loggedIn =>
      _sharedPreferences.getBool(prefKey.loggedIn.toString()) ?? false;

  Future<bool> clear() async {
    return await _sharedPreferences.clear();
  }
}
