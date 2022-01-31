import 'package:flutter/material.dart';
import '../../../functions.dart';
import '../../../data.dart';

class TitleMain extends StatelessWidget {
  const TitleMain({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: doubleWidth(15), end: doubleWidth(5)),
      duration: sec1,
      builder: (context, double value, child) => Padding(
        padding: EdgeInsets.only(left: value),
        child: child,
      ),
      child: RichText(
          text:
              TextSpan(style: const TextStyle(color: Colors.black), children: [
        TextSpan(
            text: 'Hi, ',
            style: TextStyle(
              fontSize: doubleWidth(7.5),
            )),
        TextSpan(
            text: 'Emad!',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: doubleWidth(8),
            ))
      ])),
    );
  }
}
