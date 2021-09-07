// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SettingsStore on _SettingsStore, Store {
  final _$userIdsAtom = Atom(name: '_SettingsStore.userIds');

  @override
  List<int> get userIds {
    _$userIdsAtom.reportRead();
    return super.userIds;
  }

  @override
  set userIds(List<int> value) {
    _$userIdsAtom.reportWrite(value, super.userIds, () {
      super.userIds = value;
    });
  }

  final _$_SettingsStoreActionController =
      ActionController(name: '_SettingsStore');

  @override
  void setUserIds(List<int> value) {
    final _$actionInfo = _$_SettingsStoreActionController.startAction(
        name: '_SettingsStore.setUserIds');
    try {
      return super.setUserIds(value);
    } finally {
      _$_SettingsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleUser(int value) {
    final _$actionInfo = _$_SettingsStoreActionController.startAction(
        name: '_SettingsStore.toggleUser');
    try {
      return super.toggleUser(value);
    } finally {
      _$_SettingsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
userIds: ${userIds}
    ''';
  }
}
