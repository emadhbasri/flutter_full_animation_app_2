import 'package:flutter/material.dart';

import 'model.dart';

Color purple = Colors.purple[800]!;
Color crem = const Color.fromRGBO(247, 218, 204, 1);
const Duration sec1 = Duration(seconds: 1);
const Duration mil900 = Duration(milliseconds: 900);
const Duration mil800 = Duration(milliseconds: 800);
const Duration mil700 = Duration(milliseconds: 700);
const Duration mil600 = Duration(milliseconds: 600);
const Duration mil500 = Duration(milliseconds: 500);
const Duration mil400 = Duration(milliseconds: 400);
const Duration mil300 = Duration(milliseconds: 300);
const Duration mil200 = Duration(milliseconds: 200);
const Duration mil100 = Duration(milliseconds: 100);
const Cubic sbs= Cubic(0.21,0.49,0.6,1.68);
const Cubic sbs1= Cubic(0.21,0.49,0.59,1.37);


List<Shop> allShops = [
  Shop(1,'assets/images/shop1.png', 'Brindle Room',
      CategoryType.desert,'fast-food', '15-20 min', '2.5 km', false, 4.2),
  Shop(2,'assets/images/shop2.jpg', 'Cupcake Delivery',
      CategoryType.desert,'fast-food', '15-20 min', '2.5 km', false, 3.8),
  Shop(3,'assets/images/shop3.png', 'New York Count Co.',
      CategoryType.desert,'fast-food', '15-20 min', '2.5 km', false, 4.0),
  Shop(4,'assets/images/shop4.png', 'Brindle Room',
      CategoryType.pizza,'fast-food', '15-20 min', '2.5 km', false, 4.2),
  Shop(5,'assets/images/shop1.png', 'Cupcake Delivery',
      CategoryType.pizza,'fast-food', '15-20 min', '2.5 km', false, 3.8),
  Shop(6,'assets/images/shop2.jpg', 'New York Count Co.',
      CategoryType.pizza,'fast-food', '15-20 min', '2.5 km', false, 4.0),
  Shop(7,'assets/images/shop3.png', 'Brindle Room',
      CategoryType.burgers,'fast-food', '15-20 min', '2.5 km', false, 4.2),
  Shop(8,'assets/images/shop4.png', 'Cupcake Delivery',
      CategoryType.burgers,'fast-food', '15-20 min', '2.5 km', false, 3.8),
  Shop(9,'assets/images/shop1.png', 'New York Count Co.',
      CategoryType.burgers,'fast-food', '15-20 min', '2.5 km', false, 4.0)
];

List<Food> listAllFoods=[
  ...donuts(),
  ...iceCreams(),
];

List<Food> donuts(){
  List<String> names=[
    'Pomegranate',
    'Chocolate',
    'Strawberry',
    'Cherries',
    'blueberry',
    'Coffee',
    'Peach',
  ];
  List<Food> listDonuts=[];
  for(int j=1;j<=7;j++){
    listDonuts.add(
        Food(
            id: j,
            image: 'assets/images/donut$j.png',
            name: '${names[j-1]} Donut',
            category: 'Donuts',
            price: 12.95,
            resepi: 'blueberry + sugar + flawour + some ingridients...',
            desc: 'Naturally & Artificially Flavored\n'
                'Does not contain real Raspberry',
            desc1: 'Sed ut perspiciatis unde omnis iste natus error sit\n'
                'valuptatem accusantium doloremque laudantium',
            calories: '567 ccal',
            peope: 1,
            weight: '400g')
    );
  }
  return listDonuts;
}
List<Food> iceCreams(){
  List<String> names=[
    'icepack',
    '3 scope ice-cream',
    'blueberry ice-cream',
    'double ice-cream',
    'Chocolate ice-cream',
    'Watermelon ice-cream',
    'Strawberry ice-cream',
  ];
  List<Food> listIceCreams=[];
  for(int j=1,k=8;j<=7;j++,k++){
    listIceCreams.add(
        Food(
            id: k,
            image: 'assets/images/ice-cream$j.png',
            name: names[j-1],
            category: 'Ice Creams',
            price: 12.95,
            resepi: 'blueberry + sugar + flawour + some ingridients...',
            desc: 'Naturally & Artificially Flavored\n'
                'Does not contain real Raspberry',
            desc1: 'Sed ut perspiciatis unde omnis iste natus error sit\n'
                'valuptatem accusantium doloremque laudantium',
            calories: '567 ccal',
            peope: 1,
            weight: '400g')
    );
  }
  return listIceCreams;
}



