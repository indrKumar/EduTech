// profile_model.dart
class Profile {
  final bool isError;
  final String message;
  final ProfileData data;

  Profile({
    required this.isError,
    required this.message,
    required this.data,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      isError: json['is_error'] ?? false,
      message: json['message'] ?? '',
      data: ProfileData.fromJson(json['data'] ?? {}),
    );
  }
}

class ProfileData {
  final int id;
  final String name;
  final String? profilePic;
  final int age;
  final bool verified;
  final int stars;
  final String description;
  final List<String> teachingExperience;
  final List<String> professionalExperience;
  final String about;
  final List<String> teaches;
  final List<String> boards;
  final List<String> grade;
  final List<String> education;
  final bool vehicle;
  final String englishFluency;
  final String level;

  ProfileData({
    required this.id,
    required this.name,
    this.profilePic,
    required this.age,
    required this.verified,
    required this.stars,
    required this.description,
    required this.teachingExperience,
    required this.professionalExperience,
    required this.about,
    required this.teaches,
    required this.boards,
    required this.grade,
    required this.education,
    required this.vehicle,
    required this.englishFluency,
    required this.level,
  });

  factory ProfileData.fromJson(Map<String, dynamic> json) {
    return ProfileData(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      profilePic: json['profilePic'],
      age: json['age'] ?? 0,
      verified: json['verified'] ?? false,
      stars: json['stars'] ?? 0,
      description: json['description'] ?? '',
      teachingExperience: List<String>.from(json['teaching_experience'] ?? []),
      professionalExperience: List<String>.from(json['professional_experience'] ?? []),
      about: json['about'] ?? '',
      teaches: List<String>.from(json['teaches'] ?? []),
      boards: List<String>.from(json['boards'] ?? []),
      grade: List<String>.from(json['grade'] ?? []),
      education: List<String>.from(json['education'] ?? []),
      vehicle: json['vehicle'] ?? false,
      englishFluency: json['english_fluency'] ?? '',
      level: json['level'] ?? '',
    );
  }
}
