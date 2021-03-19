
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:getx_end2end/animations/transform_view.dart';
import 'package:getx_end2end/barcode_scanner_module/barcode_scanner_view.dart';
import 'package:getx_end2end/shoes_store_module/view/ShoesStoreView.dart';

import 'auth_login_module/auth_login_view.dart';
import 'chart_module/view/chart_view.dart';
import 'home_page_view.dart';
import 'ml_module/text_recognition_view.dart';
import 'movies_module/view/movies_view.dart';

class Routes{

  static final route = [
    GetPage(
      name: '/homePageView',
      page: () => HomePageView(),
    ),
    GetPage(
      name: '/moviesView',
      page: () => MoviesView(),
    ),
    GetPage(
      name: '/shoesStoreView',
      page: () => ShoesStoreView(),
    ),
    GetPage(
      name: '/transformView',
      page: () => TransFormExample(),
    ),
    GetPage(
      name: '/chart_view',
      page: () => ChartView(),
    ),
    GetPage(
      name: '/auth_login_view',
      page: () => AuthLoginView(),
    ),
    GetPage(
      name: '/barcode_scanner_view',
      page: () => BarCodeScannerView(),
    ),GetPage(
      name: '/text_recognition_view',
      page: () => TextRecognitionView(),
    ),
  ];

}