import 'dart:convert';

class Competitions {
  final String name;
  final String url;
  final int startMonth;
  final int endMonth;
  final int startYear;
  final int endYear;

  Competitions({
    required this.name,
    required this.url,
    required this.startMonth,
    required this.endMonth,
    required this.startYear,
    required this.endYear,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'url': url,
      'startMonth': startMonth,
      'endMonth': endMonth,
      'startYear': startYear,
      'endYear': endYear,
    };
  }

  factory Competitions.fromMap(Map<String, dynamic> map) {
    return Competitions(
      name: map['name'] as String,
      url: map['imageUrl'] as String,
      startMonth: int.parse(map['startMonth']),
      endMonth: int.parse(map['endMonth']),
      startYear: int.parse(map['startYear']),
      endYear: int.parse(map['endYear']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Competitions.fromJson(String source) =>
      Competitions.fromMap(json.decode(source) as Map<String, dynamic>);
}
