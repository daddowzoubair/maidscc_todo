import '../../features/authentication/presentation/screens/authentication_screen.dart';
import '../../features/todos/presentation/screens/todo_list_screen.dart';
import 'package:flutter/material.dart';

class HomeTabBarView extends StatelessWidget {
  const HomeTabBarView({
    super.key,
    required this.tabController,
  });

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: tabController,
        children: const [AuthenticationScreen(), TodoListScreen()]);
  }
}
