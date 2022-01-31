import 'package:flutter/material.dart';
import '../../states/cart_page_state.dart';
import 'package:provider/provider.dart';
import '../../functions.dart';
import '../../states/app_state.dart';
import '../../data.dart';
import '../../model.dart';
import 'items/animation_background.dart';
import 'items/bottom_buttons.dart';
import 'items/main_layout.dart';

class CartPageBuilder extends StatelessWidget {
  const CartPageBuilder({Key? key,required this.state}) : super(key: key);
final AppState state;
  @override
  Widget build(BuildContext context) {
    return ListenableProvider<CartPageState>(
      create: (context) => CartPageState(state.cart),
      child: const CartPage(),
    );
  }
}

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage>
    with SingleTickerProviderStateMixin {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    CartPageState state = Provider.of<CartPageState>(context, listen: false);
    state.controller =
        AnimationController(vsync: this, duration: mil700, value: 0);
    state.init();
    statusSet(
        navigationBar: const Color.fromRGBO(247, 218, 204, 1),
        navigationBarLineIsWhite: true);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    AppState appState = Provider.of<AppState>(context, listen: false);
    return WillPopScope(
      onWillPop: () async {
        statusSet(navigationBar: Colors.white, navigationBarLineIsWhite: false);
        // state.changePage(PageName.Food);
        appState.changePage(PageName.food);
        return false;
      },
      child: Consumer<CartPageState>(builder: (context, state, _) {
        return Scaffold(
          backgroundColor: crem,
          body: Stack(
            children: [
              if (state.isShowBottomButtons)
                BottomButtons(
                  state: state,
                  appState: appState,
                ),

              AnimationBackground(
                appState: appState,
                state: state,
              ),

              Opacity(
                opacity: state.isShowMainLayout?1:0,
                child: MainLayout(
                  appState: appState,
                  state: state,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
