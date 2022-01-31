import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../states/app_state.dart';
import '../data.dart';
import '../functions.dart';
import '../model.dart';

class TabItem extends StatelessWidget {
  final bool isSelected;
  final String text;
  final Tabs tab;
  final IconData icon;
  final AppState state;
  const TabItem(
      {Key? key,
      required this.isSelected,
      required this.text,
      required this.tab,
      required this.icon,
      required this.state})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: mil500,
      transitionBuilder: (child, animation) => ScaleTransition(
        scale: animation,
        child: child,
      ),
      child: isSelected
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: doubleWidth(2),
                  height: doubleWidth(2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: doubleWidth(2)),
                Text(
                  text,
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
                )
              ],
            )
          //TabItem('Home')
          : IconButton(
              icon: Icon(icon, color: Colors.white, size: doubleWidth(7)),
              onPressed: () {
                Provider.of<AppState>(context, listen: false).setTab(tab);
                Future.delayed(mil600, () {
                  if(text=='Cart'){
                    state.changePage(PageName.cart);
                  }else if(text=='Home'){
                    state.changePage(PageName.shops);
                  }
                });
              },
              padding: EdgeInsets.zero,
            ),
    );
  }
}
