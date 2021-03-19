import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_end2end/chart_module/controller/chart_controller.dart';
import 'package:getx_end2end/chart_module/model/chart_model.dart';
import 'package:getx_end2end/utils/app_colors.dart';

class ChartView extends StatelessWidget {
  final controller = Get.put(ChartController());

  double minY = double.maxFinite;
  double maxY = double.minPositive;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: Get.width,
                  height: Get.height * 0.5,
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: GetX<ChartController>(
                    builder: (controller) {
                      print(controller.chartModel.value.status);

                      print("object1 ${controller.mMinY}");
                      print("object2 ${controller.mMaxY}");
                      print("object3 ${controller.mMinX}");
                      print("object4 ${controller.mMaxX}");

                      if (controller.isLoading.isTrue) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return Padding(
                        padding: EdgeInsets.all(10),
                        child: LineChart(
                            //isShowingMainData ? sampleData1() : sampleData1(),
                            LineChartData(
                              extraLinesData: ExtraLinesData(
                               extraLinesOnTop: true
                              ),

                          gridData: FlGridData(
                            show: false,
                          ),
                          titlesData: FlTitlesData(
                            bottomTitles: SideTitles(
                              showTitles: true,
                              getTextStyles: (value) => const TextStyle(
                                color: Color(0xff72719b),
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                              margin: 10,
                              getTitles: (value) {
                                print("getTitles  $value");
                                return value.toString();
                              },
                            ),
                            leftTitles: SideTitles(
                              showTitles: true,
                              getTextStyles: (value) => const TextStyle(
                                color: Color(0xff75729e),
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                              getTitles: (value) {
                               return value.toString();
                              },
                              margin: 10,
                            ),
                          ),
                          borderData: FlBorderData(
                              show: true,
                              border: const Border(
                                bottom: BorderSide(
                                  color: Color(0xff4e4965),
                                  width: 4,
                                ),
                                left: BorderSide(
                                  color: Colors.transparent,
                                ),
                                right: BorderSide(
                                  color: Colors.transparent,
                                ),
                                top: BorderSide(
                                  color: Colors.transparent,
                                ),
                              )),
                          minX: controller.mMinX,
                          maxX: controller.mMaxX,
                          maxY: controller.mMaxY,
                          minY: controller.mMinY,

                          lineBarsData:
                              linesBarData2(),
                        ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  List<LineChartBarData> linesBarData2() {
    return [
      LineChartBarData(
        spots: controller.flSpots,
        isCurved: false,
        colors: const [
          Color(0x99aa4cfc),
        ],
        barWidth: 3,
        isStrokeCapRound: true,
        dotData: FlDotData(
          show: true,
        ),
        belowBarData: BarAreaData(show: true, colors: [
          const Color(0x33aa4cfc),
        ]),

      ),
    ];
  }
}
