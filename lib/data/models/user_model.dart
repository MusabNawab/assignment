class User {
  final String name;
  final int age;
  final String userImage;
  final String aadharNum;
  final String phoneNum;
  final String houseName;
  final String schoolName;
  final Map<String, dynamic> contribution;

  User({
    required this.name,
    required this.age,
    required this.userImage,
    required this.aadharNum,
    required this.phoneNum,
    required this.houseName,
    required this.schoolName,
    required this.contribution,
  });
}
