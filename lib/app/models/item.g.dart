// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
      id: json['id'] as int,
      guid: json['guid'] as String,
      name: json['name'] as String,
      tags: (json['tags'] as List<dynamic>)
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      content: json['content'] as String? ?? '',
      contentHtml: json['content_html'] as String? ?? '',
    )..createdAt = json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String);

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'id': instance.id,
      'guid': instance.guid,
      'name': instance.name,
      'tags': instance.tags,
      'content': instance.content,
      'content_html': instance.contentHtml,
      'created_at': instance.createdAt?.toIso8601String(),
    };
