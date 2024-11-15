import '../controller/todos_bloc.dart';
import '../controller/todos_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoListPagination extends StatelessWidget {
  const TodoListPagination({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodosBloc, TodosState>(
    builder: (context , state) {
      return Row(
        children: [
          IconButton(onPressed: () {  },
            icon:  Icon(Icons.arrow_back_ios , color: Theme.of(context).colorScheme.onPrimary,)),
            Expanded(
              child: Center(
                child: Text(state.total.toString() , style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary
                ),),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon:  Icon(Icons.arrow_forward_ios , color: Theme.of(context).colorScheme.onPrimary,)),
        ],
      );
    }
    );
  }
}
