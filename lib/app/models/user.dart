import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class User {
  late int id;
  late String guid;
  late String email;
  late String firstName;
  late String lastName;
  late DateTime joinedAt;
  late bool isAdmin;

  User({
    required this.id,
    required this.guid,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.joinedAt,
    required this.isAdmin,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  String toString() {
    return 'User: $email $firstName $lastName';
  }
}
