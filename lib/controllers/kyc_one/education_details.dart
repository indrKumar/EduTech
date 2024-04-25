class EduQualificationDetails {
  final int id;
  final String name;
  final String medium;
  final double percentage;
  final String board;
  final bool studying;
  final int completedYear;
  final String institutionName;
  final String marksheet;

  EduQualificationDetails({
    required this.id,
    required this.name,
    required this.medium,
    required this.percentage,
    required this.board,
    required this.studying,
    required this.completedYear,
    required this.institutionName,
    required this.marksheet,
  });

  factory EduQualificationDetails.fromJson(Map<String, dynamic> json) {
    return EduQualificationDetails(
      id: json['id'],
      name: json['Qname'], // Use 'Qname' here to match the JSON key
      medium: json['medium'], // Use 'medium' here to match the JSON key
      percentage: json['percentage']?.toDouble() ?? 0.0, // Ensure percentage is converted to double
      board: json['board'],
      studying: json['studying'] ?? false,
      completedYear: json['completedYear'] ?? 0,
      institutionName: json['institutionName'],
      marksheet: json['marksheet'] ?? '',
    );
  }

  @override
  String toString() {
    return '{id: $id, name: $name, medium: $medium, percentage: $percentage, board: $board, studying: $studying, completedYear: $completedYear, institutionName: $institutionName, marksheet: $marksheet}';
  }
}