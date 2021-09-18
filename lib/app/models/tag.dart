import 'package:json_annotation/json_annotation.dart';

part 'tag.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Tag {
  late int id;
  late String name;

  Tag({
    required this.id,
    required this.name,
  });

  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);
  Map<String, dynamic> toJson() => _$TagToJson(this);

  @override
  String toString() {
    return 'Tag: $id $name';
  }

  @override
  bool operator ==(covariant Tag other) => other.id == id;

  @override
  int get hashCode => id;
}
