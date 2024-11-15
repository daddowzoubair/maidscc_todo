import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../constants/app_strings.dart';
import '../controller/todos_bloc.dart';
import '../controller/todos_state.dart';
import '../widgets/todo_card.dart';

class TodoListScreen extends StatelessWidget {
  const TodoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodosBloc, TodosState>(
    builder: (context, state) {
      if (state is TodosLoading) {
        return const Center(child: CircularProgressIndicator());
      } else if (state is TodosSuccess || state.todoList.isNotEmpty) {
        final todos = state.todoList;
        if (todos.isEmpty) {
          return const Center(child: Text(AppStrings.noTodos));
        }
        return ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: todos.length,
          itemBuilder: (context, index) {
            final todo = todos[index];
            return TodoCard(todo: todo);
          },
        );
      } else if (state is TodosFailure) {
        return Center(child: Text("${AppStrings.error}: ${state.error}"));
      } else {
        return const Center(child: Text(AppStrings.noTodos));
      }
    },
    );
  }
}
