class ExperienceList {
  final int id;
  final String? designation;
  final String? type;
  final String? duration;
  final String? startYear;
  final String? endYear;
  final String? classes;
  final String? subjects;
  final bool? working;
  final String? board;

  ExperienceList({
    required this.id,
    this.designation,
    this.type,
    this.duration,
    this.startYear,
    this.endYear,
    this.classes,
    this.subjects,
    this.working,
    this.board,
  });

  factory ExperienceList.fromJson(Map<String, dynamic> json) {
    return ExperienceList(
      id: json['id'],
      designation: json['designation'],
      type: json['type'],
      duration: json['duration']??'',
      startYear: json['start_year'] != null ? json['start_year'].toString() : null,
      endYear: json['end_year'] != null ? json['end_year'].toString() : null,
      classes: json['classes'],
      subjects: json['subjects'],
      working: json['working'],
      board: json['board'],
    );
  }

  @override
  String toString() {
    return '{id: $id, designation: $designation, type: $type, duration: $duration, startYear: $startYear, endYear: $endYear, classes: $classes, subjects: $subjects, working: $working, board: $board}';
  }
}
