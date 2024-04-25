class Meeting {
  final bool isError;
  final String mode;
  final String name;
  final String designation;
  final String date;
  final String time;
  final String link;
  final String? location;
  final String? city;
  final String? state;

  Meeting({
    required this.isError,
    required this.mode,
    required this.name,
    required this.designation,
    required this.date,
    required this.time,
    required this.link,
    this.location,
    this.city,
    this.state
  });

  factory Meeting.fromJson(Map<String, dynamic> json) {
    return Meeting(
      isError: json['is_error']??'',
      mode: json['mode']??'',
      name: json['name']??'',
      designation: json['designation']??'',
      date: json['date']??'',
      time: json['time']??'',
      link: json['link']??'',
      state: json["state"]??'',
      city: json["city"]??'',
      location: json["location"]??'',
    );
  }
}
