import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../constants/app_dimensions.dart';
import '../../../../constants/app_strings.dart';
import '../../../../core/service_locator/service_locator.dart';
import '../../../../core/widgets/confirm_dialog.dart';
import '../../data/entities/todo_list/todo_list_model.dart';
import '../controller/todos_bloc.dart';
import '../controller/todos_event.dart';
import '../controller/todos_state.dart';
import '../widgets/todo_details_form_title_field.dart';
import '../widgets/todo_form_footer.dart';

class TodoDetailsScreen extends StatefulWidget {
  // The field is nullable because this screen is used for adding, updating, and deleting Todo objects, 
  final TodoModel? todoModel;
  // This parameter is used to verify if the Todo object is associated with the signed-in user by checking the userId.
  // It ensures that the Todo belongs to the currently authenticated user.
  final bool haveModifyPermission;
  const TodoDetailsScreen({super.key, this.todoModel , this.haveModifyPermission = false});

  @override
  State<TodoDetailsScreen> createState() => _TodoDetailsScreenState();
}

class _TodoDetailsScreenState extends State<TodoDetailsScreen> {
  final _formKey = GlobalKey<FormState>();
  final _todoController = TextEditingController();
  bool _isCompleted = false;

  @override
  void initState() {
    // fill the data from the object if it's not null
    if(widget.todoModel != null){
      _todoController.text = widget.todoModel!.todo;
      _isCompleted = widget.todoModel!.completed;
    }
    super.initState();
  }

  @override
  void dispose() {
    _todoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(AppStrings.todoDetails),
      ),
      body: BlocBuilder<TodosBloc, TodosState>(
        bloc: getIt<TodosBloc>(),
        builder: (context , state) {
          return Padding(
              padding: const EdgeInsets.all( AppDimensions.sixteenDimension ),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TodoDetailsFormTitleField(todoController: _todoController),
                
                    SwitchListTile.adaptive(
                      title: const Text(AppStrings.completed),
                      value: _isCompleted, 
                      // If this Todo object is not associated with the current user, the switch will be displayed as read-only,
                      // preventing the user from making changes to it.
                      onChanged: widget.haveModifyPermission || widget.todoModel == null ? (value) => setState(() {
                        _isCompleted = value ;
                      }) : null,
                    ),

                    // The "Add" button is displayed on this screen as it is intended for creating a new Todo item.
                    if(widget.todoModel == null)
                    ElevatedButton(
                      onPressed: state is TodosLoading ?  null : _sendAddRequest,
                      child: const Text(AppStrings.add),
                    ),
                    
                    // If the user is the owner of the Todo, we display the delete and update buttons.
                    if(widget.todoModel != null && widget.haveModifyPermission)
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ElevatedButton(
                          onPressed: state is TodosLoading ?  null : _sendUpdateRequest,
                          child: const Text(AppStrings.update),
                        ),
                                          
                        const SizedBox(height: AppDimensions.sixteenDimension,),
                                          
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(backgroundColor : Colors.red),
                          onPressed: state is TodosLoading ?  null : _sendDeleteRequest,
                          child: const Text(AppStrings.delete),
                        ),
                      ],
                    ),
                    // Includes error handling, loading state, and a listener to display the success message.
                    const TodoFormFooter(),
                
                  ],
                        ),
              ),
          );
        }
      ),
    );
  }

  void _sendDeleteRequest() {
    ConfirmDialog.showConfirmDialog(context: context, title: AppStrings.deleteTaskTitle, message: AppStrings.deleteTaskMessage).then((value){
        if(value){
          _delete(todoId: widget.todoModel!.id);
        }
      },);
  }

  void _delete({required int todoId}) {
    FocusManager.instance.primaryFocus?.unfocus();
    context.read<TodosBloc>().add(DeleteTodoEvent( todoId: todoId));
  }

  void _sendUpdateRequest() {
    if (_formKey.currentState!.validate()) {
      ConfirmDialog.showConfirmDialog(context: context, title: AppStrings.updateTaskTitle, message: AppStrings.updateTaskMessage).then((value){
        if(value){
          _update(todoId: widget.todoModel!.id, todoTitle: _todoController.text, isCompleted: _isCompleted);
        }
      },);
    }
  }

  void _update({required int todoId , required String todoTitle , required bool isCompleted}) {
    FocusManager.instance.primaryFocus?.unfocus();
    context.read<TodosBloc>().add(UpdateTodoEvent( todoId: todoId , title: todoTitle , completed: isCompleted  ));
  }

    void _sendAddRequest() {
    if (_formKey.currentState!.validate()) {
      ConfirmDialog.showConfirmDialog(context: context, title: AppStrings.addTaskTitle, message: AppStrings.addTaskMessage).then((value){
        if(value){
          _add(todoTitle: _todoController.text, isCompleted: _isCompleted);
        }
      },);
    }
  }

  void _add({ required String todoTitle , required bool isCompleted}) {
    FocusManager.instance.primaryFocus?.unfocus();
    context.read<TodosBloc>().add(AddTodoEvent( title: todoTitle , completed: isCompleted  ));
  }
}
