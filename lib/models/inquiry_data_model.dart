class InquiryDataModel {
  final int id;
  final String? message;
  final String? state;
  final String? city;
  final String? location;
  final Subjects? subjects;
  final String? status;
  final List<String>? statusList;

  InquiryDataModel({

    required this.id,
     this.message,
     this.state,
     this.city,
     this.location,
     this.subjects,
     this.status,
     this.statusList,
  });

  factory InquiryDataModel.fromJson(Map<String, dynamic> json) {
    return InquiryDataModel(
      id: json['id'] ?? 0,
      message: json['message'] ?? '',
      state: json['state'] ?? '',
      city: json['city'] ?? '',
      location: json['location'] ?? '',
      subjects: Subjects.fromJson(json['subjects'] ?? {}),
      status: json['status'] ?? '',
      statusList: List<String>.from(json['status_list'] ?? []),
    );
  }
}

class Subjects {
  final List<String> subjects;
  final String classInfo;
  final String board;
  final String academic;

  Subjects({
    required this.subjects,
    required this.classInfo,
    required this.board,
    required this.academic,
  });

  factory Subjects.fromJson(Map<String, dynamic> json) {
    return Subjects(
      subjects: List<String>.from(json['Subjects'] ?? []),
      classInfo: json['Class'] ?? '',
      board: json['Board'] ?? '',
      academic: json['Academic'] ?? '',
    );
  }
}