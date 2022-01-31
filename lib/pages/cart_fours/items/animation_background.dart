import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../../model.dart';
import '../../../states/app_state.dart';
import '../../../states/cart_page_state.dart';
import '../../../functions.dart';
import '../../../data.dart';

class AnimationBackground extends StatefulWidget {
  final CartPageState state;
  final AppState appState;
  const AnimationBackground({
    Key? key,
    required this.state,
    required this.appState,
  }) : super(key: key);
  @override
  _AnimationBackgroundState createState() => _AnimationBackgroundState();
}

class _AnimationBackgroundState extends State<AnimationBackground> {
  late Animation<double> heightAnim;
  @override
  void initState() {
    super.initState();
    heightAnim = Tween<double>(begin: doubleHeight(10), end: doubleHeight(100))
        .animate(widget.state.controller);
  }

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
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50)),
            color: purple,
          ),
          // child:  MainLayout(
          //   appState: widget.appState,
          //   state: widget.state,
          // ),
          height: heightAnim.value,
          width: double.maxFinite,
        ),
      ),
      tween: Tween<Offset>(
          begin: widget.state.startOffset, end: widget.state.endOffset), //
      duration: mil500,
      onEnd: () {
        if (widget.state.doController) {
          widget.state.controller.forward().then((value) =>
              widget.state.controller.animateTo(0.8, duration: mil200));
        } else {
          widget.appState.changePageNoAnimation(PageName.delivery,backgroundColorMain: crem);
        }
      },
    );
  }
}
