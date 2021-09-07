import 'package:mobx/mobx.dart';

part 'settings_store.g.dart';

class SettingsStore = _SettingsStore with _$SettingsStore;

abstract class _SettingsStore with Store {
  @observable
  List<int> userIds = [];

  @action
  void setUserIds(List<int> value) {
    this.userIds = value;
  }

  @action
  void toggleUser(int value) {
    final l = [...this.userIds];
    if (l.contains(value)) {
      l.remove(value);
    } else {
      l.add(value);
    }

    this.userIds = l;
  }
}
