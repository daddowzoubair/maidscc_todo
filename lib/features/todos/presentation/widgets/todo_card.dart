import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../constants/app_dimensions.dart';
import '../../../authentication/presentation/controller/authentication_bloc.dart';
import '../../../authentication/presentation/controller/authentication_state.dart';
import '../../data/entities/todo_list/todo_list_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens/todo_details.dart';

class TodoCard extends StatelessWidget {
  const TodoCard({
    super.key,
    required this.todo,
  });

  final TodoModel todo;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: BlocBuilder<AuthenticationBloc,AuthenticationState>(
        builder: (context , state) {
          return InkWell(
            onTap: () {
              Navigator.push( context, MaterialPageRoute(builder: (context) => TodoDetailsScreen(
                todoModel: todo,
                haveModifyPermission: state is UserInfoLoaded && todo.userId == state.userInfo.id,
                
              )));
            },
            child: Padding(
              padding: const EdgeInsets.all(AppDimensions.eightDimension),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  todo.completed ? const Icon(CupertinoIcons.check_mark_circled_solid , color: Colors.green,) : const Icon(CupertinoIcons.check_mark_circled ,),
                  const SizedBox(width: AppDimensions.sixteenDimension,),
                  Flexible(child: Text(todo.todo)),
                ],
              ),
            ),
          );
        }
      ),
      
    );
  }
}
