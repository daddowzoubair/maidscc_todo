import 'package:flutter/material.dart';
import 'core/widgets/home_app_bar.dart';
import 'core/widgets/home_bottom_navigation_bar.dart';
import 'core/widgets/home_floating_action_button.dart';
import 'core/widgets/home_tab_bar_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    //hide the keyboard when the tab index changed
    tabController.addListener(
      () {
        if (tabController.index != tabController.previousIndex) {
          WidgetsBinding.instance.addPostFrameCallback(
            (timeStamp) {
              FocusManager.instance.primaryFocus?.unfocus();
            },
          );
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: HomeBottomNavigationBar(tabController: tabController),
      appBar: HomeAppBar(tabController: tabController),
      floatingActionButton: HomeFloatingActionButton(tabController: tabController),
      body: HomeTabBarView(tabController: tabController),
    );
  }
}
