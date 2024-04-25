class StudentClassM {
  final int id;
  final String name;
  final String state;
  final String city;
  final String location;
  final String parent;
  final String tutor;
  final String badge;
  final String type;
  final String startTime;
  final String endTime;
  final int? numberOfSessions; // Nullable int
  final String? days; // Nullable string
  final int? sessionPerMonth; // Nullable int
  final int? hours; // Nullable int
  var duration; // Nullable int
  final String mode;
  final String status;
  final String createdOn;
  final Map<String, String> subjects;

  StudentClassM({
    required this.id,
    required this.name,
    required this.state,
    required this.city,
    required this.location,
    required this.parent,
    required this.tutor,
    required this.badge,
    required this.type,
    required this.startTime,
    required this.endTime,
    this.numberOfSessions, // Nullable int
    this.days, // Nullable string
    this.sessionPerMonth, // Nullable int
    this.hours, // Nullable int
    this.duration, // Nullable int
    required this.mode,
    required this.status,
    required this.createdOn,
    required this.subjects,
  });

  factory StudentClassM.fromJson(Map<String, dynamic> json) {
    return StudentClassM(
      id: json['id'],
      name: json['name'],
      state: json['state'],
      city: json['city'],
      location: json['location'],
      parent: json['parent'],
      tutor: json['tutor'],
      badge: json['badge'],
      type: json['type'],
      startTime: json['start_time'],
      endTime: json['end_time'],
      numberOfSessions: json['number_of_session'], // Nullable int
      days: json['days'], // Nullable string
      sessionPerMonth: json['session_per_month'], // Nullable int
      hours: json['hours'], // Nullable int
      duration: json['duration']??'', // Nullable int
      mode: json['mode'],
      status: json['status'],
      createdOn: json['Created_ON'],
      subjects: Map<String, String>.from(json['subjects']),
    );
  }
}
