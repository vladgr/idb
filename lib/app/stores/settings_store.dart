import 'package:get_it/get_it.dart';
import 'package:idb/app/config.dart';
import 'package:idb/app/models/user.dart';
import 'package:idb/app/services/api.dart';
import 'package:idb/app/stores/user_store.dart';
import 'package:mobx/mobx.dart';

part 'settings_store.g.dart';

class SettingsStore = _SettingsStore with _$SettingsStore;

abstract class _SettingsStore with Store {
  @observable
  List<int> selectedUserIds = [];

  Future<void> init() async {
    final user = GetIt.I<UserStore>();

    // Set by default current user to settings
    if (user.profile != null) {
      this.selectedUserIds = [user.profile!.id];
    }
  }

  @action
  void toggleUser(int value) {
    final l = [...this.selectedUserIds];
    if (l.contains(value)) {
      l.remove(value);
    } else {
      l.add(value);
    }

    this.selectedUserIds = l;
  }
}
