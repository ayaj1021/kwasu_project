class GroupInfoResponse {
  final bool? status;
  final String? message;
  final List<GetGroupInfoData>? data;

  GroupInfoResponse({
    this.status,
    this.message,
    this.data,
  });

  GroupInfoResponse copyWith({
    bool? status,
    String? message,
    List<GetGroupInfoData>? data,
  }) =>
      GroupInfoResponse(
        status: status ?? this.status,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory GroupInfoResponse.fromJson(Map<String, dynamic> json) =>
      GroupInfoResponse(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<GetGroupInfoData>.from(
                json["data"]!.map((x) => GetGroupInfoData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class GetGroupInfoData {
  final String? id;
  final String? name;
  final DateTime? creationDate;
  final DateTime? endDate;
  final Mentor? primaryMentor;
  final List<Mentor>? additionalMentors;
  final Skill? skill;
  final List<Member>? members;

  GetGroupInfoData({
    this.id,
    this.name,
    this.creationDate,
    this.endDate,
    this.primaryMentor,
    this.additionalMentors,
    this.skill,
    this.members,
  });

  GetGroupInfoData copyWith({
    String? id,
    String? name,
    DateTime? creationDate,
    DateTime? endDate,
    Mentor? primaryMentor,
    List<Mentor>? additionalMentors,
    Skill? skill,
    List<Member>? members,
  }) =>
      GetGroupInfoData(
        id: id ?? this.id,
        name: name ?? this.name,
        creationDate: creationDate ?? this.creationDate,
        endDate: endDate ?? this.endDate,
        primaryMentor: primaryMentor ?? this.primaryMentor,
        additionalMentors: additionalMentors ?? this.additionalMentors,
        skill: skill ?? this.skill,
        members: members ?? this.members,
      );

  factory GetGroupInfoData.fromJson(Map<String, dynamic> json) =>
      GetGroupInfoData(
        id: json["id"],
        name: json["name"],
        creationDate: json["creation_date"] == null
            ? null
            : DateTime.parse(json["creation_date"]),
        endDate:
            json["end_date"] == null ? null : DateTime.parse(json["end_date"]),
        primaryMentor: json["primary_mentor"] == null
            ? null
            : Mentor.fromJson(json["primary_mentor"]),
        additionalMentors: json["additional_mentors"] == null
            ? []
            : List<Mentor>.from(
                json["additional_mentors"]!.map((x) => Mentor.fromJson(x))),
        skill: json["skill"] == null ? null : Skill.fromJson(json["skill"]),
        members: json["members"] == null
            ? []
            : List<Member>.from(
                json["members"]!.map((x) => Member.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "creation_date": creationDate?.toIso8601String(),
        "end_date": endDate?.toIso8601String(),
        "primary_mentor": primaryMentor?.toJson(),
        "additional_mentors": additionalMentors == null
            ? []
            : List<dynamic>.from(additionalMentors!.map((x) => x.toJson())),
        "skill": skill?.toJson(),
        "members": members == null
            ? []
            : List<dynamic>.from(members!.map((x) => x.toJson())),
      };
}

class Mentor {
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final dynamic matricNumber;

  Mentor({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.matricNumber,
  });

  Mentor copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? email,
    dynamic matricNumber,
  }) =>
      Mentor(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        matricNumber: matricNumber ?? this.matricNumber,
      );

  factory Mentor.fromJson(Map<String, dynamic> json) => Mentor(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        matricNumber: json["matric_number"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "matric_number": matricNumber,
      };
}

class Member {
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? matricNumber;

  Member({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.matricNumber,
  });

  Member copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? email,
    String? matricNumber,
  }) =>
      Member(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        matricNumber: matricNumber ?? this.matricNumber,
      );

  factory Member.fromJson(Map<String, dynamic> json) => Member(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        matricNumber: json["matric_number"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "matric_number": matricNumber,
      };
}

class Skill {
  final String? id;
  final String? code;
  final String? description;

  Skill({
    this.id,
    this.code,
    this.description,
  });

  Skill copyWith({
    String? id,
    String? code,
    String? description,
  }) =>
      Skill(
        id: id ?? this.id,
        code: code ?? this.code,
        description: description ?? this.description,
      );

  factory Skill.fromJson(Map<String, dynamic> json) => Skill(
        id: json["id"],
        code: json["code"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "code": code,
        "description": description,
      };
}
