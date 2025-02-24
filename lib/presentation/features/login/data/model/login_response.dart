class LoginResponse {
  final String? refresh;
  final String? access;
  final String? id;
  final String? email;
  final String? role;
  final dynamic matricNumber;

  LoginResponse({
    this.refresh,
    this.access,
    this.id,
    this.email,
    this.role,
    this.matricNumber,
  });

  LoginResponse copyWith({
    String? refresh,
    String? access,
    String? id,
    String? email,
    String? role,
    dynamic matricNumber,
  }) =>
      LoginResponse(
        refresh: refresh ?? this.refresh,
        access: access ?? this.access,
        id: id ?? this.id,
        email: email ?? this.email,
        role: role ?? this.role,
        matricNumber: matricNumber ?? this.matricNumber,
      );

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        refresh: json["refresh"],
        access: json["access"],
        id: json["id"],
        email: json["email"],
        role: json["role"],
        matricNumber: json["matric_number"],
      );

  Map<String, dynamic> toJson() => {
        "refresh": refresh,
        "access": access,
        "id": id,
        "email": email,
        "role": role,
        "matric_number": matricNumber,
      };
}
