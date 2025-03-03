class UserDetialsResponse {
  final UserDetailsData? data;

  UserDetialsResponse({
    this.data,
  });

  UserDetialsResponse copyWith({
    UserDetailsData? data,
  }) =>
      UserDetialsResponse(
        data: data ?? this.data,
      );

  factory UserDetialsResponse.fromJson(Map<String, dynamic> json) =>
      UserDetialsResponse(
        data: json["data"] == null
            ? null
            : UserDetailsData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
      };
}

class UserDetailsData {
  final String? id;
  final String? username;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? matricNumber;
  final String? level;
  final String? role;

  UserDetailsData({
    this.id,
    this.username,
    this.email,
    this.firstName,
    this.lastName,
    this.matricNumber,
    this.level,
    this.role,
  });

  UserDetailsData copyWith({
    String? id,
    String? username,
    String? email,
    String? firstName,
    String? lastName,
    String? matricNumber,
    String? level,
    String? role,
  }) =>
      UserDetailsData(
        id: id ?? this.id,
        username: username ?? this.username,
        email: email ?? this.email,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        matricNumber: matricNumber ?? this.matricNumber,
        level: level ?? this.level,
        role: role ?? this.role,
      );

  factory UserDetailsData.fromJson(Map<String, dynamic> json) =>
      UserDetailsData(
        id: json["id"],
        username: json["username"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        matricNumber: json["matric_number"],
        level: json["level"],
        role: json["role"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "matric_number": matricNumber,
        "level": level,
        "role": role,
      };
}
