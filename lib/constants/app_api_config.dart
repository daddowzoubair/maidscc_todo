abstract class AppApiConfig {

  static const baseUrl = 'https://dummyjson.com/';
  
  static const refreshTokenApi = 'auth/refresh';

  static const loginApi = 'auth/login';

  static const userInfoApi = '/auth/me';

  static const tokenExpiresInMins = 30;

  static const userNameLoginApiParameter = 'username';

  static const passwordLoginApiParameter = 'password';

  static const refreshTokenRefreshTokenParameter = 'refreshToken';

  static const expiresInMinsRefreshTokenParameter = 'expiresInMins';


}
