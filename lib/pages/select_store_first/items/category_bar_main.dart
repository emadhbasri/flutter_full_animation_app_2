import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../../functions.dart';
import '../../../items/category_bar.dart';
import '../../../data.dart';

class CategoryBarMain extends StatelessWidget {
  const CategoryBarMain(
      {Key? key,
      required this.addList,
      required this.changeIt,
      required this.changeItChanger,
      required this.endOffsetBack,
      required this.endOffset,
      required this.startOffsetBack,
      required this.startOffset})
      : super(key: key);
  final bool changeIt;
  final Offset endOffsetBack;
  final Offset endOffset;
  final Offset startOffsetBack;
  final Offset startOffset;
  final Function() addList;
  final Function(bool) changeItChanger;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: doubleWidth(100),
      height: doubleHeight(14),
      child: Stack(
        children: [
          TweenAnimationBuilder(
            duration: mil700,
            tween: Tween<Offset>(begin: startOffsetBack, end: endOffsetBack),
            builder: (context, Offset value, child) => Transform.translate(
              offset: value,
              child: child,
            ),
            child: Align(
              alignment: Alignment.centerRight,
              child: Container(
                width: doubleWidth(95),
                height: doubleHeight(14),
                decoration: BoxDecoration(
                    color: purple,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(100),
                      topLeft: Radius.circular(100),
                    )),
              ),
            ),
          ),
          !changeIt
              ? TweenAnimationBuilder(
                  duration: mil700,
                  curve: Curves.easeIn,
                  tween: Tween<Offset>(begin: startOffset, end: endOffset),
                  builder: (context, Offset value, child) =>
                      Transform.translate(
                    offset: value,
                    child: child,
                  ),
                  child: const CategoryBar(isTemp: true),
                  onEnd: () {
                    if (endOffset != Offset(doubleWidth(100), 0)) {
                      changeItChanger(true);
                      addList();
                    }
                  },
                )
              : CategoryBar(
                  doIt: () => addList(),
                  isTemp: false,
                ),
        ],
      ),
    );
  }
}
