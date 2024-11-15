

import '../entities/todo_list/todo_list_model.dart';

// Todo repository interface
abstract class TodosRepository {
  Future<TodoListModel> todoList({int skip = 0 , int limit = 0});
  Future<TodoModel> todoDetails({required int id});
  Future<TodoListModel> userTodoList({int skip = 0 , int limit = 0 });
  Future<TodoModel> addTodo({required String todo , required bool isCompleted});
  Future<TodoModel> updateTodo({required int todoId, required String todo , required bool isCompleted});
  Future<TodoModel> deleteTodo({required int todoId});
}