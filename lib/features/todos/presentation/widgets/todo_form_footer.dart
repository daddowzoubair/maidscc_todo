import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../constants/app_strings.dart';
import 'package:flutter/material.dart';

import '../controller/todos_bloc.dart';
import '../controller/todos_state.dart';


class TodoFormFooter extends StatelessWidget {
  const TodoFormFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TodosBloc, TodosState>(
        listener: (context, state){
          if(state is AddTodoSuccess || state is UpdateTodoSuccess || state is DeleteTodoSuccess){
            Navigator.of(context).pop();
            ScaffoldMessenger.of(context).showSnackBar( const SnackBar(content: Text(AppStrings.updatesSuccessfullyApplied)), );
          }
        },
        builder: (context, state) {
        return Expanded(
          child: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: Visibility(
                  maintainSize: true,
                  maintainAnimation: true,
                  maintainState: true,
                  visible: state is TodosLoading,
                    child: const Center(child: CircularProgressIndicator(),)),
                ),
                Visibility(
                  maintainSize: true,
                  maintainAnimation: true,
                  maintainState: true,
                  visible: state is TodosFailure,
                  child: Text('${AppStrings.error} ${state is TodosFailure ? state.error : ""}' , maxLines: 2, style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Theme.of(context).colorScheme.error ), )),
              ],
            ),
          ),
        );
      }
    );
  }
}
