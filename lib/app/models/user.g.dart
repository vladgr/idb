// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    id: json['id'] as int,
    guid: json['guid'] as String,
    email: json['email'] as String,
    firstName: json['first_name'] as String,
    lastName: json['last_name'] as String,
    joinedAt: DateTime.parse(json['joined_at'] as String),
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'guid': instance.guid,
      'email': instance.email,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'joined_at': instance.joinedAt.toIso8601String(),
    };