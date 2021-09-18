import 'package:html/parser.dart';
import 'package:idb/app/config.dart';
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
  String content;

  @JsonKey(defaultValue: '')
  String contentHtml;

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
  int get hashCode => id;

  /// Returns the same content, but with images replaced
  /// to full path src and as image tags
  String get processedHtml {
    return _processImages(contentHtml);
  }

  /// Split contentHtml to parts to be able
  /// to process each part separately for custom functionality
  List<String> get htmlParts {
    final doc = parse(processedHtml);

    if (doc.body == null) {
      return [processedHtml];
    }

    return doc.body!.children.map((el) => el.outerHtml).toList();
  }

  /// Convert uploaded images to "img" html tag.
  /// Returns updated html content.
  String _processImages(String htmlContent) {
    final re = RegExp(r'\[img:(.*?)\]', dotAll: true);

    return htmlContent.replaceAllMapped(re, (m) {
      final imgPath = '${m.group(1)}';
      return '<img class="item-image" src="${Config.bucketUrl}/$imgPath" />';
    });
  }
}
