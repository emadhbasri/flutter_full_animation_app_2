import 'package:flutter/material.dart';
import '../../model.dart';
import '../../states/app_state.dart';
import '../../../functions.dart';
import '../../../data.dart';

class AnimationBackground extends StatefulWidget {
  final AppState state;
  final AnimationController controller;
  const AnimationBackground({
    Key? key,
    required this.state,
    required this.controller,
  }) : super(key: key);
  @override
  _AnimationBackgroundState createState() => _AnimationBackgroundState();
}

class _AnimationBackgroundState extends State<AnimationBackground> {
  late Animation<double> heightAnim;
  @override
  void initState() {
    super.initState();
    heightAnim = Tween<double>(begin: doubleHeight(10), end: doubleHeight(120))
        .animate(widget.controller);
  }

  Offset startOffset = Offset(doubleWidth(90), 0);
  Offset endOffset = Offset.zero;
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      builder: (context, Offset value, child) => Transform.translate(
        offset: value,
        child: child,
      ),
      child: AnimatedBuilder(
        animation: heightAnim,
        builder: (context, child) => Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                // topLeft: Radius.circular(30),
                // topRight: Radius.circular(30),
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50)),
            color: Colors.white,
          ),
          height: heightAnim.value,
          width: double.maxFinite,
        ),
      ),
      tween: Tween<Offset>(begin: startOffset, end: endOffset), //
      duration: mil200,
      onEnd: () {
        debugPrint('onEnd');
        widget.controller.forward().then((value) {
          debugPrint('end all');
          widget.state.changePageNoAnimation(PageName.shops,
              backgroundColorMain: Colors.white);
        });
      },
    );
  }
}
