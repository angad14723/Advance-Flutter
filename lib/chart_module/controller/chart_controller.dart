import 'dart:convert';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:get/get.dart';
import 'package:getx_end2end/chart_module/model/chart_model.dart';

class ChartController extends GetxController {


  var chartModel = ChartModel().obs;

  var isLoading=true.obs;

  List<FlSpot> flSpots = const [];

  double mMinX = 0;
  double mMaxX = 0;
  double mMinY = 0;
  double mMaxY = 0;
  double leftTitlesInterval = 0;

  final int divider = 2;
  final int leftLabelsCount = 6;



  @override
  void onInit() {
    super.onInit();

    getChartFromLocal();
  }

  void getChartFromLocal() async {
    double minY = double.maxFinite;
    double maxY = double.minPositive;

    var localJson = await rootBundle.loadString("assets/chart_data.json");
    final jsonResult = json.decode(localJson.toString());
    chartModel.value = ChartModel.fromJson(jsonResult);

    print(chartModel.value.data[0].value);


    flSpots = chartModel.value.data.map((data) {
      if (minY > double.parse(data.value)) minY = double.parse(data.value);
      if (maxY < double.parse(data.value)) maxY = double.parse(data.value);
      return FlSpot(
        double.parse(data.xVal),
        double.parse(data.value),
      );
    }).toList();

    mMinX = flSpots.first.x ;
    mMaxX = flSpots.last.x ;
    mMinY = (minY / divider).floorToDouble() * divider;
    mMaxY = (maxY / divider).ceilToDouble() * divider;
    leftTitlesInterval =
        ((maxY - minY) / (leftLabelsCount - 1)).floorToDouble();

    isLoading(false);

  }
}
