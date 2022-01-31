import 'package:flutter/material.dart';
import '../../../items/food_item.dart';
import '../../../states/app_state.dart';

import '../../../data.dart';
import '../../../functions.dart';
import '../../../model.dart';
import '../shop_page_state.dart';

class ListMain extends StatefulWidget {
  final AppState appState;
  final ShopPageState state;
  const ListMain({Key? key, required this.appState, required this.state})
      : super(key: key);

  @override
  State<ListMain> createState() => _ListMainState();
}

class _ListMainState extends State<ListMain> {

  @override
  void initState() {
    if(widget.state.foods.isEmpty){
      Future.delayed(mil500,()=>widget.state.addList());
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.maxFinite,
          height: doubleHeight(35),
          decoration: const BoxDecoration(
            borderRadius:
                BorderRadius.only(bottomLeft: Radius.elliptical(60, 30)),
            image: DecorationImage(
                image: AssetImage(
                    'assets/images/PageFirst1.jpg'),
                fit: BoxFit.fill)
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: doubleHeight(5)),
          child: LimitedBox(
            maxHeight: doubleHeight(7),
            maxWidth: double.maxFinite,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: widget.appState.shop!.categorysName.length,
              itemBuilder: (context, index) {
                String name = widget.appState.shop!.categorysName[index];
                if (widget.state.selectedCategory == name) {
                  return Padding(
                    padding: EdgeInsets.only(
                        right: doubleWidth(4),
                        left: index == 0 ? doubleWidth(4) : 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.pink,
                              borderRadius: BorderRadius.circular(100)),
                          width: doubleWidth(2),
                          height: doubleWidth(2),
                        ),
                        SizedBox(
                          width: doubleWidth(2),
                        ),
                        Text(name,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.pink,
                                fontSize: doubleWidth(4)))
                      ],
                    ),
                  );
                } else {
                  return Padding(
                    padding: EdgeInsets.only(
                        right: doubleWidth(4),
                        left: index == 0 ? doubleWidth(4) : 0),
                    child: GestureDetector(
                      onTap: () {
                        widget.state.selectedCategory = name;
                        widget.state.addList();
                        widget.state.notify();
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(name,
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: doubleWidth(4))),
                        ],
                      ),
                    ),
                  );
                }
              },
            ),
          ),
        ),
        Expanded(
          child: SizedBox(
            width: double.maxFinite,
            child: AnimatedList(
                padding: EdgeInsets.only(bottom: doubleHeight(3)),
                physics: const BouncingScrollPhysics(),

                key: widget.state.listKey,
                itemBuilder: (context, index,animation) => SlideTransition(
                  position: Tween<Offset>(begin: const Offset(-0.5,0), end: Offset.zero)
                      .animate(CurvedAnimation(parent: animation, curve: const Interval(0,0.5))),
                  child: Column(
                    children: [
                      GestureDetector(
                          onTap: () {
                            widget.appState.food = widget.state.foods[index];
                            widget.appState.changePage(PageName.food);
                          },
                          child: FoodItem(
                            food:widget.state.foods[index],
                            animation:animation,
                          )),
                      Divider(
                        color: Colors.grey,
                        indent: doubleWidth(5),
                        endIndent: doubleWidth(5),
                        height: doubleHeight(2.7),
                      )
                    ],
                  ),
                ),
                initialItemCount: widget.state.foods.length)
          ),
        ),
      ],
    );
  }
}
//                return ListView.separated(
//                     padding: EdgeInsets.only(bottom: doubleHeight(3)),
//                     physics: const BouncingScrollPhysics(),
//                     itemBuilder: (context, index) => GestureDetector(
//                         onTap: () {
//                           appState.food = myFood[index];
//                           appState.changePage(PageName.Food);
//                         },
//                         child: FoodItem(
//                           myFood[index],
//                         )),
//                     separatorBuilder: (context, index) => Divider(
//                           color: Colors.grey,
//                           indent: doubleWidth(5),
//                           endIndent: doubleWidth(5),
//                           height: doubleHeight(2.7),
//                         ),
//                     itemCount: myFood.length);