class Meeting {
  final bool isError;
  final String? mode;
  final String? name;
  final List<String>? designation;
  final String? date;
  final String? time;
  final String? link;
  final String? location;
  final String? city;
  final String? state;

  Meeting({
    required this.isError,
    this.mode,
    this.name,
    this.designation,
    this.date,
    this.time,
    this.link,
    this.location,
    this.city,
    this.state,
  });

  factory Meeting.fromJson(Map<String, dynamic> json) {
    return Meeting(
      isError: json['is_error'] ?? false,
      mode: json['mode'],
      name: json['name'],
      designation: json['designation'] != null
          ? List<String>.from(json['designation'])
          : null,
      date: json['date'],
      time: json['time'],
      link: json['link'],
      // The JSON response does not contain a 'link' field
      location: json['location'],
      city: json['city'],
      state: json['state'],
    );
  }
}
