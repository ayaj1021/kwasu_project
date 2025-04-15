class GetAllSkillsResponse {
  final List<GetAllSkillsData>? getAllSkillsData;

  GetAllSkillsResponse({
    this.getAllSkillsData,
  });

  GetAllSkillsResponse copyWith({
    List<GetAllSkillsData>? getAllSkillsData,
  }) =>
      GetAllSkillsResponse(
        getAllSkillsData: getAllSkillsData ?? this.getAllSkillsData,
      );

  factory GetAllSkillsResponse.fromJson(Map<String, dynamic> json) =>
      GetAllSkillsResponse(
        getAllSkillsData: json["data"] == null
            ? []
            : List<GetAllSkillsData>.from(
                json["data"]!.map((x) => GetAllSkillsData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": getAllSkillsData == null
            ? []
            : List<dynamic>.from(getAllSkillsData!.map((x) => x.toJson())),
      };
}

class GetAllSkillsData {
  final String? id;
  final String? code;
  final String? title;
  final String? description;
  final String? price;
  final DateTime? enrollmentDeadline;
  final List<AvailableLevel>? availableLevels;
  final int? capacity;
  final int? currentCapacity;

  GetAllSkillsData({
    this.id,
    this.code,
    this.title,
    this.description,
    this.price,
    this.enrollmentDeadline,
    this.availableLevels,
    this.capacity,
    this.currentCapacity,
  });

  GetAllSkillsData copyWith({
    String? id,
    String? code,
    String? title,
    String? description,
    String? price,
    DateTime? enrollmentDeadline,
    List<AvailableLevel>? availableLevels,
    int? capacity,
    int? currentCapacity,
  }) =>
      GetAllSkillsData(
        id: id ?? this.id,
        code: code ?? this.code,
        title: title ?? this.title,
        description: description ?? this.description,
        price: price ?? this.price,
        enrollmentDeadline: enrollmentDeadline ?? this.enrollmentDeadline,
        availableLevels: availableLevels ?? this.availableLevels,
        capacity: capacity ?? this.capacity,
        currentCapacity: currentCapacity ?? this.currentCapacity,
      );

  factory GetAllSkillsData.fromJson(Map<String, dynamic> json) =>
      GetAllSkillsData(
        id: json["id"],
        code: json["code"],
        title: json["title"],
        description: json["description"],
        price: json["price"],
        enrollmentDeadline: json["enrollment_deadline"] == null
            ? null
            : DateTime.parse(json["enrollment_deadline"]),
        availableLevels: json["available_levels"] == null
            ? []
            : List<AvailableLevel>.from(json["available_levels"]!
                .map((x) => AvailableLevel.fromJson(x))),
        capacity: json["capacity"],
        currentCapacity: json["current_capacity"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "code": code,
        "title": title,
        "description": description,
        "price": price,
        "enrollment_deadline": enrollmentDeadline?.toIso8601String(),
        "available_levels": availableLevels == null
            ? []
            : List<dynamic>.from(availableLevels!.map((x) => x.toJson())),
        "capacity": capacity,
        "current_capacity": currentCapacity,
      };
}

class AvailableLevel {
  final String? level;

  AvailableLevel({
    this.level,
  });

  AvailableLevel copyWith({
    String? level,
  }) =>
      AvailableLevel(
        level: level ?? this.level,
      );

  factory AvailableLevel.fromJson(Map<String, dynamic> json) => AvailableLevel(
        level: json["level"],
      );

  Map<String, dynamic> toJson() => {
        "level": level,
      };
}
