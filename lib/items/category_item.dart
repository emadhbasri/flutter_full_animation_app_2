import 'package:flutter/material.dart';
import '../functions.dart';

class CategoryItem extends StatelessWidget {
  final AlignmentTween? tween;
  final Interval? interval;
  final AnimationController? controller;
  final String name;
  final String image;
  final bool selected;
  final Function? doIt;
  ///temp
  final Alignment? alignment;


  const CategoryItem(
      {Key? key,
        this.tween,
        this.interval,
        this.controller,
        required this.name,
        required this.image,
        required this.selected,
        this.doIt, this.alignment})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    Widget child = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: doubleHeight(7),
          width: doubleHeight(7),
          decoration: BoxDecoration(
              color: selected
                  ? Colors.white
                  : const Color.fromRGBO(247, 225, 212, 1),
              borderRadius: BorderRadius.circular(100)),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Image.asset(
              image,
              color: Colors.black,
            ),
          ),
        ),
        SizedBox(
          height: doubleHeight(1),
        ),
        Text(
          name,
          style: TextStyle(fontWeight: selected ? FontWeight.bold : null),
        )
      ],
    );
    if(alignment==null) {
      return AlignTransition(
        alignment:
        tween!.animate(CurvedAnimation(curve: interval!, parent: controller!)),
        child: GestureDetector(
          onTap: () => doIt!(),
          child: child,
        ),
      );
    } else {
      return Align(
        alignment: alignment!,
        child: child,
      );
    }
  }
}