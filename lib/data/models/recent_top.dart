import 'dart:convert';

class RecentTop {
  final int userId;
  final String userImg;
  final String userName;
  final int userAge;
  final String url;
  final String description;
  final String userHouse;
  final String userSchool;
  final int upvotes;
  final bool isFavourite;

  RecentTop({
    required this.userId,
    required this.userImg,
    required this.userName,
    required this.userAge,
    required this.url,
    required this.description,
    required this.userHouse,
    required this.userSchool,
    required this.upvotes,
    required this.isFavourite,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'userImg': userImg,
      'userName': userName,
      'userAge': userAge,
      'url': url,
      'description': description,
      'userHouse': userHouse,
      'userSchool': userSchool,
      'upvotes': upvotes,
      'isFavourite': isFavourite,
    };
  }

  factory RecentTop.fromMap(Map<String, dynamic> map) {
    return RecentTop(
      userId: int.parse(map['userId']),
      userImg: map['userImg'] as String,
      userName: map['userName'] as String,
      userAge: int.parse(map['userAge']),
      url: map['postImg'] as String,
      description: map['postDesc'] as String,
      userHouse: map['userHouse'] as String,
      userSchool: map['userSchool'] as String,
      upvotes: int.parse(map['upvotes']),
      isFavourite: map['isFavourite'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory RecentTop.fromJson(String source) =>
      RecentTop.fromMap(json.decode(source) as Map<String, dynamic>);
}
