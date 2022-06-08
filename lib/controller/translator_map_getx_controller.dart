// import 'package:communication/controller/fb_storage_controller.dart';
// import 'package:communication/model/all_user_data_model.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_state_manager/src/simple/get_controllers.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
//
// import '../pref/shread_pref.dart';
// import 'fb_store_controller.dart';
//
// class TranslatorMapGetxController extends GetxController {
//   static TranslatorMapGetxController get to => Get.find<TranslatorMapGetxController>();
//   List<AllUserDataModel> allUserData = [];
//   List <LatLng>usersMap = [];
//
//   @override
//   void onInit() {
//     // TODO: implement onInit
//     addUser();
//     // image.value = FbStorageController().;
//     super.onInit();
//   }
//
//   void addUser() async{
//     allUserData = await FbStoreController().getDataUser();
//     for(int i = 0 ; i < allUserData.length ; i++){
//       usersMap.add(LatLng(double.parse(allUserData[i].latitude),double.parse(allUserData[i].latitude)));
//     }
//   }
//
//   // void addUser(AllUserDataModel allUserDataModel) {
//   //   if (_usersMap.containsKey(allUserDataModel)) {
//   //     _usersMap[allUserDataModel] += 1;
//   //   } else {
//   //     _usersMap[allUserDataModel] = 1;
//   //   }
//   //
//   //   print("You have added the ${allUserDataModel.fullName} to the list");
//   //
//   //   Get.snackbar(
//   //       "user Added", "You have added the ${allUserDataModel.fullName} to the list",
//   //       snackPosition: SnackPosition.BOTTOM,
//   //       duration: const Duration(seconds: 3));
//   // }
//
//   // void removeUser(AllUserDataModel allUserDataModel) {
//   //   if (_usersMap.containsKey(allUserDataModel) && _usersMap[allUserDataModel] == 1) {
//   //     _usersMap.removeWhere((key, value) => key == allUserDataModel);
//   //   } else {
//   //     _usersMap[allUserDataModel] -= 1;
//   //   }
//   // }
//
//   get users => usersMap;
//   // void changeImage() {
//   //   image.value = language.value == 'en' ? 'ar' : 'en';
//   //   SharedPrefController().setLanguage();
//   // }
// }