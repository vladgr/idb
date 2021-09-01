import 'package:get_it/get_it.dart';
import 'package:idb/app/stores/item_store.dart';
import 'package:mobx/mobx.dart';

part 'search_store.g.dart';

class SearchStore = _SearchStore with _$SearchStore;

abstract class _SearchStore with Store {
  @observable
  String text = '';

  @action
  void clear() {
    this.text = '';
  }

  @action
  void setText(String value) {
    this.text = value;

    if (value.trim().length > 2) {
      GetIt.I<ItemStore>().fetch();
    }
  }
}
