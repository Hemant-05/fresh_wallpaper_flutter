import 'dart:async';

import 'package:fresh_wallpaper/model/photos_model.dart';
import 'package:fresh_wallpaper/service/api_service.dart';
import 'package:get/get.dart';
class SimpleUIController extends GetxController{
  String url = "https://api.unsplash.com/photos/?per_page=30&order_by=populer&client_id=G8HoKJF0m0ecx2XoRZWb2M31CKCIbLcyEt-V-Mcl308";
  var selectedIndex = 0.obs;
  RxList<PhotoModel> photos = RxList();

  List<String> orders = [
    "oldest",
    "latest",
    "popular",
    "views",
    "downloads"
  ];

  getPhotos() async { // here are some problem i need to find them
    var response = APIService().getMethod(url);
    if(response.statusCode == 200){
      var data = response.fromEach.data((elem){

      });
    }
  }

  @override
  void onInit() {
    getPhotos();
    super.onInit();
  }
}