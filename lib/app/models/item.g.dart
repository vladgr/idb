// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Item _$ItemFromJson(Map<String, dynamic> json) {
  return Item(
    id: json['id'] as int,
    guid: json['guid'] as String,
    name: json['name'] as String,
    content: json['content'] as String,
    sort: json['sort'] as int,
  );
}

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'id': instance.id,
      'guid': instance.guid,
      'name': instance.name,
      'content': instance.content,
      'sort': instance.sort,
    };
