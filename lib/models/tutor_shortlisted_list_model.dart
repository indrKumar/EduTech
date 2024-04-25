class Tutor {
  final int id;
  final String name;
  final List<String> teaches;
  final List<String> education;
  final String profilePic;

  Tutor({
    required this.id,
    required this.name,
    required this.teaches,
    required this.education,
    required this.profilePic,
  });

  factory Tutor.fromJson(Map<String, dynamic> json) {
    return Tutor(
      id: json['id'],
      name: json['name'],
      teaches: List<String>.from(json['teaches']),
      education: List<String>.from(json['education']),
      profilePic: json['profilePic']??'',
    );
  }
}
