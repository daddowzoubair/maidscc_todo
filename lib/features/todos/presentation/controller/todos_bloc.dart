
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/service_locator/service_locator.dart';
import '../../data/entities/todo_list/todo_list_model.dart';
import '../../data/repositories/todos_repository.dart';
import 'todos_event.dart';
import 'todos_state.dart';
@lazySingleton
class TodosBloc extends Bloc<TodosEvent, TodosState> {
  // Injecting the TodosRepository using the service locator.
  final TodosRepository todosRepository = getIt<TodosRepository>();

  // Private variables to hold todo list and total count.
  final List<TodoModel> _todos = [];
  int _total = 0;

  // Constructor that initializes the event handlers for different Todo events.
  TodosBloc() : super(const TodosInitial([], 0)) {
    on<FetchTodoListEvent>(_fetchTodoList);
    on<DeleteTodoEvent>(_deleteTodo);
    on<UpdateTodoEvent>(_updateTodo);
    on<AddTodoEvent>(_addTodo);
    on<FetchMyTodoListEvent>(_fetchMyTodoList);
  }

  // Exposes the todos list and total count publicly as unmodifiable.
  List<TodoModel> get todos => List.unmodifiable(_todos);
  int get total => _total;

  // Fetches the list of todos and emits the appropriate state based on the result.
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

  // Adds a new todo item and emits success or failure based on the result.
  Future<void> _addTodo(AddTodoEvent event, Emitter<TodosState> emit) async {
    emit(TodosLoading(_todos, _total));
    try {
      final response = await todosRepository.addTodo(
        todo: event.title,
        isCompleted: event.completed,
      );
      if (_isValidResponse(response)) {
        _todos.insert(0, response); // Insert the new todo at the beginning of the list
        _total++;
        emit(AddTodoSuccess(todos, _total));
      } else {
        emit(TodosFailure(todos, _total, response.message));
      }
    } catch (error, stackTrace) {
      emit(TodosFailure(todos, _total, '$error\n$stackTrace'));
    }
  }

  // Updates an existing todo item and emits success or failure.
  Future<void> _updateTodo(UpdateTodoEvent event, Emitter<TodosState> emit) async {
    emit(TodosLoading(_todos, _total));
    try {
      final response = await todosRepository.updateTodo(
        todoId: event.todoId,
        todo: event.title,
        isCompleted: event.completed,
      );
      if (_isValidResponse(response)) {
        // Find the index of the todo item to update and replace it
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

  // Deletes a todo item and emits success or failure based on the result.
  Future<void> _deleteTodo(DeleteTodoEvent event, Emitter<TodosState> emit) async {
    emit(TodosLoading(_todos, _total));
    try {
      final response = await todosRepository.deleteTodo(todoId: event.todoId);
      if (_isValidResponse(response)) {
        // Remove the deleted todo from the list and update total
        _todos.removeWhere((element) => element.id == event.todoId);
        _total--;
        emit(DeleteTodoSuccess(todos, _total));
      } else {
        emit(TodosFailure(todos, _total, response.message));
      }
    } catch (error, stackTrace) {
      // Emit failure state with error details in case of an exception.
      emit(TodosFailure(todos, _total, '$error\n$stackTrace'));
    }
  }

  // Fetches todos specific to the signed-in user and emits the appropriate state.
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

  // Helper method to validate the response and check if there is a valid message.
  bool _isValidResponse(response) => response.message?.isEmpty ?? true;
}