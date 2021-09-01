import 'dart:async';

import 'package:idb/app/config.dart';
import 'package:idb/app/models/tag.dart';
import 'package:idb/app/services/api.dart';
import 'package:idb/app/stores/base_store.dart';
import 'package:mobx/mobx.dart';

part 'tag_store.g.dart';

class TagStore = _TagStore with _$TagStore;

abstract class _TagStore extends BaseStore with Store {
  @observable
  Map<int, Tag> map = Map<int, Tag>();

  @action
  void clear() {}

  @action
  Future<void> load() async {
    var result = await apiCall(Config.apiTagsUrl, 'GET', {}, true);
    if (!result.isError) {}
  }
}
