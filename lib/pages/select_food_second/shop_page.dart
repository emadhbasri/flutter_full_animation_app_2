import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../functions.dart';
import '../../states/app_state.dart';
import '../../model.dart';
import 'items/header.dart';
import 'items/list.dart';
import 'items/shop_detail.dart';
import 'shop_page_state.dart';

class ShopPageBuilder extends StatelessWidget {
  const ShopPageBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListenableProvider<ShopPageState>(
      create: (context) => ShopPageState(),
      child: const ShopPage(),
    );
  }
}

class ShopPage extends StatefulWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  void initState() {
    statusSet(statusBar: Colors.transparent);
    AppState appState = Provider.of<AppState>(context, listen: false);
    ShopPageState state = Provider.of<ShopPageState>(context, listen: false);
    state.selectedCategory = appState.shop!.categorysName.first;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppState appState = Provider.of<AppState>(context, listen: false);
    return WillPopScope(
      onWillPop: () async {
        appState.changePage(PageName.shops);
        return false;
      },
      child: Consumer<ShopPageState>(
        builder: (context,state,_) {
          return Material(
            child: SizedBox.expand(
              child: Stack(
                children: [
                  ListMain(appState: appState, state: state),
                  ShopDetail(appState: appState, state: state),
                  Header(appState:appState),
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}
