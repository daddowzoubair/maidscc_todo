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
      // to show the keyboard above the content
      resizeToAvoidBottomInset: false,
      // contains buttons to navigate between the profile screen and todo list screen
      bottomNavigationBar: HomeBottomNavigationBar(tabController: tabController),
      // use the same AppBar for all pages to avoid using multiple Scaffold widgets
      appBar: HomeAppBar(tabController: tabController),
      // add a new todo if the user is signed in
      floatingActionButton: HomeFloatingActionButton(tabController: tabController),
      // Contains a TabBarView with AuthenticationScreen and TodoListScreen
      body: HomeTabBarView(tabController: tabController),
    );
  }
}
