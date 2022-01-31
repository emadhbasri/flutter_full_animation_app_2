import 'package:flutter/material.dart';
import '../data.dart';
import '../functions.dart';
import '../model.dart';

class CartPageState extends ChangeNotifier {
  bool isBack = true;
  bool isShowBottomButtons = false;
  bool isShowMainLayout = true;
  bool isShowCartText = false;
  bool isShowDeliver = false;
  bool isShowShopsName = false;
  bool isShowTrashButton = false;

  bool _animIsCompleted = false;
  late AnimationController controller;

  init() {
    controller.addListener(() {
      ///showBottomButtons
      if (controller.isCompleted) {
        _animIsCompleted = true;
      }

      if (_animIsCompleted && controller.value == 0.8) {
        showBottomButtons();
      }

      ///showBottomButtons
      ///showOthers
      if (controller.value >= 0.1) {
        showTrashButton();
      }

      if (controller.value >= 0.15) {
        showCartText();
      }

      if (controller.value >= 0.2) {
        showDeliver();
      }

      if (controller.value >= 0.25) {
        showShopsName();
      }

      ///showOthers
    });
    addList();
  }

  List<FoodCount> cart = [];
  final List<FoodCount> mainCart;

  CartPageState(this.mainCart);

  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();
  addList() async {

    if (mainCart.isNotEmpty) {
      removeList();
    }
    await Future.delayed(const Duration(milliseconds: 100));

    for (int j = 0; j < mainCart.length; j++) {
      listKey.currentState!.insertItem(j, duration: mil800);
      cart.add(mainCart[j]);
      await Future.delayed(const Duration(milliseconds: 200));
    }
  }

  removeList() async {
    while (cart.isNotEmpty) {
      listKey.currentState!.removeItem(
        0,
        (context, animation) => const SizedBox(),
      );
      cart.removeAt(0);
      notifyListeners();
    }
  }

  showBottomButtons() {
    if (!isShowBottomButtons) {
      isShowBottomButtons = true;
      notifyListeners();
    }
  }

  showTrashButton() {
    if (!isShowTrashButton) {
      isShowTrashButton = true;
      notifyListeners();
    }
  }

  showCartText() {
    if (!isShowCartText) {
      isShowCartText = true;
      notifyListeners();
    }
  }

  showDeliver() {
    if (!isShowDeliver) {
      isShowDeliver = true;
      notifyListeners();
    }
  }

  showShopsName() {
    if (!isShowShopsName) {
      isShowShopsName = true;
      notifyListeners();
    }
  }

  Offset startOffset = Offset(doubleWidth(90), 0);
  Offset endOffset = Offset.zero;
  bool doController = true;
  offsetChanger(Offset start, Offset end) {
    doController = false;
    startOffset = start;
    endOffset = end;
    notifyListeners();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void notify() {
    notifyListeners();
  }
}
