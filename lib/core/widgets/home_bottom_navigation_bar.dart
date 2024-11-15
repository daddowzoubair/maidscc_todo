import '../../constants/app_dimensions.dart';
import '../../constants/app_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeBottomNavigationBar extends StatelessWidget {
  const HomeBottomNavigationBar({
    super.key,
    required this.tabController,
  });

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: AppDimensions.tabbarHeight,
        child: TabBar(
            padding: const EdgeInsets.all(AppDimensions.sixteenDimension),
            controller: tabController,
            tabs: const [
              Tab(
                  icon: Icon(CupertinoIcons.profile_circled),
                  text: AppStrings.profile),
              Tab(
                icon: Icon(CupertinoIcons.checkmark_alt_circle),
                text: AppStrings.todoList,
              ),
            ]),
      ),
    );
  }
}
