import 'dart:convert';

class LeaderBoardModel {
  final String name;
  final int pts;
  LeaderBoardModel({
    required this.name,
    required this.pts,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'pts': pts,
    };
  }

  factory LeaderBoardModel.fromMap(Map<String, dynamic> map) {
    return LeaderBoardModel(
      name: map['name'] as String,
      pts: int.parse(map['pts']),
    );
  }

  String toJson() => json.encode(toMap());

  factory LeaderBoardModel.fromJson(String source) =>
      LeaderBoardModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
