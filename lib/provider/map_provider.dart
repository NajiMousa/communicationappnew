import 'package:communication/controller/fb_store_controller.dart';
import 'package:communication/model/all_user_data_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapProvider extends ChangeNotifier{
  List<AllUserDataModel> listAllUserData = [];
  List<LatLng> listLatLng = [];

  Future<void> getData ()async{
    listAllUserData = await FbStoreController().getDataUser();
    for(int i=0;i<listAllUserData.length;i++){
      listLatLng.add(LatLng(double.parse(listAllUserData[i].latitude),double.parse(listAllUserData[i].longtude)));
    }
    notifyListeners();
  }
}