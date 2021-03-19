import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_end2end/shoes_store_module/controller/shoes_store_controller.dart';
import 'package:getx_end2end/shoes_store_module/model/shoes_model.dart';
import 'package:getx_end2end/shoes_store_module/view/ShoesStoreDetailPage.dart';
import 'package:getx_end2end/utils/app_colors.dart';
import 'package:vector_math/vector_math.dart' as vector;

class ShoesStoreView extends StatefulWidget {
  @override
  _ShoesStoreViewState createState() => _ShoesStoreViewState();
}

class _ShoesStoreViewState extends State<ShoesStoreView> {
  final shoesController = Get.put(ShoesController());

  final _pageController = PageController(viewportFraction: 0.80);

  final _pageNotifier = ValueNotifier(0.0);

  void _listener() {
    _pageNotifier.value = _pageController.page;
    setState(() {});
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _pageController.addListener(_listener);
    });
    super.initState();
  }

  @override
  void dispose() {
    _pageController.removeListener(_listener);
    _pageController.dispose();
    _pageNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const marginCenter = EdgeInsets.symmetric(horizontal: 50, vertical: 15);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text("Shoes Store"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(shoesController.marginSide),
              child: _buildHeader(),
            ),
            Expanded(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.0),
                      child: RotatedBox(
                        quarterTurns: 3,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildLeftItem('New', false),
                            shoesController.leftItemSeparator,
                            _buildLeftItem('Featured', true),
                            shoesController.leftItemSeparator,
                            _buildLeftItem('Upcoming', false),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    bottom: 0,
                    right: 0,
                    child: _buildBottom(context),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    top: -10,
                    height: size.height * 0.50,
                    child: PageView.builder(
                        controller: _pageController,
                        itemCount: shoesController.listofShoes.length,
                        itemBuilder: (context, index) {

                          final t = (index - _pageNotifier.value);
                          final rotationY = lerpDouble(0, 90, t);
                          final translationX = lerpDouble(0, -50, t);
                          final scale = lerpDouble(0, -0.2, t);
                          final translationXShoes = lerpDouble(0, 150, t);
                          final rotationShoe = lerpDouble(0, -45, t);

                          final transform = Matrix4.identity();
                          transform.translate(translationX);
                          transform.setEntry(3, 2, 0.001);
                          transform.scale(1 - scale);
                          transform.rotateY(vector.radians(rotationY));

                          final transformShoe = Matrix4.identity();
                          transformShoe.translate(translationXShoes);
                          transformShoe.rotateZ(vector.radians(rotationShoe));

                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 28.0,
                            ),
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).push(PageRouteBuilder(
                                  transitionDuration:
                                  const Duration(milliseconds: 800),
                                  pageBuilder: (_, animation, __) =>
                                      FadeTransition(
                                        opacity: animation,
                                        child: ShoesStoreDetailPage(
                                          shoe: shoesController.listofShoes[index],
                                        ),
                                      ),
                                ));

                              },
                              child: Stack(
                                overflow: Overflow.visible,
                                children: [
                                  Transform(
                                    alignment: Alignment.center,
                                    transform: transform,
                                    child: Stack(
                                      children: [
                                        Hero(
                                          tag:
                                              'hero_background_${shoesController.listofShoes[index].name}',
                                          child: Card(
                                            elevation: 6,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            margin: marginCenter,
                                            color: shoesController.listofShoes[index].color,
                                            child: const SizedBox.expand(),
                                          ),
                                        ),
                                        Container(
                                          margin: marginCenter,
                                          padding: const EdgeInsets.all(12.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    shoesController.listofShoes[index]
                                                        .name
                                                        .split(' ')
                                                        .join('\n'),
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                                  Icon(
                                                    Icons.favorite_border,
                                                    color: Colors.white,
                                                  )
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                "\$${shoesController.listofShoes[index].price}",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12,
                                                ),
                                              ),
                                              Spacer(),
                                              Align(
                                                alignment:
                                                    Alignment.bottomRight,
                                                child: Icon(
                                                  Icons.arrow_forward,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Center(
                                    child: Transform(
                                      alignment: Alignment.center,
                                      transform: transformShoe,
                                      child: Hero(
                                        tag: 'hero_image_${shoesController.listofShoes[index].name}',
                                        child: Image.asset(
                                          shoesController.listofShoes[index].image,
                                          height: size.width *0.5,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Discover',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 26,
                  color: Colors.black,
                ),
              ),
              Spacer(),
              CircleAvatar(
                backgroundColor: Colors.grey[200],
                child: IconButton(
                  icon: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  onPressed: () {},
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              CircleAvatar(
                backgroundColor: Colors.grey[200],
                child: IconButton(
                  icon: Icon(
                    Icons.notifications_none,
                    color: Colors.black,
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 40,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: shoesController.brands.length,
              itemBuilder: (_, index) => Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
                child: Text(
                  shoesController.brands[index],
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: index == 0 ? Colors.black : Colors.grey[400],
                    fontSize: 17,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLeftItem(String title, bool selected) => Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w700,
          color: selected ? Colors.black : Colors.grey[400],
          fontSize: 14,
        ),
      );

  Widget _buildBottom(BuildContext context) {
    Widget _buildBottomItem(ShoesModel shoesModel) => Card(
          elevation: 4,
          child: Stack(
            children: [
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.only(top: 5.0, right: 8),
                        child: Icon(Icons.favorite_border),
                      ),
                    ),
                    Expanded(
                      child: Transform.rotate(
                          angle: vector.radians(20),
                          child: Image.asset(shoesModel.image)),
                    ),
                    Text(
                      shoesModel.name,
                      style: TextStyle(fontSize: 12),
                    ),
                    Text(
                      "\$${shoesModel.price}",
                      style: TextStyle(fontSize: 11),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                  ],
                ),
              ),
              RotatedBox(
                quarterTurns: 3,
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18.0, vertical: 4),
                    child: Text(
                      'NEW',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  color: Colors.pinkAccent,
                ),
              ),
            ],
          ),
        );

    return Container(
      color: shoesController.bottomBackgroundColor,
      height: MediaQuery.of(context).size.height * 0.29,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'More',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 19,
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.arrow_forward,
                    color: Colors.black,
                  ),
                  onPressed: null,
                ),
              ],
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: _buildBottomItem(shoesController.shoesBottom.first),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: _buildBottomItem(shoesController.shoesBottom.last),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
