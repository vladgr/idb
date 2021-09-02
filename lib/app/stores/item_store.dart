import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:idb/app/config.dart';
import 'package:idb/app/models/item.dart';
import 'package:idb/app/services/api.dart';
import 'package:idb/app/stores/base_store.dart';
import 'package:idb/app/stores/search_store.dart';
import 'package:idb/app/stores/tag_store.dart';
import 'package:mobx/mobx.dart';

part 'item_store.g.dart';

class ItemStore = _ItemStore with _$ItemStore;

abstract class _ItemStore extends BaseStore with Store {
  @observable
  Map<int, Item> map = Map<int, Item>();

  @observable
  Item? selectedItem;

  @observable
  bool isEditModeEnabled = false;

  @action
  void clear() {
    this.selectedItem = null;
    this.map = Map<int, Item>();
  }

  String get _queryString {
    final tagIds = GetIt.I<TagStore>().selectedTags.map((x) => x.id).toList();

    String q = 'search=${GetIt.I<SearchStore>().text}';
    if (tagIds.isNotEmpty) q += '&tag_ids=${tagIds.join(',')}';
    return q;
  }

  @action
  Future<void> fetch() async {
    final _search = GetIt.I<SearchStore>();
    if (_search.text.length < 3) return;

    final url = '${Config.apiItemsUrl}?$_queryString';
    var result = await apiCall(url, 'GET', {}, true);
    if (!result.isError) {
      var m = Map<int, Item>();

      for (var d in result.data) {
        var item = Item.fromJson(d);
        m[item.id] = item;
      }

      this.map = m;
    }
  }

  @action
  Future<void> fetchItem(String guid) async {
    final url = Config.apiItemUrl.replaceFirst('<guid>', guid);

    var result = await apiCall(url, 'GET', {}, true);
    if (!result.isError) {
      this.selectedItem = Item.fromJson(result.data);
    }
  }

  @action
  Future<bool> createItem(String name, String content, List<int> tagIds) async {
    this.isInprogress = true;
    this.errors = null;

    final url = Config.apiItemsUrl;

    dynamic data = {
      'name': name,
      'content': content,
      'tag_ids': tagIds,
    };

    var result = await apiCall(url, 'POST', data, true);
    this.isInprogress = false;

    if (result.isError) {
      this.errors = result.data;
      return false;
    }

    return true;
  }

  @action
  Future<bool> updateItem(String guid, String content, List<int> tagIds) async {
    this.isInprogress = true;

    final url = Config.apiItemUrl.replaceFirst('<guid>', guid);

    dynamic data = {
      'content': content,
      'tag_ids': tagIds,
    };

    var result = await apiCall(url, 'PATCH', data, true);
    this.isInprogress = false;

    if (result.isError) {
      return false;
    }

    this.selectedItem = Item.fromJson(result.data);
    return true;
  }

  @action
  Future<bool> deleteItem(String guid) async {
    this.isInprogress = true;

    final url = Config.apiItemUrl.replaceFirst('<guid>', guid);

    var result = await apiCall(url, 'DELETE', {}, true);
    this.isInprogress = false;

    return result.isError ? false : true;
  }

  @action
  void postDeleteItem() {
    this.selectedItem = null;
    this.fetch();
  }

  @action
  void clearSelectedItem() {
    this.selectedItem = null;
  }

  @action
  void setItem(Item value) {
    this.selectedItem = value;
  }

  @action
  void setEditModeEnabled(bool value) {
    this.isEditModeEnabled = value;
  }
}
