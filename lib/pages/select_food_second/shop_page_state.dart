import 'package:flutter/material.dart';

import '../../data.dart';
import '../../model.dart';

class ShopPageState extends ChangeNotifier {
  String? selectedCategory;
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();
  List<Food> foods = [];
  addList() async {
    List<Food> tempFoods = [];
    if (selectedCategory == 'Most popular') {
      tempFoods = listAllFoods.reversed.map((e) => e).toList();
    } else {
      tempFoods =
          listAllFoods.where((e) => e.category == selectedCategory).toList();
    }

    if (foods.isNotEmpty) {
      removeList();
    }
    await Future.delayed(const Duration(milliseconds: 100));

    for (int j = 0; j < tempFoods.length; j++) {
      listKey.currentState!.insertItem(j, duration: mil800);
      foods.add(tempFoods[j]);
      await Future.delayed(const Duration(milliseconds: 200));
    }
  }

  removeList() async {
    while (foods.isNotEmpty) {
      listKey.currentState!.removeItem(
        0,
        (context, animation) => const SizedBox(),
      );
      foods.removeAt(0);
      notifyListeners();
    }
  }

  void notify() {
    notifyListeners();
  }
}
