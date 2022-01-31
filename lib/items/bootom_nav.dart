import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../states/app_state.dart';
import '../functions.dart';
import '../model.dart';
import 'tab_item.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: doubleHeight(10),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: doubleWidth(13)),
        child: Consumer<AppState>(
            builder: (context, state, child) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TabItem(
                      state: state,
                      icon: CupertinoIcons.home,
                      isSelected: state.tab == Tabs.home,
                      tab: Tabs.home,
                      text: 'Home',
                    ),
                    TabItem(
                      state: state,
                      icon: CupertinoIcons.search,
                      isSelected: state.tab == Tabs.search,
                      tab: Tabs.search,
                      text: 'Search',
                    ),
                    TabItem(
                      state: state,
                      icon: CupertinoIcons.cart,
                      isSelected: state.tab == Tabs.cart,
                      tab: Tabs.cart,
                      text: 'Cart',
                    ),
                    TabItem(
                      state: state,
                      icon: CupertinoIcons.profile_circled,
                      isSelected: state.tab == Tabs.profile,
                      tab: Tabs.profile,
                      text: 'Profile',
                    ),
                  ],
                )),
      ),
    );
  }
}
