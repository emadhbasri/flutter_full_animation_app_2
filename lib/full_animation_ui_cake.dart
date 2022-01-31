import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'states/app_state.dart';
import 'functions.dart';
import 'data.dart';
import 'items/bootom_nav.dart';
import 'items/transition_clip.dart';
import 'model.dart';
import 'pages/the_food_therd/food_page.dart';
import 'pages/select_store_first/shops_page.dart';

import 'pages/cart_fours/cart_page.dart';
import 'pages/delivery_fifs/delivery.dart';
import 'pages/select_food_second/shop_page.dart';

import 'dart:math' as math;

class FullAnimationUiCake extends StatefulWidget {
  const FullAnimationUiCake({Key? key}) : super(key: key);

  @override
  _FullAnimationUiCakeState createState() => _FullAnimationUiCakeState();
}

class _FullAnimationUiCakeState extends State<FullAnimationUiCake>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  late Animation<double> animation1;
  late Animation<double> animation2;
  PageName? currentPage;
  bool done = false;

  late Animation<Offset> _animationAlign;
  late Animation<double> _animationSize;
  late AnimationController _controller;
  late AnimationController _controller1;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, value: 0, duration: sec1, reverseDuration: sec1);
    animation = Tween<double>(begin: 0, end: 60).animate(
        CurvedAnimation(parent: _controller, curve: const Interval(0, 0.1)));
    animation1 = Tween<double>(begin: 1.0, end: 0.9).animate(
        CurvedAnimation(parent: _controller, curve: const Interval(0, 0.1)));

    animation2 = Tween<double>(begin: 0.9, end: 0.1).animate(
        CurvedAnimation(parent: _controller, curve: const Interval(0.1, 1.0)));

    _controller1 = AnimationController(
        vsync: this, duration: const Duration(seconds: 1), value: 0);
    _animationSize = Tween<double>(begin: 0.1, end: 1).animate(
        CurvedAnimation(parent: _controller1, curve: const Interval(0.3, 1.0)));

    _animationAlign =
        Tween<Offset>(begin: Offset(screenSize.width, 0), end: Offset.zero)
            .animate(CurvedAnimation(
            parent: _controller1, curve: const Interval(0.0, 0.3)));
  }

  changePage1() async {
    _controller.animateTo(1.0, duration: mil700, curve: Curves.easeOutSine);
  }

  changePage2() async {
    _controller.animateTo(0.0, duration: mil700);
  }

  @override
  Widget build(BuildContext context) {
    

    return ListenableProvider<AppState>(
      create: (context) => AppState(),
      child: Consumer<AppState>(
      builder: (context, state, child) => Scaffold(
        backgroundColor: state.backgroundColorMain,
body: Stack(
  children: [
    Builder(
      builder: (context) {
        // value.func1=changePage1();
        // value.func2=changePage2();
        // value.con
        state.controller = _controller;
        return const Align(
          alignment: Alignment.bottomLeft,
          child: BottomNav(),
        );
      },
    ),
    Align(
      alignment: Alignment.center,
      child: AnimatedBuilder(
        animation: animation,
        child: Builder(
          builder: (context) {
            Widget now;
            switch (state.page) {
              case PageName.shops:
                now = const ShopsPage();
                break;
              case PageName.shop:
                now = const ShopPageBuilder();
                break;
              case PageName.food:
                now = const FoodPage();
                break;
              case PageName.cart:
                now = CartPageBuilder(state: state,);
                break;
              case PageName.delivery:
                now = const Delivery();
                break;
              default:
                now = const SizedBox();
                break;
            }
            return AnimatedSwitcher(
              child: now,
              duration: sec1,
              transitionBuilder: (child, animation) => FadeTransition(
                opacity:
                animation.drive(Tween<double>(begin: 0, end: 1)),
                child: child,
              ),
            );
            // return AnimatedCrossFade(
            //     firstChild: value.firstChild,
            //     secondChild: value.secondChild,
            //     crossFadeState: value.crossFadeState,
            //     duration: mil200);
          },
        ),
        builder: (context, child) => ClipPath(
          clipper: TransitionClip(
              radius: animation.value,
              heightSize: _controller.value <= 0.1
                  ? animation1.value
                  : animation2.value),
          child: child,
        ),
      ),
    ),
    Align(
      alignment: Alignment.bottomLeft,
      child: SizedBox(
        width: double.maxFinite,
        height: doubleHeight(10),
        child: GestureDetectorVertical(
          onDown: () {
            state.end = doubleHeight(5);
            state.begin = doubleHeight(12);
            state.notify();
            debugPrint('down');
            _controller.animateTo(0.0, duration: mil300);
          },
          onTop: () {
            state.begin = doubleHeight(5);
            state.end = doubleHeight(12);
            state.notify();
            _controller.animateTo(0.1, duration: mil300);
            debugPrint('top');
          },
        ),
      ),
    ),

    AnimatedBuilder(
      animation: _animationSize,
      builder: (context, child) => Transform.translate(
        offset: _animationAlign.value,
        child: ClipRect(
          child: Align(
            alignment: const AlignmentDirectional(-1.0, 1),
            heightFactor: math.max(_animationSize.value, 0.0),
            child: Container(
              width: doubleWidth(100),
              height: doubleHeight(100),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                  color: Colors.yellow),
            ),
          ),
        ),
      ),
    ),
    //       if(done){
    //         _controller.forward().then((value) => _controller.reverse());
    //       }else{
    //         _controller.forward().then((value) => _controller.animateBack(0.9));
    //       }
  ],
),
      ),
      ),
    );

  }
}
