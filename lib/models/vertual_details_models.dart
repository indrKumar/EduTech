class InterviewResponse {
  final bool isError;
  final String? interviewLink;
  final String? interviewDate;
  final String? startTime;
  final String? endTime;
  final String? interviewer;
  final String? designation;
  final String? profilePic;
  final String? message;
  final String? msg;

  InterviewResponse({
    required this.isError,
    this.interviewLink,
    this.interviewDate,
    this.startTime,
    this.endTime,
    this.interviewer,
    this.designation,
    this.profilePic,
    this.message,
    this.msg,
  });

  factory InterviewResponse.fromJson(Map<String, dynamic> json) {
    return InterviewResponse(
      isError: json['is_error'],
      interviewLink: json['interview_link'],
      interviewDate: json['interview_date'],
      startTime: json['start_time'],
      endTime: json['end_time'],
      interviewer: json['interviewer'],
      designation: json['designation'],
      profilePic: json['profile_pic'],
      message: json['message'],
      msg: json['msg'],
    );
  }
}
