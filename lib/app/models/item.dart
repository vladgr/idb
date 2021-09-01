import 'package:idb/app/models/tag.dart';
import 'package:json_annotation/json_annotation.dart';

part 'item.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Item {
  late int id;
  late String guid;
  late String name;
  late String content;
  late int sort;
  // late DateTime createdAt;
  // late List<Tag> tags;

  Item({
    required this.id,
    required this.guid,
    required this.name,
    required this.content,
    required this.sort,
    // required this.createdAt,
    // required this.tags,
  });

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
  Map<String, dynamic> toJson() => _$ItemToJson(this);

  @override
  String toString() {
    return 'Item: $id $name';
  }
}
