class TutorClass {
  final int id;
  final String? name;
  final String? state;
  final String? city;
  final String? location;
  final String? parent;
  final String? tutor;
  final String? badge;
  final String? type;
  final String? startTime;
  final String? endTime;
  final String? mode;
  var days;
  final int? hour;
  final String? status;
  final String? createdOn;

  // final List<StudentData> studentData;

  TutorClass({
    required this.id,
    this.name,
    this.state,
    this.city,
    this.location,
    this.parent,
    this.tutor,
    this.badge,
    this.type,
    this.startTime,
    this.endTime,
    this.mode,
    this.days,
    this.hour,
    this.status,
    this.createdOn,
    // required this.studentData,
  });

  factory TutorClass.fromJson(Map<String, dynamic> json) {
    return TutorClass(
      id: json['id'],
      name: json['name']??'',
      state: json['state']??'',
      city: json['city']??'',
      location: json['location']??'',
      parent: json['parent']??'',
      tutor: json['tutor']??'',
      badge: json['badge']??'',
      type: json['type']??'',
      startTime: json['start_time']??'',
      endTime: json['end_time']??'',
      mode: json['mode']??'',
      status: json['status']??'',
      days: json["days"]??'',
      hour: json["hour"] ?? 0,
      createdOn: json['Created_ON']??'',
      //   studentData: (json['student_data'])
      //       .map((data) => StudentData.fromJson(data))
      //       .toList(),
    );
  }
}

// class StudentData {
//   final String? name;
//   final List<Subject>? subjects;
//
//   StudentData({this.name,this.subjects});
//
//   factory StudentData.fromJson(Map<String, dynamic> json) {
//     return StudentData(
//       name: json['name']??'',
//       subjects: (json['subject']??{})
//           .map((subject) => Subject.fromJson(subject))
//           .toList(),
//     );
//   }
// }
//
// class Subject {
//   final String? title;
//   final String? name;
//
//   Subject({ this.title, this.name});
//
//   factory Subject.fromJson(Map<String, dynamic> json) {
//     return Subject(
//       title: json['title']??'',
//       name: json['name']??'',
//     );
//   }
// }
