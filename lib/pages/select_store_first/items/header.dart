import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../../../states/app_state.dart';
import '../../../functions.dart';
import '../../../data.dart';
import '../../../model.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: TextDirection.ltr,
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: doubleWidth(1),
        ),
        TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: 1),
            curve: sbs,
            duration: sec1,
            builder: (context, double scale, child) => Transform.scale(
                scale: scale,
                child: GestureDetector(
                  onTap: () {
                    // AppState state = ;
                    // state/

                    Provider.of<AppState>(context, listen: false)
                        .changePage(PageName.cart);
                  },
                  child: Container(
                    padding: EdgeInsets.all(doubleWidth(1.5)),
                    decoration: BoxDecoration(
                      // color: Colors.white.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: const Icon(
                      CupertinoIcons.bag,
                      color: Colors.black,
                    ),
                  ),
                ))),
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
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.all(doubleWidth(1.5)),
                      decoration: BoxDecoration(
                        // color: Colors.white.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: const Icon(
                        CupertinoIcons.suit_heart,
                        color: Colors.black,
                      ),
                    ),
                  ),
                )),
        SizedBox(
          width: doubleWidth(7),
        ),
      ],
    );
  }
}
