class AppConstants {
  static const String baseUrl = 'https://vte.onrender.com/api';
  static const String register = '$baseUrl/core/register/';
  static const String login = '$baseUrl/core/token/';
  static String getUserDetails(String id) => '$baseUrl/core/students/$id';
}
