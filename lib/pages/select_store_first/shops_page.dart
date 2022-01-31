import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../states/app_state.dart';
import '../../functions.dart';
import '../../data.dart';
import '../../model.dart';
import 'items/category_bar_main.dart';
import 'items/list.dart';
import 'items/title_main.dart';
import 'items/header.dart';

class ShopsPage extends StatefulWidget {
  const ShopsPage({Key? key}) : super(key: key);

  @override
  _ShopsPageState createState() => _ShopsPageState();
}

class _ShopsPageState extends State<ShopsPage>
    with SingleTickerProviderStateMixin {
  // AnimationController _controller;
  @override
  void initState() {
   statusSet(statusBar: Colors.transparent,
    statusBarIconIsWhite: false,navigationBar: Colors.transparent);
    super.initState();
    // _controller = AnimationController(
    //     vsync: this, value: 0, duration: Duration(seconds: 5));
    // _controller.forward();
  }

  bool changeIt = false;
  Offset endOffsetBack = Offset.zero;
  Offset endOffset = Offset.zero;
  Offset startOffsetBack = Offset(doubleWidth(100), 0);
  Offset startOffset = Offset(doubleWidth(100), 0);
  List<Shop> shops = [];
  changeItChanger(bool value) {
    setState(() {
      changeIt = value;
    });
  }

  offsetChanger(Offset start, Offset end) async {
    setState(() {
      startOffset = start;
      endOffset = end;
    });
    await Future.delayed(mil300);
    setState(() {
      startOffsetBack = start;
      endOffsetBack = end;
    });
  }

  final GlobalKey<AnimatedListState> _key = GlobalKey<AnimatedListState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: doubleHeight(3.5),
            ),
            const Header(),
            SizedBox(
              height: doubleHeight(2),
            ),
            const TitleMain(),
            SizedBox(
              height: doubleHeight(3),
            ),
            Expanded(
                child: Stack(
              children: [
                ListMain(
                    shops: shops,
                    listKey: _key,
                    changeIt: changeIt,
                    endOffset: endOffset,
                    endOffsetBack: endOffsetBack,
                    startOffset: startOffset,
                    startOffsetBack: startOffsetBack,
                    offsetChanger: offsetChanger,
                    changeItChanger: changeItChanger),
                CategoryBarMain(
                  changeItChanger: changeItChanger,
                  addList: addList,
                  changeIt: changeIt,
                  endOffset: endOffset,
                  endOffsetBack: endOffsetBack,
                  startOffset: startOffset,
                  startOffsetBack: startOffsetBack,
                )
              ],
            ))
          ],
        ),
      ),
    );
  }

  addList() async {
    AppState state = Provider.of<AppState>(context, listen: false);
    List<Shop> shops1 = state.getShopItem();
    if (shops.isNotEmpty) {
      removeList();
    }
    await Future.delayed(const Duration(milliseconds: 100));

    for (int j = 0; j < shops1.length; j++) {
      _key.currentState!.insertItem(j, duration: mil500);
      shops.add(shops1[j]);
      await Future.delayed(const Duration(milliseconds: 200));
    }
  }

  removeList() async {
    while (shops.isNotEmpty) {
      _key.currentState!.removeItem(
        0,
        (context, animation) => const SizedBox(),
      );
      setState(() {
        shops.removeAt(0);
      });
    }
  }
}
