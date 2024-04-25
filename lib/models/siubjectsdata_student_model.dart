// Define the CatData model
class CatData {
  final String title;
  final String name;

  CatData({
    required this.title,
    required this.name,
  });

  factory CatData.fromJson(Map<String, dynamic> json) {
    return CatData(
      title: json['title'] ?? '',
      name: json['name'] ?? '',
    );
  }
}

// Define the Student model
class Student {
  final int id;
  final String name;
  final List<String> subjects;
  final List<CatData> catData;

  Student({
    required this.id,
    required this.name,
    required this.subjects,
    required this.catData,
  });

  factory Student.fromJson(Map<String, dynamic> json) {
    List<dynamic> catDataList = json['catdata'] ?? [];
    List<CatData> catData = catDataList.map((cat) => CatData.fromJson(cat)).toList();

    return Student(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      subjects: List<String>.from(json['subjects'] ?? []),
      catData: catData,
    );
  }
}

// Define the StudentModel model
class StudentModel {
  final bool isError;
  final String message;
  final List<Student> students;

  StudentModel({
    required this.isError,
    required this.message,
    required this.students,
  });

  factory StudentModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> studentList = json['students'] ?? [];
    List<Student> students = studentList.map((student) => Student.fromJson(student)).toList();

    return StudentModel(
      isError: json['is_error'] ?? false,
      message: json['message'] ?? '',
      students: students,
    );
  }
}
