class PackageAboutModel {
  final int id;
  final String name;
  final List<String> about;

  PackageAboutModel({
    required this.id,
    required this.name,
    required this.about,
  });

  factory PackageAboutModel.fromJson(Map<String, dynamic> json) {
    return PackageAboutModel(
      id: json['id'],
      name: json['name'],
      about: List<String>.from(json['about']),
    );
  }

  @override
  String toString() {
    return 'PackageAboutModel{id: $id, name: $name, about: $about}';
  }
}
