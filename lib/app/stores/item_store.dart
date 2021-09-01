import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:idb/app/config.dart';
import 'package:idb/app/models/item.dart';
import 'package:idb/app/services/api.dart';
import 'package:idb/app/stores/base_store.dart';
import 'package:idb/app/stores/search_store.dart';
import 'package:mobx/mobx.dart';

part 'item_store.g.dart';

class ItemStore = _ItemStore with _$ItemStore;

abstract class _ItemStore extends BaseStore with Store {
  @observable
  Map<int, Item> map = Map<int, Item>();

  @action
  void clear() {}

  String get _queryString {
    return 'search=${GetIt.I<SearchStore>().text}';
  }

  @action
  Future<void> fetch() async {
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
}
