import 'package:flutter/material.dart';
import '../../../items/selectable.dart';
import '../../../states/cart_page_state.dart';
import '../../../states/app_state.dart';
import '../../../functions.dart';
import '../../../data.dart';

class BottomButtons extends StatelessWidget {
  final CartPageState state;
  final AppState appState;
  const BottomButtons({
    Key? key,
    required this.state,
    required this.appState,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const Alignment(0, 0.85),
      child: SizedBox(
        width: doubleWidth(90),
        height: doubleHeight(10),
        child: Row(
          children: [
            Expanded(
                child: TweenAnimationBuilder(
              curve: sbs,
              duration: mil500,
              tween: Tween<double>(begin: 0.8, end: 1),
              builder: (context, double scale, child) => Transform.scale(
                scale: scale,
                child: child,
              ),
              child: Container(
                width: double.maxFinite,
                height: double.maxFinite,
                padding: EdgeInsets.all(doubleWidth(2)),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    elevation: MaterialStateProperty.all(1),
                    shadowColor: MaterialStateProperty.all(Colors.grey[400]),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
                  ),
                  child: const Text(
                    '\$22.70',
                    style: TextStyle(color: Colors.black, fontSize: 12),
                  ),
                ),
              ),
            )),
            Expanded(
                flex: 3,
                child: TweenAnimationBuilder(
                  curve: sbs,
                  duration: mil500,
                  tween: Tween<double>(begin: 0.8, end: 1),
                  builder: (context, double scale, child) => Transform.scale(
                    scale: scale,
                    child: child,
                  ),
                  child: SelectableScale(
                    duration: mil200,
                    onTap: (){
                      state.controller
                          .animateTo(1, duration: mil300)
                          .then((value) {
                            // state.removeList();


                        state.isShowBottomButtons = false;
                        state.isShowMainLayout = false;
                        state.notify();
                        state.controller
                            .animateBack(0, duration: mil700)
                            .then((value) => state.offsetChanger(
                            Offset.zero, Offset(doubleWidth(100), 0)));
                      });
                    },
                    child: Container(
                      width: double.maxFinite,
                      height: double.maxFinite,
                      padding: EdgeInsets.all(doubleWidth(2)),
                      child: ElevatedButton(
                        onPressed: null,
                        style: ButtonStyle(
                          overlayColor: MaterialStateProperty.all(Colors.pink),
                          elevation: MaterialStateProperty.all(1),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.pinkAccent),
                          shadowColor:
                              MaterialStateProperty.all(Colors.grey[400]),
                          shape: MaterialStateProperty.all(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                        ),
                        child: Text('CHECKOUT',
                            style: TextStyle(
                                fontSize: doubleWidth(4),
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
