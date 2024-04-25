class TeachingPreference {
  final int id;
  final String title;
  final List<Map<String, String>> catdata;

  TeachingPreference({
    required this.id,
    required this.title,
    required this.catdata,
  });

  factory TeachingPreference.fromJson(Map<String, dynamic> json) {
    return TeachingPreference(
      id: json['id'],
      title: json['title'],
      catdata: List<Map<String, String>>.from(json['catdata'].map((item) => Map<String, String>.from(item))),
    );
  }

  @override
  String toString() {
    return 'TeachingPreference(id: $id, title: $title, catdata: $catdata)';
  }
}
