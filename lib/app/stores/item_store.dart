import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:idb/app/config.dart';
import 'package:idb/app/constants/enums.dart';
import 'package:idb/app/models/item.dart';
import 'package:idb/app/services/api.dart';
import 'package:idb/app/services/scaffold_service.dart';
import 'package:idb/app/stores/base_store.dart';
import 'package:idb/app/stores/search_store.dart';
import 'package:idb/app/stores/settings_store.dart';
import 'package:idb/app/stores/tag_store.dart';
import 'package:mobx/mobx.dart';

part 'item_store.g.dart';

// ignore: library_private_types_in_public_api
class ItemStore = _ItemStore with _$ItemStore;

abstract class _ItemStore extends BaseStore with Store {
  @observable
  Map<int, Item> map = <int, Item>{};

  @observable
  Item? selectedItem;

  @observable
  bool isEditModeEnabled = false;

  @computed
  bool get hasSelectedItem {
    return selectedItem != null;
  }

  @computed
  int get count {
    return map.length;
  }

  @action
  void clear() {
    selectedItem = null;
    map = <int, Item>{};
  }

  String get _queryString {
    final tagIds = GetIt.I<TagStore>().selectedTags.map((x) => x.id).toList();
    final userIds = GetIt.I<SettingsStore>().selectedUserIds;

    String q = 'search=${GetIt.I<SearchStore>().text}';
    if (tagIds.isNotEmpty) q += '&tag_ids=${tagIds.join(',')}';
    if (userIds.length == 1) q += '&user_id=${userIds[0]}';
    return q;
  }

  @action
  Future<void> fetchItems() async {
    final search = GetIt.I<SearchStore>();
    if (search.text.length < 3) return;

    final url = '${Config.apiItemsUrl}?$_queryString';
    var result = await apiCall(url, 'GET', {}, true);
    if (!result.isError) {
      var m = <int, Item>{};

      for (var d in result.data) {
        var item = Item.fromJson(d);
        m[item.id] = item;
      }

      map = m;
    }
  }

  @action
  Future<void> fetchItem(String guid) async {
    final url = Config.apiItemUrl.replaceFirst('<guid>', guid);

    var result = await apiCall(url, 'GET', {}, true);
    if (!result.isError) {
      selectedItem = null;
      selectedItem = Item.fromJson(result.data);
    }
  }

  @action
  Future<bool> createItem(String name, String content, List<int> tagIds) async {
    isInprogress = true;
    errors = null;

    final url = Config.apiItemsUrl;

    dynamic data = {
      'name': name,
      'content': content,
      'tag_ids': tagIds,
    };

    var result = await apiCall(url, 'POST', data, true);
    isInprogress = false;

    if (result.isError) {
      errors = result.data;
      return false;
    }

    return true;
  }

  /// Method call from UI
  /// After API call it creates snackbar message.
  @action
  Future<bool> updateItemFromUI(Item item) async {
    final scaffold = GetIt.I<ScaffoldService>();

    bool isUpdated = await updateItem(
      item.guid,
      item.content,
      item.tags.map((x) => x.id).toList(),
    );

    if (isUpdated) {
      scaffold.createAlert('Item updated', seconds: 1);
      return true;
    }

    scaffold.createAlert('Something went wrong!', type: AlertType.error);
    return false;
  }

  /// API call to update item
  @action
  Future<bool> updateItem(String guid, String content, List<int> tagIds) async {
    isInprogress = true;

    final url = Config.apiItemUrl.replaceFirst('<guid>', guid);

    dynamic data = {
      'content': content,
      'tag_ids': tagIds,
    };

    var result = await apiCall(url, 'PATCH', data, true);
    isInprogress = false;

    if (result.isError) {
      return false;
    }

    selectedItem = null;
    selectedItem = Item.fromJson(result.data);
    return true;
  }

  @action
  Future<bool> deleteItem(String guid) async {
    isInprogress = true;

    final url = Config.apiItemUrl.replaceFirst('<guid>', guid);

    var result = await apiCall(url, 'DELETE', {}, true);
    isInprogress = false;

    return result.isError ? false : true;
  }

  @action
  void postDeleteItem() {
    selectedItem = null;
    fetchItems();
  }

  @action
  void clearSelectedItem() {
    selectedItem = null;
  }

  @action
  void setItem(Item value) {
    selectedItem = value;
  }

  @action
  Future<void> setAndFetchItem(Item value) async {
    selectedItem = value;
    await fetchItem(value.guid);
    isEditModeEnabled = false;
  }

  @action
  void toggleEditModeEnabled() {
    isEditModeEnabled = !isEditModeEnabled;
  }

  @action
  void setEditModeEnabled(bool value) {
    isEditModeEnabled = value;
  }
}
