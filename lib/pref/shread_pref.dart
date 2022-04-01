
import 'package:shared_preferences/shared_preferences.dart';

enum prefKey {
  loggedIn , phone , langnge , typeUser
}
class SharedPrefController{

  //Singleton Design Pattern

  static final  SharedPrefController _instance = SharedPrefController._internal();

  late SharedPreferences _sharedPreferences ;

  SharedPrefController._internal();

  factory SharedPrefController (){
    return _instance ;
  }

  Future<void> initSharedPref() async{
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> saveData({required String phone,required String typeUser }) async{
    print('Pref save Data');
    await _sharedPreferences.setBool(prefKey.loggedIn.toString(), true);
    print('Yes');
    print(prefKey.loggedIn.toString());
    await _sharedPreferences.setString(prefKey.phone.toString(), phone);
    await _sharedPreferences.setString(prefKey.typeUser.toString(), typeUser);
  }

  Future<void> setLanguage() async {
    await _sharedPreferences.setString(prefKey.langnge.toString(), language== 'en'? 'ar': 'en');
  }

  bool get loggedIn => _sharedPreferences.getBool(prefKey.loggedIn.toString()) ?? false ;

  String get phone => _sharedPreferences.getString(prefKey.phone.toString()) ?? 'noPhone' ;

  String get typeUser => _sharedPreferences.getString(prefKey.typeUser.toString()) ?? 'user' ;

  Future<bool> clear()async{
    return await _sharedPreferences.clear();
  }

  String get language => _sharedPreferences.getString(prefKey.langnge.toString()) ?? 'en';
}
