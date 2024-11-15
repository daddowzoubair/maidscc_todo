
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/service_locator/service_locator.dart';
import '../../data/entities/todo_list/todo_list_model.dart';
import '../../data/repositories/todos_repository.dart';
import 'todos_event.dart';
import 'todos_state.dart';

@lazySingleton
class TodosBloc extends Bloc<TodosEvent, TodosState> {
  final TodosRepository todosRepository = getIt<TodosRepository>();

  final List<TodoModel> _todos = [];
  int _total = 0;

  TodosBloc() : super(const TodosInitial([], 0)) {
    on<FetchTodoListEvent>(_fetchTodoList);
    on<DeleteTodoEvent>(_deleteTodo);
    on<UpdateTodoEvent>(_updateTodo);
    on<AddTodoEvent>(_addTodo);
    on<FetchMyTodoListEvent>(_fetchMyTodoList);
  }

  List<TodoModel> get todos => List.unmodifiable(_todos);
  int get total => _total;

  Future<void> _fetchTodoList(FetchTodoListEvent event, Emitter<TodosState> emit) async {
    emit(TodosLoading(_todos, _total));
    try {
      final response = await todosRepository.todoList(skip: event.skip, limit: event.limit);
      if (_isValidResponse(response)) {
        _todos.clear();
        _todos.addAll(response.todos);
        _total = response.total;
        emit(TodosSuccess(todos, _total));
      } else {
        emit(TodosFailure(todos, _total, response.message));
      }
    } catch (error, stackTrace) {
      emit(TodosFailure(todos, _total, '$error\n$stackTrace'));
    }
  }

  Future<void> _addTodo(AddTodoEvent event, Emitter<TodosState> emit) async {
    emit(TodosLoading(_todos, _total));
    try {
      final response = await todosRepository.addTodo(
        todo: event.title,
        isCompleted: event.completed,
      );
      if (_isValidResponse(response)) {
        _todos.insert(0, response);
        _total++;
        emit(AddTodoSuccess(todos, _total));
      } else {
        emit(TodosFailure(todos, _total, response.message));
      }
    } catch (error, stackTrace) {
      emit(TodosFailure(todos, _total, '$error\n$stackTrace'));
    }
  }

  Future<void> _updateTodo(UpdateTodoEvent event, Emitter<TodosState> emit) async {
    emit(TodosLoading(_todos, _total));
    try {
      final response = await todosRepository.updateTodo(
        todoId: event.todoId,
        todo: event.title,
        isCompleted: event.completed,
      );
      if (_isValidResponse(response)) {
        final index = _todos.indexWhere((element) => element.id == event.todoId);
        if (index != -1) {
          _todos[index] = response;
          emit(UpdateTodoSuccess(todos, _total));
        } else {
          emit(TodosFailure(todos, _total, "Todo not found"));
        }
      } else {
        emit(TodosFailure(todos, _total, response.message));
      }
    } catch (error, stackTrace) {
      emit(TodosFailure(todos, _total, '$error\n$stackTrace'));
    }
  }

  Future<void> _deleteTodo(DeleteTodoEvent event, Emitter<TodosState> emit) async {
    emit(TodosLoading(_todos, _total));
    try {
      final response = await todosRepository.deleteTodo(todoId: event.todoId);
      if (_isValidResponse(response)) {
        _todos.removeWhere((element) => element.id == event.todoId);
        _total--;
        emit(DeleteTodoSuccess(todos, _total));
      } else {
        emit(TodosFailure(todos, _total, response.message));
      }
    } catch (error, stackTrace) {
      emit(TodosFailure(todos, _total, '$error\n$stackTrace'));
    }
  }

  Future<void> _fetchMyTodoList(FetchMyTodoListEvent event, Emitter<TodosState> emit) async {
    emit(TodosLoading(_todos, _total));
    try {
      final response = await todosRepository.userTodoList(skip: event.skip, limit: event.limit);
      if (_isValidResponse(response)) {
        _todos.clear();
        _todos.addAll(response.todos);
        _total = response.total;
        emit(TodosSuccess(todos, _total));
      } else {
        emit(TodosFailure(todos, _total, response.message));
      }
    } catch (error, stackTrace) {
      emit(TodosFailure(todos, _total, '$error\n$stackTrace'));
    }
  }

  // Helper to validate the response
bool _isValidResponse(response) => response.message?.isEmpty ?? true;}