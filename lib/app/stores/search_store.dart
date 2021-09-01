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
  }
}
