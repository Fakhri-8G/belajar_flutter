class ApiConstants {
  static const String baseUrl = 'https://jsonplaceholder.typicode.com';
  static const String postsEndpoint = '/posts';
  static const String commentsEndpoint = '/comments';
}

class ApiConstant {
  // Android emulator : 10.0.2.2
  // iOS simulator    : 127.0.0.1
  // HP asli          : IP laptop kamu (contoh 192.168.1.10)
  // Flutter Web      : localhost
  static const String baseUrl = 'http://192.168.43.60:8000/api';
  static const String register = '$baseUrl/register';
  static const String login = '$baseUrl/login';
  static const String logout = '$baseUrl/logout';
  static const String user = '$baseUrl/user';
  static const String articles = '$baseUrl/articles';
}