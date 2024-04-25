class SubCategory {
  final int id;
  final String name;
  final String? logo;
  final String type;
  final bool? containSubcategory;

  SubCategory({
    required this.id,
    required this.name,
    this.logo,
    required this.type,
    this.containSubcategory,
  });

  factory SubCategory.fromJson(Map<String, dynamic> json) {
    return SubCategory(
      id: json['id']??'',
      name: json['name']??'',
      type: json['title']??'', // Changed from 'title' to 'type'
      logo: json["logo"]??'',
      containSubcategory: json['contain_subcategory'] ?? false,
    );
  }

  @override
  String toString() {
    return '{id: $id, name: $name, type: $type, containSubcategory: $containSubcategory, logo: $logo}';
  }
}
