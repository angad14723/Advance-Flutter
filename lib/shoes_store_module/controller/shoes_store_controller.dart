import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_end2end/shoes_store_module/model/shoes_model.dart';

class ShoesController extends GetxController {
  var bottomBackgroundColor = Color(0xFFF1F2F7);
  var brands = ['Nike', 'Adidas', 'Jordan', 'Puma', 'Reebok'];
  var  marginSide = 14.0;
  var leftItemSeparator = const SizedBox(
    width: 30,
  );

  var listofShoes = [
    const ShoesModel(
        name: 'NIKE EPICT-REACT',
        price: 130.00,
        image: 'images/shoes/1.png',
        color: Color(0xFF5574b9)),
    const ShoesModel(
        name: 'NIKE AIR-MAX',
        price: 130.00,
        image: 'images/shoes/2.png',
        color: Color(0xFF52b8c3)),
    const ShoesModel(
        name: 'NIKE AIR-270',
        price: 150.00,
        image: 'images/shoes/3.png',
        color: Color(0xFFE3AD9B)),
    const ShoesModel(
        name: 'NIKE EPICT-REACTII',
        price: 160.00,
        image: 'images/shoes/4.png',
        color: Color(0xFF444547)),
  ];

  var shoesBottom = [
    const ShoesModel(
        name: 'NIKE AIR-MAX', price: 170.00, image: 'images/shoes/3.png'),
    const ShoesModel(
        name: 'NIKE AIR FORCE', price: 130.00, image: 'images/shoes/4.png'),
  ];
}
