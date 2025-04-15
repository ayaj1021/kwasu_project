class AppConstants {
  static const String baseUrl = 'https://vte.onrender.com/api';
  static const String register = '$baseUrl/core/register/';
  static const String login = '$baseUrl/core/token/';
  static const String getSkills = '$baseUrl/skills/';
  static String getGroupInfo(String id) => '$baseUrl/group/student/$id/';
  static const String paystackCheckout = '$baseUrl/payments/initiate/';
  static String getUserDetails(String id) => '$baseUrl/core/students/$id';
}
