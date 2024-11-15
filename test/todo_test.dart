import 'package:flutter_test/flutter_test.dart';
import 'package:maidscc_todos/features/authentication/data/entities/user_info/user_info_model.dart';
import 'package:maidscc_todos/features/todos/data/data_source/local/todos_local_data_source.dart';
import 'package:maidscc_todos/features/todos/data/data_source/remote/todos_remote_data_source.dart';
import 'package:maidscc_todos/features/todos/data/entities/todo_list/todo_list_model.dart';
import 'package:maidscc_todos/features/todos/data/repositories/authentication_reporsitory_imp.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';


// Generate mocks with nice stubs
import 'todo_test.mocks.dart';
@GenerateNiceMocks([
  MockSpec<TodosRemoteDataSource>(),
  MockSpec<TodosLocalDataSource>(),
])

void main() {
  late TodosRepositoryImp todosRepository;
  late MockTodosRemoteDataSource mockRemoteDataSource;
  late MockTodosLocalDataSource mockLocalDataSource;

  setUp(() {
    mockRemoteDataSource = MockTodosRemoteDataSource();
    mockLocalDataSource = MockTodosLocalDataSource();
    todosRepository = TodosRepositoryImp(
      mockRemoteDataSource,
      mockLocalDataSource,
    );
  });

  group('todoList', () {
    const todoListModel = TodoListModel(todos: []);

    test('should fetch todo list from remote data source', () async {
      // Arrange
      when(mockRemoteDataSource.todoList(skip: 0, limit: 10))
          .thenAnswer((_) async => todoListModel);

      // Act
      final result = await todosRepository.todoList(skip: 0, limit: 10);

      // Assert
      expect(result, todoListModel);
      verify(mockRemoteDataSource.todoList(skip: 0, limit: 10)).called(1);
    });
  });

  group('todoDetails', () {
    const todoModel = TodoModel(id: 1, todo: 'Test Todo', completed: false);

    test('should fetch todo details from remote data source', () async {
      // Arrange
      when(mockRemoteDataSource.todoDetails(id: 1))
          .thenAnswer((_) async => todoModel);

      // Act
      final result = await todosRepository.todoDetails(id: 1);

      // Assert
      expect(result, todoModel);
      verify(mockRemoteDataSource.todoDetails(id: 1)).called(1);
    });
  });

  group('userTodoList', () {
    const userTodoList = TodoListModel(todos: []);
    const userId = 123;

    test('should fetch user-specific todo list from remote data source', () async {
      // Arrange
      when(mockLocalDataSource.userInfo).thenReturn(const UserInfoModel(id: userId));
      when(mockRemoteDataSource.userTodoList(userId: userId, skip: 0, limit: 10))
          .thenAnswer((_) async => userTodoList);

      // Act
      final result = await todosRepository.userTodoList(skip: 0, limit: 10);

      // Assert
      expect(result, userTodoList);
      verify(mockLocalDataSource.userInfo).called(1);
      verify(mockRemoteDataSource.userTodoList(userId: userId, skip: 0, limit: 10)).called(1);
    });
  });

  group('addTodo', () {
    const newTodo = TodoModel(id: 2, todo: 'New Todo', completed: false);
    const userId = 123;

    test('should add a new todo using the remote data source', () async {
      // Arrange
      when(mockLocalDataSource.userInfo).thenReturn(const UserInfoModel(id: userId));
      when(mockRemoteDataSource.addTodo(
        todo: 'New Todo',
        userId: userId,
        isCompleted: false,
      )).thenAnswer((_) async => newTodo);

      // Act
      final result = await todosRepository.addTodo(
        todo: 'New Todo',
        isCompleted: false,
      );

      // Assert
      expect(result, newTodo);
      verify(mockLocalDataSource.userInfo).called(1);
      verify(mockRemoteDataSource.addTodo(
        todo: 'New Todo',
        userId: userId,
        isCompleted: false,
      )).called(1);
    });
  });

  group('deleteTodo', () {
    const deletedTodo = TodoModel(id: 1, todo: 'Deleted Todo', completed: false);

    test('should delete a todo using the remote data source', () async {
      // Arrange
      when(mockRemoteDataSource.deleteTodo(todoId: 1))
          .thenAnswer((_) async => deletedTodo);

      // Act
      final result = await todosRepository.deleteTodo(todoId: 1);

      // Assert
      expect(result, deletedTodo);
      verify(mockRemoteDataSource.deleteTodo(todoId: 1)).called(1);
    });
  });

  group('updateTodo', () {
    const updatedTodo = TodoModel(id: 1, todo: 'Updated Todo', completed: true);

    test('should update a todo using the remote data source', () async {
      // Arrange
      when(mockRemoteDataSource.updateTodo(
        todoId: 1,
        todo: 'Updated Todo',
        isCompleted: true,
      )).thenAnswer((_) async => updatedTodo);

      // Act
      final result = await todosRepository.updateTodo(
        todoId: 1,
        todo: 'Updated Todo',
        isCompleted: true,
      );

      // Assert
      expect(result, updatedTodo);
      verify(mockRemoteDataSource.updateTodo(
        todoId: 1,
        todo: 'Updated Todo',
        isCompleted: true,
      )).called(1);
    });
  });
}