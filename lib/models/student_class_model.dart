class StudentClassM {
  final int id;
  final String name;
  final String state;
  final String city;
  final String location;
  final String parent;
  final String tutor;
  final String? profilePic;
  final String badge;
  final String type;
  final String startTime;
  final String endTime;
  final int numberOfSessions;
  final List<String> days;
  final int sessionPerMonth;
  final int hours;
  final int duration;
  final String mode;
  final String status;
  final String createdOn;
  final List<Subject> subjects;

  StudentClassM({
    required this.id,
    required this.name,
    required this.state,
    required this.city,
    required this.location,
    required this.parent,
    required this.tutor,
    this.profilePic,
    required this.badge,
    required this.type,
    required this.startTime,
    required this.endTime,
    required this.numberOfSessions,
    required this.days,
    required this.sessionPerMonth,
    required this.hours,
    required this.duration,
    required this.mode,
    required this.status,
    required this.createdOn,
    required this.subjects,
  });

  factory StudentClassM.fromJson(Map<String, dynamic> json) {
    return StudentClassM(
      id: json['id'] as int,
      name: json['name'] as String,
      state: json['state'] as String,
      city: json['city'] as String,
      location: json['location'] as String,
      parent: json['parent'] as String,
      tutor: json['tutor'] as String,
      profilePic: json['profilePic'] as String?,
      badge: json['badge'] as String,
      type: json['type'] as String,
      startTime: json['start_time'] as String,
      endTime: json['end_time'] as String,
      numberOfSessions: json['number_of_session'] as int,
      days: (json['days'] as List<dynamic>).map((e) => e as String).toList(),
      sessionPerMonth: json['session_per_month'] as int,
      hours: json['hours'] as int,
      duration: json['duration'] as int,
      mode: json['mode'] as String,
      status: json['status'] as String,
      createdOn: json['Created_ON'] as String,
      subjects: (json['subjects'] as List<dynamic>)
          .map((e) => Subject.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class Subject {
  final String title;
  final String name;

  Subject({
    required this.title,
    required this.name,
  });

  factory Subject.fromJson(Map<String, dynamic> json) {
    return Subject(
      title: json['title'] as String,
      name: json['name'] as String,
    );
  }
}
