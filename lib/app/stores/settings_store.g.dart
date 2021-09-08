// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SettingsStore on _SettingsStore, Store {
  final _$selectedUserIdsAtom = Atom(name: '_SettingsStore.selectedUserIds');

  @override
  List<int> get selectedUserIds {
    _$selectedUserIdsAtom.reportRead();
    return super.selectedUserIds;
  }

  @override
  set selectedUserIds(List<int> value) {
    _$selectedUserIdsAtom.reportWrite(value, super.selectedUserIds, () {
      super.selectedUserIds = value;
    });
  }

  final _$_SettingsStoreActionController =
      ActionController(name: '_SettingsStore');

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
selectedUserIds: ${selectedUserIds}
    ''';
  }
}
