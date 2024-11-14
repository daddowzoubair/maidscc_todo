import 'dart:async';

import 'package:injectable/injectable.dart';
import '../data_source/local/todos_local_data_source.dart';
import '../data_source/remote/todos_remote_data_source.dart';
import '../entities/todo_list/todo_list_model.dart';

import 'todos_repository.dart';


@LazySingleton(as: TodosRepository)
class TodosRepositoryImp extends TodosRepository {
  TodosRepositoryImp(
    this.todosRemoteDataSource,
    this.todosLocalDataSource
  );

  final TodosRemoteDataSource todosRemoteDataSource;
  final TodosLocalDataSource todosLocalDataSource;

  @override
  Future<TodoListModel> todoList({int skip = 0, int limit = 0}) async {

    final response = await todosRemoteDataSource.todoList(limit: limit , skip: skip);
    
    return response;
    
  }
  
  @override
  Future<TodoModel> todoDetails({required int id}) async {
    final response = await todosRemoteDataSource.todoDetails(id: id);
    
    return response;
  }
  
  @override
  Future<TodoListModel> userTodoList({int skip = 0, int limit = 0, }) async {
    //TODO user id
    final response = await todosRemoteDataSource.userTodoList(userId: 1 , limit: limit , skip: skip  );
    
    return response;
  }
  
  @override
  Future<TodoModel> addTodo({required String todo , required bool isCompleted}) async {
    //TODO user id
    final response = await todosRemoteDataSource.addTodo(todo: todo, userId: 1, isCompleted: isCompleted);
    
    return response;
  }
  
  @override
  Future<TodoModel> deleteTodo({required int todoId}) async {
    final response = await todosRemoteDataSource.deleteTodo(todoId: todoId);
    
    return response;
  }
  
  @override
  Future<TodoModel> updateTodo({required int todoId, required String todo, required bool isCompleted}) async {
    final response = await todosRemoteDataSource.updateTodo(todoId: todoId , todo: todo , isCompleted: isCompleted);
    
    return response;
  }


}
