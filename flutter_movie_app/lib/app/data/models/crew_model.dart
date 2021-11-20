class CrewModel {
  late int? id;
  late String? job;
  late int? gender;
  late String name;
  late String creditId;
  late String department;
  late String profilePath;

  CrewModel({
    this.id,
    this.job,
    this.gender,
    required this.name,
    required this.creditId,
    required this.department,
    required this.profilePath,
  });

  factory CrewModel.fromJson(Map<String, dynamic> json) => CrewModel(
    id: json['id'],
    job: json['job'],
    gender: json['gender'],
    name:  json['name'] ?? '',
    creditId: json['credit_id'] ?? '',
    department:  json['department'] ?? '',
    profilePath:  json['profile_path'] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "id" : id,
    "job" : job,
    "name" : name,
    "gender" : gender,
    "credit_id" : creditId,
    "department" : department,
    "profile_path" : profilePath,
  };
}
