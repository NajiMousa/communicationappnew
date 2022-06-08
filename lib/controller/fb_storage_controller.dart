import 'dart:io';

import 'package:communication/pref/shread_pref.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FbStorageController {
  FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  void uploadImage({required String path,}) {
    // UploadTask uploadTask =
    print('startUploadImage');
    print('images/' + SharedPrefController().phone);
    _firebaseStorage
        .ref('images/' + SharedPrefController().phone)
        .putFile(File(path));
    print(File(path));
    print('endUploadImage');}

  Future<String> readImage({required String name,}) async {
    final ref = _firebaseStorage
        .ref('images/')
        .child(name);
    var url = await ref.getDownloadURL();
    return url.toString();
  }

  // Future<List<Reference>> readImage() async {
  //   ListResult listResult = await _firebaseStorage
  //       .ref('images')
  //       .listAll(); // يعيد كل الصور اللي في ملف الايميج و يرجع مصفوفة
  //   if (listResult.items.isNotEmpty) {
  //     return listResult.items;
  //   }
  //   return [];
  // }

  // Future<bool> delete({required String path}) {
  //   return _firebaseStorage
  //       .ref(path)
  //       .delete()
  //       .then((value) => true)
  //       .catchError((error) => false);
  // }
}
