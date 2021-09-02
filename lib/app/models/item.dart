import 'package:idb/app/models/tag.dart';
import 'package:json_annotation/json_annotation.dart';

part 'item.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Item {
  late int id;
  late String guid;
  late String name;
  late List<Tag> tags;

  @JsonKey(defaultValue: '')
  late String content;

  @JsonKey(defaultValue: '')
  late String contentHtml;

  DateTime? createdAt;

  Item({
    required this.id,
    required this.guid,
    required this.name,
    required this.tags,
    required this.content,
    required this.contentHtml,
  });

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
  Map<String, dynamic> toJson() => _$ItemToJson(this);

  @override
  String toString() {
    return 'Item: $id $name';
  }

  @override
  bool operator ==(covariant Item other) => other.id == id;

  @override
  int get hashCode => this.id;
}
