// class LoginResponse {
//   final bool? status;
//   final String? message;
//   final LoginData? data;

//   LoginResponse({
//     this.status,
//     this.message,
//     this.data,
//   });

//   LoginResponse copyWith({
//     bool? status,
//     String? message,
//     LoginData? data,
//   }) =>
//       LoginResponse(
//         status: status ?? this.status,
//         message: message ?? this.message,
//         data: data ?? this.data,
//       );

//   factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
//         status: json["status"],
//         message: json["message"],
//         data: json["data"] == null ? null : LoginData.fromJson(json["data"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "status": status,
//         "message": message,
//         "data": data?.toJson(),
//       };
// }

// class LoginData {
//   final String? refresh;
//   final String? access;
//   final String? id;
//   final String? email;
//   final String? role;
//   final dynamic matricNumber;

//   LoginData({
//     this.refresh,
//     this.access,
//     this.id,
//     this.email,
//     this.role,
//     this.matricNumber,
//   });

//   LoginData copyWith({
//     String? refresh,
//     String? access,
//     String? id,
//     String? email,
//     String? role,
//     dynamic matricNumber,
//   }) =>
//       LoginData(
//         refresh: refresh ?? this.refresh,
//         access: access ?? this.access,
//         id: id ?? this.id,
//         email: email ?? this.email,
//         role: role ?? this.role,
//         matricNumber: matricNumber ?? this.matricNumber,
//       );

//   factory LoginData.fromJson(Map<String, dynamic> json) => LoginData(
//         refresh: json["refresh"],
//         access: json["access"],
//         id: json["id"],
//         email: json["email"],
//         role: json["role"],
//         matricNumber: json["matric_number"],
//       );

//   Map<String, dynamic> toJson() => {
//         "refresh": refresh,
//         "access": access,
//         "id": id,
//         "email": email,
//         "role": role,
//         "matric_number": matricNumber,
//       };
// }

// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

class LoginResponse {
  final Data? data;

  LoginResponse({
    this.data,
  });

  LoginResponse copyWith({
    Data? data,
  }) =>
      LoginResponse(
        data: data ?? this.data,
      );

  factory LoginResponse.fromMap(Map<String, dynamic> json) => LoginResponse(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
      };
}

class Data {
  final String? refresh;
  final String? access;
  final String? id;
  final String? email;
  final String? role;
  final dynamic matricNumber;

  Data({
    this.refresh,
    this.access,
    this.id,
    this.email,
    this.role,
    this.matricNumber,
  });

  Data copyWith({
    String? refresh,
    String? access,
    String? id,
    String? email,
    String? role,
    dynamic matricNumber,
  }) =>
      Data(
        refresh: refresh ?? this.refresh,
        access: access ?? this.access,
        id: id ?? this.id,
        email: email ?? this.email,
        role: role ?? this.role,
        matricNumber: matricNumber ?? this.matricNumber,
      );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
