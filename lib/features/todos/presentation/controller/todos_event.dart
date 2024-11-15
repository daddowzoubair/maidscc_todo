// authentication_event.dart

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class TodosEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AddTodoEvent extends TodosEvent {
  final String title;
  final bool completed;

  AddTodoEvent({required this.title,required this.completed});

  @override
  List<Object> get props => [title, completed];
}

class UpdateTodoEvent extends TodosEvent {
  final int todoId;
  final String title;
  final bool completed;

  UpdateTodoEvent({required this.todoId, required this.title, required this.completed});

  @override
  List<Object> get props => [title, completed];
}

class DeleteTodoEvent extends TodosEvent {
  final int todoId;

  DeleteTodoEvent({required this.todoId,});

  @override
  List<Object> get props => [todoId];
}

class FetchTodoListEvent extends TodosEvent {
  final int skip;
  final int limit;

  FetchTodoListEvent({this.skip = 0,this.limit = 0});

  @override
  List<Object> get props => [skip, limit];
}

class FetchMyTodoListEvent extends TodosEvent {
  final int skip;
  final int limit;

  FetchMyTodoListEvent({this.skip = 0,this.limit = 0});

  @override
  List<Object> get props => [skip, limit];
}