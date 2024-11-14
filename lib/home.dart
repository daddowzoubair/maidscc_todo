import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'constants/app_dimensions.dart';
import 'constants/app_strings.dart';
import 'features/authentication/presentation/screens/authentication_screen.dart';
import 'features/todos/presentation/screens/todo_list_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {

  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    //hide the keyboard when the tab index changed
    tabController.addListener(() {
      if(tabController.index != tabController.previousIndex){
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          FocusManager.instance.primaryFocus?.unfocus();
        },);
      }
    },);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: SafeArea(
        child: SizedBox(
          height: AppDimensions.tabbarHeight,
          child: TabBar(
            padding: const EdgeInsets.all(AppDimensions.sixteenDimension),
            controller: tabController,
            tabs: const [
            Tab(icon: Icon(CupertinoIcons.profile_circled),text: AppStrings.profile),
            Tab(icon: Icon(CupertinoIcons.checkmark_alt_circle),text: AppStrings.todoList,),
          ]),
        ),
      ),
      appBar: AppBar(
        title: ListenableBuilder(listenable: tabController, builder: (context, child) => Text(tabController.index == 0 ? AppStrings.profile : AppStrings.todoList ),),
      ),
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: tabController,
        children: const [
          AuthenticationScreen(),
          TodoListScreen()
        ]
      ),
    );
  }
}
