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
  final int? numberOfSession;
  final List? days;
  final int? sessionPerMonth;
  final int? hours;
  final int? duration;
  final String? mode;
  final String? start_date;
  final String? status;
  final String? createdOn;
  final List<StudentData>? studentData;

  TutorClass({
    required this.id,
    this.name,
    this.start_date,
    this.state,
    this.city,
    this.location,
    this.parent,
    this.tutor,
    this.badge,
    this.type,
    this.startTime,
    this.endTime,
    this.numberOfSession,
    this.days,
    this.sessionPerMonth,
    this.hours,
    this.duration,
    this.mode,
    this.status,
    this.createdOn,
    this.studentData,
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
      numberOfSession: json['number_of_session'],
      days: json['days']??[],
      sessionPerMonth: json['session_per_month'],
      hours: json['hours'],
      duration: json['duration'],
      mode: json['mode'],
      status: json['status'],
      createdOn: json['Created_ON'],
      start_date: json['start_date'],
      studentData: (json['student_data'] as List<dynamic>?)
          ?.map((data) => StudentData.fromJson(data))
          .toList(),
    );
  }
}


class StudentData {
  final int id;
  final String? name;
  final List<Subject>? subjects;

  StudentData({
    required this.id,
    this.name,
    this.subjects,
  });

  factory StudentData.fromJson(Map<String, dynamic> json) {
    return StudentData(
      id: json['id'],
      name: json['name'],
      subjects: (json['subject'] as List<dynamic>?)
          ?.map((subject) => Subject.fromJson(subject))
          .toList(),
    );
  }
}

class Subject {
  final String? title;
  final String? name;

  Subject({
    this.title,
    this.name,
  });

  factory Subject.fromJson(Map<String, dynamic> json) {
    return Subject(
      title: json['titile'],
      name: json['name'],
    );
  }
}
