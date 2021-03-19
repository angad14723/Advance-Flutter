import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_end2end/movies_module/controller/movies_controller.dart';
import 'package:getx_end2end/utils/app_colors.dart';

class MoviesView extends StatelessWidget {

  final controller = Get.put(MoviesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies"),
        backgroundColor: AppColors.primaryColor,
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10),
          child: GetX<MoviesController>(
            builder: (controller) {
              if (controller.moviesList.isEmpty) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 5,
                  children:
                      List.generate(controller.moviesList.length, (index) {
                    return Container(
                      margin: EdgeInsets.all(5),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 2.0,
                              spreadRadius: 0.0,
                              offset: Offset(
                                  2.0, 2.0), // shadow direction: bottom right
                            )
                          ]),
                      child: Column(
                        children: [
                          Container(
                            child: Expanded(
                              child: Image.network(
                                controller.moviesList[index].info.imageUrl ==
                                        null
                                    ? controller.defaultImage
                                    : controller
                                        .moviesList[index].info.imageUrl,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            controller.moviesList[index].title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          )
                        ],
                      ),
                    );
                  }),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
