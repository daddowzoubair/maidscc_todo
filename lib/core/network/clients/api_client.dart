import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../../constants/app_api_config.dart';
import '../../../features/authentication/data/entities/login/login_model.dart';
import '../../../features/authentication/data/entities/user_info/user_info_model.dart';
import 'package:retrofit/retrofit.dart';

import '../../../features/todos/data/entities/todo_list/todo_list_model.dart';

part 'api_client.g.dart';

// Use Retrofit to generate these functions with Dio
@RestApi()
abstract class ApiClient{

  @factoryMethod
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @POST(AppApiConfig.loginApi)
  Future<LoginModel> login(@Body() Map<String, dynamic> queries);

  @GET(AppApiConfig.userInfoApi)
  Future<UserInfoModel> userInfo();

  @POST(AppApiConfig.refreshTokenApi)
  Future<LoginModel> refreshToken(@Body() Map<String, dynamic> queries);

  @GET(AppApiConfig.todoListApi)
  Future<TodoListModel> todoList(@Queries() Map<String, dynamic> queries);

  @GET('${AppApiConfig.todoListApi}/{id}')
  Future<TodoModel> todoDetails(@Path('id') int todoId);

  @GET('${AppApiConfig.userTodoList}/{id}')
  Future<TodoListModel> userTodoList(@Path('id') int userId , @Queries() Map<String, dynamic> queries );

  @POST(AppApiConfig.addTodo)
  Future<TodoModel> addTodo(@Body() Map<String, dynamic> queries);

  @PATCH('${AppApiConfig.todoListApi}/{id}')
  Future<TodoModel> updateTodo(@Path('id') int todoId , @Body() Map<String, dynamic> queries);

  @DELETE('${AppApiConfig.todoListApi}/{id}')
  Future<TodoModel> deleteTodo(@Path('id') int todoId );

}
