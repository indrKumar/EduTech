class EduQualification {
  final int id;
  final String name;
  final String medium;
  final double percentage;

  EduQualification({
    required this.id,
    required this.name,
    required this.medium,
    required this.percentage,
  });

  factory EduQualification.fromJson(Map<String, dynamic> json) {
    return EduQualification(
      id: json['id'],

      name: json['name'],
      medium: json['Medium'], // Use 'Medium' here to match the JSON key
      percentage: json['Percentage'], // Use 'Percentage' here to match the JSON key
    );
  }

  @override
  String toString() {
    return '{id: $id, name: $name, medium: $medium, percentage: $percentage}';
  }
}
