class AppliedCategory {
  final int id;
  final bool status ;
  final String name;

  AppliedCategory({
    required this.id,
    required this.status,
    required this.name,
  });

  factory AppliedCategory.fromJson(Map<String, dynamic> json) {
    return AppliedCategory(
      id: json['id'],
      name: json['name'],
      status: json['status']??false,
    );
  }
}
