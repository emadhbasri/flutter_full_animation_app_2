import '../../../states/app_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../data.dart';
import '../../../functions.dart';
import '../shop_page_state.dart';
class ShopDetail extends StatelessWidget {
  const ShopDetail({Key? key, required this.appState, required this.state})
      : super(key: key);
  final AppState appState;
  final ShopPageState state;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: doubleHeight(25),
      right: 0.0,
      child: TweenAnimationBuilder(
        duration: const Duration(seconds: 1),
        tween: Tween<double>(begin: doubleWidth(5),//5
     end: doubleWidth(95)),
        child: Row(
          children: [
            Expanded(
                flex: 3,
                child: TweenAnimationBuilder(
                  duration: sec1,
                  tween: Tween<double>(begin: 0, end: 1),
                  builder: (context, double value, child) => Opacity(opacity: value, child: child),
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(appState.shop!.name + ' ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: doubleHeight(2.2))),
                          Icon(
                            !appState.shop!.like
                                ? CupertinoIcons.suit_heart
                                : CupertinoIcons.heart_solid,
                            color: Colors.pink,
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            CupertinoIcons.star_fill,
                            color: Colors.orangeAccent,
                          ),
                          SizedBox(
                            width: doubleWidth(1),
                          ),
                          Text(
                            '${appState.shop!.star}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: doubleWidth(4)),
                          ),
                          Text(
                            ' - ${appState.shop!.type} - \$\$ - ',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.grey,
                                fontSize: doubleWidth(3.5)),
                          ),
                          Text(
                            appState.shop!.time,
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.grey,
                                fontSize: doubleWidth(3.5)),
                          )
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.orangeAccent,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: doubleWidth(4),
                                vertical: doubleHeight(0.6)),
                            child: Text(
                              'Free deliver',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: doubleWidth(4)),
                            ),
                          ),
                          SizedBox(
                            width: doubleWidth(5),
                          ),
                          Text(
                            '24 review\'s',
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.grey,
                                fontSize: doubleWidth(3.5)),
                          ),
                        ],
                      ),
                    ],
                  ),

                )),
            Expanded(
              child: TweenAnimationBuilder(
                duration: sec1,
                tween: Tween<double>(begin: 0, end: 1),
                builder: (context, double value, child) =>
                    Transform.scale(scale: value, child: child),
                child: SizedBox(
                  height: doubleHeight(10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      height: doubleHeight(8),
                      width: doubleHeight(8),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey[350]!,
                                blurRadius: 20,
                                spreadRadius: -3,
                                offset: const Offset(0, 5)),
                            BoxShadow(
                                color: Colors.grey[350]!,
                                blurRadius: 20,
                                spreadRadius: -3,
                                offset: const Offset(-5, 0)),
                          ],
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage(appState.shop!.image),
                            fit: BoxFit.fill,
                          )),
                    ),
                  ),
                ),
              ),
            ),

          ],
        ),
        builder: (context, double value, child) => Container(
          height: doubleHeight(15),
          width: value,
          padding: EdgeInsets.only(
            left: doubleWidth(10),
            top: doubleHeight(1.5),
            bottom: doubleHeight(1),
          ),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                topLeft: Radius.circular(50),
              ),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.black26,
                    blurRadius: 20,
                    spreadRadius: -3,
                    offset: Offset(0, 10)),
                BoxShadow(
                    color: Colors.black26,
                    blurRadius: 20,
                    spreadRadius: -3,
                    offset: Offset(-10, 0)),
              ]),
          child: child,
        ),
      ),
    );
  }
}
