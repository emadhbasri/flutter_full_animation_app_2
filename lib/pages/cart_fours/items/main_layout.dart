import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../../states/cart_page_state.dart';
import '../../../functions.dart';
import '../../../states/app_state.dart';
import '../../../items/cart_item.dart';
import '../../../data.dart';
import '../../../model.dart';

class MainLayout extends StatelessWidget {
  final AppState appState;
  final CartPageState state;
  const MainLayout({
    Key? key,required this.appState,required this.state,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: Container(
        color: Colors.transparent,
        padding: EdgeInsets.symmetric(horizontal: doubleWidth(5)),
      height: doubleHeight(82),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: doubleHeight(5)),
              Visibility(
                visible: state.isShowTrashButton,
                child: TweenAnimationBuilder(
                  curve: sbs,
                  duration: mil500,
                  tween: Tween<double>(begin: 0.8, end: 1),
                  builder: (context, double scale, child) => Transform.scale(
                    scale: scale,
                    child: child,
                  ),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      onPressed: () {
                        appState.cart.clear();
                        appState.notify();
                        appState.changePage(PageName.food);
                      },
                      icon: const Icon(
                        CupertinoIcons.trash,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: state.isShowCartText,
                child: TweenAnimationBuilder(
                  curve: sbs,
                  duration: mil500,
                  tween: Tween<double>(begin: 0.8, end: 1),
                  builder: (context, double scale, child) => Transform.scale(
                    scale: scale,
                    child: child,
                  ),
                  child: Text(
                    'Cart',
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                        fontSize: doubleWidth(8)),
                  ),
                ),
              ),
            SizedBox(height: doubleHeight(1)),
              Visibility(
                visible: state.isShowDeliver,
                child: TweenAnimationBuilder(
                  curve: sbs,
                  duration: mil500,
                  tween: Tween<Offset>(begin: const Offset(-15,0), end: Offset.zero),
                  builder: (context, Offset offset, child) => Transform.translate(
                    offset: offset,
                    child: child,
                  ),
                  child: Row(
                    children: [
                      Text(
                        'DELIVER TO',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                            fontSize: doubleWidth(3.5)),
                      ),
                      SizedBox(width: doubleWidth(3)),
                      Text(
                        appState.address,
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                            fontSize: doubleWidth(3)),
                      ),
                      PopupMenuButton<String>(
                          elevation: 0,
                          onSelected: (e) {
                            appState.address = e;
                            appState.notify();
                          },
                          offset: const Offset(0, 50),
                          padding: EdgeInsets.zero,
                          child: Padding(
                            padding: EdgeInsets.only(left: doubleWidth(1)),
                            child: const Icon(
                              CupertinoIcons.chevron_down,
                              color: Colors.white,
                              size: 18,
                            ),
                          ),
                          itemBuilder: (context) => [
                                PopupMenuItem(
                                  value: '797_CASSIE_SPURS',
                                  child: Text(
                                    '797_CASSIE_SPURS',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: doubleWidth(3.5)),
                                  ),
                                ),
                                PopupMenuItem(
                                  value: '798_CASSIE_SPURS',
                                  child: Text(
                                    '798_CASSIE_SPURS',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: doubleWidth(3.5)),
                                  ),
                                ),
                              ]),
                      const Spacer(),
                      Text(
                        appState.date,
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                            fontSize: doubleWidth(3)),
                      ),
                      PopupMenuButton<String>(
                          elevation: 0,
                          onSelected: (e) {
                            appState.date = e;
                            appState.notify();
                          },
                          offset: const Offset(0, 50),
                          padding: EdgeInsets.zero,
                          child: Padding(
                            padding: EdgeInsets.only(left: doubleWidth(1)),
                            child: const Icon(
                              CupertinoIcons.chevron_down,
                              color: Colors.white,
                              size: 18,
                            ),
                          ),
                          itemBuilder: (context) => [
                                PopupMenuItem(
                                  value: 'NOW',
                                  child: Text(
                                    'NOW',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w300,
                                        fontSize: doubleWidth(3)),
                                  ),
                                ),
                                PopupMenuItem(
                                  value: 'TOMARROW',
                                  child: Text(
                                    'TOMARROW',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w300,
                                        fontSize: doubleWidth(3)),
                                  ),
                                ),
                              ])
                    ],
                  ),
                ),
              ),
            SizedBox(height: doubleHeight(3)),
              Visibility(
                visible: state.isShowShopsName,
                child: TweenAnimationBuilder(
                  curve: sbs,
                  duration: mil500,
                  tween: Tween<double>(begin: 0.8, end: 1),
                  builder: (context, double scale, child) => Transform.scale(
                    scale: scale,
                    child: child,
                  ),
                  child: Row(
                    children: [
                      Text(
                        'FROM',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                            fontSize: doubleWidth(3.5)),
                      ),
                      SizedBox(width: doubleWidth(3)),
                      Text(
                        appState.shop!.name,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: doubleWidth(4)),
                      ),
                      const Spacer(),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: doubleWidth(2),
                            vertical: doubleHeight(0.5)),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border:
                                Border.all(width: 1, color: Colors.pink[100]!)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              CupertinoIcons.time,
                              color: Colors.pink[100],
                              size: 15,
                            ),
                            SizedBox(width: doubleWidth(2)),
                            Text(
                              '15-20 min',
                              style: TextStyle(
                                  color: Colors.pink[100],
                                  fontSize: doubleWidth(3)),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            Expanded(
              child: AnimatedList(
                key: state.listKey,
                initialItemCount: state.cart.length,
                itemBuilder: (context,index,animation) {
                  return SlideTransition(
                    position: Tween<Offset>(begin: const Offset(-0.5,0), end: Offset.zero)
                        .animate(CurvedAnimation(parent: animation, curve: const Interval(0,0.5))),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: doubleHeight(1)),
                        CartItem(
                          foodCount: state.cart[index],
                        ),
                      ],
                    ),
                  );
                },
                physics: const BouncingScrollPhysics(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
