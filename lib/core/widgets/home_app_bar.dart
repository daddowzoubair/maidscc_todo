import '../../constants/app_dimensions.dart';
import '../../constants/app_strings.dart';
import '../../features/authentication/presentation/controller/authentication_bloc.dart';
import '../../features/authentication/presentation/controller/authentication_state.dart';
import '../../features/todos/presentation/controller/todos_bloc.dart';
import '../../features/todos/presentation/controller/todos_event.dart';
import '../../features/todos/presentation/widgets/todo_list_pagination.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../enum/todo_list_filter.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    super.key,
    required this.tabController,
  });

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        preferredSize: const Size.fromHeight(
            kToolbarHeight + AppDimensions.twentyFourDimension),
        child: BlocBuilder<AuthenticationBloc,AuthenticationState>(
          builder: (context , state) {
            return ListenableBuilder(
              listenable: tabController,
              builder: (context, child) => AppBar(
                //
                // show filter action button when the user navigate to todo list screen
                //
                actions: tabController.index == 1 ? [
                  IconButton(
                    onPressed: (){
                      _showContextMenu(context, state).then((value){
                        if(value == TodoListFilter.all.name){
                          context.read<TodosBloc>().add(FetchTodoListEvent());
                        }
                
                        if(value == TodoListFilter.myList.name){
                          context.read<TodosBloc>().add(FetchMyTodoListEvent());
                        }
                      },);
                  }, icon: const Icon(Icons.filter_alt_rounded , color: Colors.white,))
                ] :[],
                leadingWidth: AppDimensions.leadingWidth,
                //
                // show pagination widget when the user navigate to todo list screen
                //
                leading: tabController.index == 1 ? const TodoListPagination() : null,
                title: Text(tabController.index == 0 ? AppStrings.profile : AppStrings.todoList),
              ),
            );
          }
        ));
  }

  Future<String?> _showContextMenu(BuildContext context, AuthenticationState state) {
    return showMenu(
          context: context, 
          position: const RelativeRect.fromLTRB(1000, AppDimensions.eightyDimension, AppDimensions.thirtyTwoDimension, AppDimensions.thirtyTwoDimension), 
          items: [
            PopupMenuItem<String>(
              value: TodoListFilter.all.name,
              child: Text(TodoListFilter.all.title),
            ),
            //
            // Show this option only if the user is signed in
            //
            if(state is UserInfoLoaded)
            PopupMenuItem<String>(
              value: TodoListFilter.myList.name,
              child: Text(TodoListFilter.myList.title),
            ),
        ]);
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + AppDimensions.twentyFourDimension);
}
