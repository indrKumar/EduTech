class InterviewStatus {
  final bool? isError;
  final bool? status;
  final String? name;
  final String? profilePic;
  final List<dynamic>? subjects;
  final String? feedback;
  final String? message;
  final String? msg;

  InterviewStatus({
    this.isError,
    this.status,
    this.name,
    this.profilePic,
    this.subjects,
    this.feedback,
    this.message,
    this.msg,
  });

  factory InterviewStatus.fromJson(Map<String, dynamic> json) {
    return InterviewStatus(
      isError: json['is_error'],
      status: json['status'],
      name: json['name'],
      profilePic: json['profile_pic'],
      subjects: (json['subjects'] as List<dynamic>?)
          ?.map((subject) => (subject as List<dynamic>)
              .map((e) => e as Map<String, dynamic>)
              .toList())
          .toList(),
      feedback: json['feedback'],
      message: json['message'],
      msg: json['msg'],
    );
  }
}
