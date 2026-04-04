class User {
  final String id;
  final String name;
  final int age;
  final String aadharId;
  final bool isVoted;

  User({
    required this.id,
    required this.name,
    required this.age,
    required this.aadharId,
    required this.isVoted,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'],
      name: json['name'],
      age: json['age'],
      aadharId: json['aadharId'],
      isVoted: json['IsVoted'],
    );
  }
}
