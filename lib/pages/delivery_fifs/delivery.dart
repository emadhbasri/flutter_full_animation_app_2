import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../states/app_state.dart';
import 'package:provider/provider.dart';
import '../../functions.dart';

import '../../data.dart';
import 'animation_background.dart';

class Delivery extends StatefulWidget {
  const Delivery({Key? key}) : super(key: key);

  @override
  _DeliveryState createState() => _DeliveryState();
}

class _DeliveryState extends State<Delivery>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _controllerBackGround;
  @override
  void initState() {
    _controller = AnimationController(vsync: this, value: 0, duration: mil700)
      ..forward().then((value) => Future.delayed(mil700,(){
        _controller.reverse().then((value) => setState((){
          animateBackground=true;
        }));
      }));
    _controllerBackGround =
        AnimationController(vsync: this, duration: mil500, value: 0);

    super.initState();
  }
  bool animateBackground=false;
  @override
  Widget build(BuildContext context) {
    AppState state = Provider.of<AppState>(context, listen: false);

    return Scaffold(
      backgroundColor: const Color.fromRGBO(247, 218, 204, 1),
      body: SizedBox.expand(
        child: Stack(
          children: [
            AlignTransition(
                alignment:Tween(begin: const Alignment(-0.3, -0.3), end: const Alignment(0, -0.3))
                    .animate(CurvedAnimation(
                    parent: _controller,
                    curve: const Cubic(.27,1.95,.29,.62))),
                child: FadeTransition(
                  opacity: Tween<double>(begin: 0, end: 1).animate(
                      CurvedAnimation(
                          parent: _controller,
                          curve: const Interval(0, 0.8))),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        CupertinoIcons.car_detailed,
                        size: doubleHeight(10),
                      ),
                      Text('Delivery',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: doubleHeight(5))),
                      Text('App',
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: doubleHeight(5)))
                    ],
                  ),
                )),
            AlignTransition(
                alignment:
                    Tween(begin: const Alignment(20, 0.5), end: const Alignment(1, 0.5))
                        .animate(CurvedAnimation(
                            parent: _controller,
                            curve: const Interval(0, 0.8))),
                child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          topLeft: Radius.circular(30),
                        )),
                    width: doubleWidth(90),
                    child: FadeTransition(
                      opacity: Tween<double>(begin: 0, end: 1).animate(
                          CurvedAnimation(
                              parent: _controller,
                              curve: const Interval(0, 0.8))),
                      child: SlideTransition(
                        position: Tween<Offset>(
                          begin: const Offset(0.5, 0),
                          end: Offset.zero,
                        ).animate(_controller),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: doubleHeight(3)).copyWith(left: doubleWidth(6)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text('Your favorite restaurant',
                                  style: TextStyle(
                                      color: purple,
                                      fontWeight: FontWeight.w500,
                                      fontSize: doubleWidth(4.5))),
                              SizedBox(
                                height: doubleHeight(1),
                              ),
                              Text('food delivered home',
                                  style: TextStyle(
                                      color: purple,
                                      fontWeight: FontWeight.w500,
                                      fontSize: doubleWidth(4.5)))
                            ],
                          ),
                        ),
                      ),
                    ))),

            if(animateBackground)
              AnimationBackground(
                  state: state,
                controller: _controllerBackGround,
              ),


          ],
        ),
      ),
    );
  }
}
