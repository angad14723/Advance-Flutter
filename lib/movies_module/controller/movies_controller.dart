import 'dart:convert';

import 'package:get/get.dart';
import 'package:getx_end2end/movies_module/model/movies_model.dart';
import 'package:getx_end2end/network_services/api_urls.dart';
import 'package:getx_end2end/network_services/requests.dart';

class MoviesController extends GetxController {

  var moviesList = <MoviesModel>[].obs;
  String defaultImage="https://cdn.vox-cdn.com/thumbor/BmvVMEzNQQ4rfIQXput2yOriDRc=/0x0:5568x3712/1820x1213/filters:focal(2858x720:3748x1610):format(webp)/cdn.vox-cdn.com/uploads/chorus_image/image/62207705/922984782.jpg.0.jpg";

  @override
  void onInit() {
    fetchMoviesList();
    super.onInit();
  }

  void fetchMoviesList() async {
    NetworkRequest networkRequest = NetworkRequest(url: moviesListUrl);

    networkRequest.get().then((value) {
      List list = json.decode(value.body);
      moviesList.addAll(list.map((e) => MoviesModel.fromJson(e)).toList());
    }).catchError((onError) {
      print(onError);
    });
  }
}
