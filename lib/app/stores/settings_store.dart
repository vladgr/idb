import 'package:get_it/get_it.dart';
import 'package:idb/app/stores/user_store.dart';
import 'package:mobx/mobx.dart';

part 'settings_store.g.dart';

// ignore: library_private_types_in_public_api
class SettingsStore = _SettingsStore with _$SettingsStore;

abstract class _SettingsStore with Store {
  @observable
  List<int> selectedUserIds = [];

  Future<void> init() async {
    final user = GetIt.I<UserStore>();

    // Set by default current user to settings
    if (user.profile != null) {
      selectedUserIds = [user.profile!.id];
    }
  }

  @action
  void toggleUser(int value) {
    final l = [...selectedUserIds];
    if (l.contains(value)) {
      l.remove(value);
    } else {
      l.add(value);
    }

    selectedUserIds = l;
  }
}
