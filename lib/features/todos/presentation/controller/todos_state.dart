// authentication_state.dart

import 'package:equatable/equatable.dart';

import '../../data/entities/todo_list/todo_list_model.dart';



abstract class TodosState extends Equatable {
  final int total;
  final List<TodoModel> todoList;

  const TodosState(this.todoList , this.total);

  @override
  List<Object?> get props => [todoList , total];
}

class TodosInitial extends TodosState {
  const TodosInitial(super.todoList, super.total);

  @override
  List<Object?> get props => [todoList , total];
}

class TodosLoading extends TodosState {
  const TodosLoading(super.todoList, super.total);

  @override
  List<Object?> get props => [todoList , total];
}

class TodosSuccess extends TodosState {
  const TodosSuccess(super.todoList, super.total);

  @override
  List<Object?> get props => [todoList , total];
}

class AddTodoSuccess extends TodosState {
  const AddTodoSuccess(super.todoList, super.total);

  @override
  List<Object?> get props => [todoList , total];
}

class UpdateTodoSuccess extends TodosState {
  const UpdateTodoSuccess(super.todoList, super.total);

  @override
  List<Object?> get props => [todoList , total];
}

class DeleteTodoSuccess extends TodosState {
  const DeleteTodoSuccess(super.todoList, super.total);

  @override
  List<Object?> get props => [todoList , total];
}

class TodosFailure extends TodosState {
  final String error;

  const TodosFailure(super.todoList, super.total, this.error);


  @override
  List<Object?> get props => [error,todoList , total];
}