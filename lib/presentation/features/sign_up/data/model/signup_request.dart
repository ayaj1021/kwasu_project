class SignupRequest {
  final String username;
  final String email;
  final String password;
  final String password2;
  final String firstName;
  final String lastName;
  final String matricNumber;
  final String level;
  final String role;

  SignupRequest({
    required this.username,
    required this.email,
    required this.password,
    required this.password2,
    required this.firstName,
    required this.lastName,
    required this.matricNumber,
    required this.level,
    required this.role,
  });

  SignupRequest copyWith({
    String? username,
    String? email,
    String? password,
    String? password2,
    String? firstName,
    String? lastName,
    String? matricNumber,
    String? level,
    String? role,
  }) =>
      SignupRequest(
        username: username ?? this.username,
        email: email ?? this.email,
        password: password ?? this.password,
        password2: password2 ?? this.password2,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        matricNumber: matricNumber ?? this.matricNumber,
        level: level ?? this.level,
        role: role ?? this.role,
      );

  factory SignupRequest.fromJson(Map<String, dynamic> json) => SignupRequest(
        username: json["username"],
        email: json["email"],
        password: json["password"],
        password2: json["password2"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        matricNumber: json["matric_number"],
        level: json["level"],
        role: json["role"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "email": email,
        "password": password,
        "password2": password2,
        "first_name": firstName,
        "last_name": lastName,
        "matric_number": matricNumber,
        "level": level,
        "role": role,
      };
}
