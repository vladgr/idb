import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:idb/app/config.dart';
import 'package:idb/app/models/tag.dart';
import 'package:idb/app/services/api.dart';
import 'package:idb/app/stores/base_store.dart';
import 'package:idb/app/stores/item_store.dart';
import 'package:idb/app/stores/search_store.dart';
import 'package:mobx/mobx.dart';

part 'tag_store.g.dart';

// ignore: library_private_types_in_public_api
class TagStore = _TagStore with _$TagStore;

abstract class _TagStore extends BaseStore with Store {
  @observable
  Map<int, Tag> map = <int, Tag>{};

  @observable
  List<Tag> selectedTags = [];

  // If items map is not empty,
  // returns tags that exist in items
  @computed
  List<Tag> get tags {
    final item = GetIt.I<ItemStore>();
    final search = GetIt.I<SearchStore>();

    var allTags = map.values.toList();

    if (item.map.isEmpty || search.text.isEmpty) {
      return allTags;
    }

    Set<Tag> tagsSet = <Tag>{};
    for (var item in item.map.values) {
      tagsSet.addAll(item.tags);
    }

    return allTags.where((x) => tagsSet.contains(x)).toList();
  }

  @action
  void clear() {
    selectedTags = [];
  }

  @action
  Future<void> fetchTags() async {
    var result = await apiCall(Config.apiTagsUrl, 'GET', {}, true);
    if (!result.isError) {
      var m = <int, Tag>{};

      for (var d in result.data) {
        var tag = Tag.fromJson(d);
        m[tag.id] = tag;
      }

      map = m;
    }
  }

  @action
  void toggleTag(Tag tag) {
    var l = [...selectedTags];

    if (selectedTags.contains(tag)) {
      l.remove(tag);
    } else {
      l.add(tag);
    }

    selectedTags = l;

    // Reload items
    GetIt.I<ItemStore>().fetchItems();
  }
}
