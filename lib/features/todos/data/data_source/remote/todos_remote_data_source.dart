import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../../../../constants/app_strings.dart';

import '../../../../../constants/app_api_config.dart';
import '../../../../../core/network/clients/api_client.dart';
import '../../entities/todo_list/todo_list_model.dart';

@lazySingleton
class TodosRemoteDataSource {
  TodosRemoteDataSource(this.apiClient);

  final ApiClient apiClient;

  Future<TodoListModel> todoList({int limit = 0 , int skip = 0 }) async {
    try {
      Map<String, dynamic> queries = <String, dynamic>{
        AppApiConfig.todoListSkipParameter : skip,
        AppApiConfig.todoListLimitParameter : limit
      };
      
      return apiClient.todoList(queries);
      
    
    } on DioException catch (exception) {
      return TodoListModel.fromJson(json.decode(exception.response.toString()));
    } catch (e) {
      return const TodoListModel(
        message: AppStrings.generalErrorMessage,
      );
    }
  }

  Future<TodoModel> todoDetails( {required int id }) async {
    try {

      return apiClient.todoDetails(id);
    
    } on DioException catch (exception) {
      return TodoModel.fromJson(json.decode(exception.response.toString()));
    } catch (e) {
      return const TodoModel(
        message: AppStrings.generalErrorMessage,
      );
    }
  }

  Future<TodoListModel> userTodoList({required int userId , int limit = 0 , int skip = 0 }) async {
    try {
      Map<String, dynamic> queries = <String, dynamic>{
        AppApiConfig.todoListSkipParameter : skip,
        AppApiConfig.todoListLimitParameter : limit
      };
      
      return apiClient.userTodoList(userId , queries);
      
    
    } on DioException catch (exception) {
      return TodoListModel.fromJson(json.decode(exception.response.toString()));
    } catch (e) {
      return const TodoListModel(
        message: AppStrings.generalErrorMessage,
      );
    }
  }

  Future<TodoModel> addTodo({required String todo , required int userId , required bool isCompleted}) async {
    try {
      Map<String, dynamic> queries = <String, dynamic>{
        AppApiConfig.addTodoCompletedParameter : isCompleted,
        AppApiConfig.addTodoTitleParameter : todo,
        AppApiConfig.addTodoUserIdParameter : userId
      };
      
      return apiClient.addTodo(queries);
      
    
    } on DioException catch (exception) {
      return TodoModel.fromJson(json.decode(exception.response.toString()));
    } catch (e) {
      return const TodoModel(
        message: AppStrings.generalErrorMessage,
      );
    }
  }

  Future<TodoModel> updateTodo({required int todoId , required String todo, required bool isCompleted}) async {
    try {
      Map<String, dynamic> queries = <String, dynamic>{
        AppApiConfig.addTodoCompletedParameter : isCompleted,
        AppApiConfig.addTodoTitleParameter : todo,
      };
      
      return apiClient.updateTodo(todoId ,  queries);
      
    
    } on DioException catch (exception) {
      return TodoModel.fromJson(json.decode(exception.response.toString()));
    } catch (e) {
      return const TodoModel(
        message: AppStrings.generalErrorMessage,
      );
    }
  }

  Future<TodoModel> deleteTodo({required int todoId}) async {
    try {
      
      return apiClient.deleteTodo(todoId);
      
    
    } on DioException catch (exception) {
      return TodoModel.fromJson(json.decode(exception.response.toString()));
    } catch (e) {
      return const TodoModel(
        message: AppStrings.generalErrorMessage,
      );
    }
  }

}