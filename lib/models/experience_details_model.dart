class TeachingExperience {
  final int id;
  final String type;
  final String name;
  final String designation;
  final String duration;
  final bool working;
  final String classes;
  final String board;
  final String subjects;
  final String about;
  final String? startYear; // Change to nullable int
  final String? endYear; // Change to nullable int

  TeachingExperience({
    required this.id,
    required this.type,
    required this.name,
    required this.designation,
    required this.duration,
    required this.working,
    required this.classes,
    required this.board,
    required this.subjects,
    required this.about,
    this.startYear, // Nullable int
    this.endYear, // Nullable int
  });

  factory TeachingExperience.fromJson(Map<String, dynamic> json) {
    return TeachingExperience(
      id: json['id'] ?? 0,
      type: json['type'] ?? '',
      name: json['name'] ?? '',
      designation: json['designation'] ?? '',
      duration: json['duration'] ?? '',
      working: json['working'] ?? false,
      classes: json['classes'] ?? '',
      board: json['board'] ?? '',
      subjects: json['subjects'] ?? '',
      about: json['about'] ?? '',
      startYear: json['start_year']??'', // Nullable int
      endYear: json['end_year']??'', // Nullable int
    );
  }
  @override
  String toString() {
    return 'TeachingExperience{id: $id, type: $type, name: $name, designation: $designation, duration: $duration, working: $working, classes: $classes, board: $board, subjects: $subjects, about: $about, startYear: $startYear, endYear: $endYear}';
  }
}