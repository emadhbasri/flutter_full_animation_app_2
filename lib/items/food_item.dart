import 'package:flutter/material.dart';

import '../data.dart';
import '../functions.dart';
import '../model.dart';

class FoodItem extends StatelessWidget {
  final Food food;
  final Animation<double> animation;
  const FoodItem({Key? key, required this.food, required this.animation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var defaultCurv = CurvedAnimation(parent: animation, curve: const Interval(0.3,1,curve: sbs1));

    return Container(
      padding: EdgeInsets.symmetric(horizontal: doubleWidth(5)),
      width: double.maxFinite,
      height: doubleHeight(8),
      child: Row(
        children: <Widget>[
          Expanded(
              flex: 3,
              child: Row(
                children: [
                  ScaleTransition(
                    scale: Tween<double>(begin: 0, end: 1).animate(defaultCurv),
                    child: Container(
                      width: doubleHeight(5),
                      height: doubleHeight(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: AssetImage(food
                                  .image), //assets/images/foodApp1/PageFirst1.jpg
                              fit: BoxFit.fill)),
                    ),
                  ),
                  SizedBox(
                    width: doubleWidth(3),
                  ),
                  SizedBox(
                    width: doubleWidth(50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ScaleTransition(
                          scale: Tween<double>(begin: 0, end: 1)
                              .animate(defaultCurv),
                          child: Text(food.name,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: doubleWidth(3.5))),
                        ),
                        FadeTransition(
                          opacity: Tween<double>(begin: 0, end: 1).animate(
                              CurvedAnimation(
                                  parent: animation,
                                  curve: const Interval(0.5, 1,curve: sbs1))),
                          child: Text(food.resepi,
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: doubleWidth(3))),
                        ),
                      ],
                    ),
                  )
                ],
              )),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizeTransition(
                axis: Axis.horizontal,
                axisAlignment: -1,
                sizeFactor:
                    Tween<double>(begin: 0, end: 1).animate(defaultCurv),
                child: Text('\$${food.price}',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: doubleWidth(4))),
              ),
              SizeTransition(
                axis: Axis.horizontal,
                axisAlignment: -1,
                sizeFactor:
                    Tween<double>(begin: 0, end: 1).animate(defaultCurv),
                child: Text('Add to cart',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        color: Colors.pink,
                        fontWeight: FontWeight.bold,
                        fontSize: doubleWidth(3.5))),
              )
            ],
          )),
        ],
      ),
    );
  }
}
