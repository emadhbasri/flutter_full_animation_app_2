import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../../../states/app_state.dart';
import '../../../functions.dart';
import '../../../items/shop_item.dart';
import '../../../data.dart';
import '../../../model.dart';

class ListMain extends StatelessWidget {
  const ListMain({
    Key? key,
    required this.listKey,
    required this.changeIt,
    required this.endOffsetBack,
    required this.endOffset,
    required this.startOffsetBack,
    required this.startOffset,
    required this.offsetChanger,
    required this.changeItChanger,
    required this.shops,
  }) : super(key: key);

  final GlobalKey<AnimatedListState> listKey;
  final bool changeIt;
  final Offset endOffsetBack;
  final Offset endOffset;
  final Offset startOffsetBack;
  final Offset startOffset;
  final Function(Offset, Offset) offsetChanger;
  final Function(bool) changeItChanger;

  final List<Shop> shops;
  doIt(context, index) async {
    changeItChanger(false);
    offsetChanger(Offset.zero, Offset(doubleWidth(100), 0));

    await Future.delayed(mil700);
    AppState state = Provider.of<AppState>(context, listen: false);
    state.shop = shops[index];
    state.changePage(PageName.shop);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: doubleHeight(14)), //7
      child: AnimatedList(
        key: listKey,
        initialItemCount: shops.length,
        physics: const BouncingScrollPhysics(),
        // padding: EdgeInsets.only(top: doubleHeight(7)),
        itemBuilder: (context, index, animation) {
          if (index == 0) {
            return ShopItem(
                animation: animation,
                shop: shops[index],
                havePading: false,
                doIt: () => doIt(context, index));
          } else {
            return ShopItem(
                animation: animation,
                shop: shops[index],
                doIt: () => doIt(context, index));
          }
        },
      ),
    );
  }
}
