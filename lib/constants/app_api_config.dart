// AppApiConfig holds API endpoints, parameters, and configuration values for the app's API interactions.
abstract class AppApiConfig {

  static const baseUrl = 'https://dummyjson.com/';
  
  static const refreshTokenApi = 'auth/refresh';

  static const loginApi = 'auth/login';

  static const userInfoApi = '/auth/me';

  static const todoListApi = '/todos';

  static const userTodoList = '/todos/user';

  static const addTodo = '/todos/add';

  static const tokenExpiresInMins = 30;

  static const userNameLoginApiParameter = 'username';

  static const passwordLoginApiParameter = 'password';

  static const refreshTokenRefreshTokenParameter = 'refreshToken';

  static const expiresInMinsRefreshTokenParameter = 'expiresInMins';

  static const todoListSkipParameter = 'skip';

  static const todoListLimitParameter = 'limit';

  static const addTodoTitleParameter = 'todo';

  static const addTodoUserIdParameter = 'userId';

  static const addTodoCompletedParameter = 'completed';

}
