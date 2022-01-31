import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../states/app_state.dart';

import '../../../data.dart';
import '../../../functions.dart';
import '../../../model.dart';

class Header extends StatelessWidget {
  final AppState appState;

  const Header({Key? key,required this.appState}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        margin: EdgeInsets.only(top: doubleHeight(3.5)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: doubleWidth(5),
            ),
            TweenAnimationBuilder(
                tween: Tween<double>(begin: 0, end: 1),
                curve: sbs,
                duration: sec1,
                builder: (context, double value, child) => Transform.scale(
                      scale: value,
                      child: GestureDetector(
                        onTap: () {
                          appState.changePage(PageName.shops);
                        },
                        child: Container(
                          padding: EdgeInsets.all(doubleWidth(1.5)),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                CupertinoIcons.back,
                                color: Colors.black,
                                size: 20,
                              ),
                              const Text('Back'),
                              SizedBox(width: doubleWidth(1)),
                            ],
                          ),
                        ),
                      ),
                    )),
            const Spacer(),
            SizedBox(
              width: doubleWidth(1),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.all(doubleWidth(1.5)),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: const Icon(
                  CupertinoIcons.bag,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(
              width: doubleWidth(5),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.all(doubleWidth(1.5)),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: const Icon(
                  CupertinoIcons.suit_heart,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(
              width: doubleWidth(7),
            ),
          ],
        ),
      ),
    );
  }
}
