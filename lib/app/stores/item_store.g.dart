// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ItemStore on _ItemStore, Store {
  final _$mapAtom = Atom(name: '_ItemStore.map');

  @override
  Map<int, Item> get map {
    _$mapAtom.reportRead();
    return super.map;
  }

  @override
  set map(Map<int, Item> value) {
    _$mapAtom.reportWrite(value, super.map, () {
      super.map = value;
    });
  }

  final _$selectedItemAtom = Atom(name: '_ItemStore.selectedItem');

  @override
  Item? get selectedItem {
    _$selectedItemAtom.reportRead();
    return super.selectedItem;
  }

  @override
  set selectedItem(Item? value) {
    _$selectedItemAtom.reportWrite(value, super.selectedItem, () {
      super.selectedItem = value;
    });
  }

  final _$isEditModeEnabledAtom = Atom(name: '_ItemStore.isEditModeEnabled');

  @override
  bool get isEditModeEnabled {
    _$isEditModeEnabledAtom.reportRead();
    return super.isEditModeEnabled;
  }

  @override
  set isEditModeEnabled(bool value) {
    _$isEditModeEnabledAtom.reportWrite(value, super.isEditModeEnabled, () {
      super.isEditModeEnabled = value;
    });
  }

  final _$fetchAsyncAction = AsyncAction('_ItemStore.fetch');

  @override
  Future<void> fetch() {
    return _$fetchAsyncAction.run(() => super.fetch());
  }

  final _$fetchItemAsyncAction = AsyncAction('_ItemStore.fetchItem');

  @override
  Future<void> fetchItem(String guid) {
    return _$fetchItemAsyncAction.run(() => super.fetchItem(guid));
  }

  final _$createItemAsyncAction = AsyncAction('_ItemStore.createItem');

  @override
  Future<bool> createItem(String name, String content, List<int> tagIds) {
    return _$createItemAsyncAction
        .run(() => super.createItem(name, content, tagIds));
  }

  final _$updateItemAsyncAction = AsyncAction('_ItemStore.updateItem');

  @override
  Future<bool> updateItem(String guid, String content) {
    return _$updateItemAsyncAction.run(() => super.updateItem(guid, content));
  }

  final _$deleteItemAsyncAction = AsyncAction('_ItemStore.deleteItem');

  @override
  Future<bool> deleteItem(String guid) {
    return _$deleteItemAsyncAction.run(() => super.deleteItem(guid));
  }

  final _$_ItemStoreActionController = ActionController(name: '_ItemStore');

  @override
  void clear() {
    final _$actionInfo =
        _$_ItemStoreActionController.startAction(name: '_ItemStore.clear');
    try {
      return super.clear();
    } finally {
      _$_ItemStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearSelectedItem() {
    final _$actionInfo = _$_ItemStoreActionController.startAction(
        name: '_ItemStore.clearSelectedItem');
    try {
      return super.clearSelectedItem();
    } finally {
      _$_ItemStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setItem(Item value) {
    final _$actionInfo =
        _$_ItemStoreActionController.startAction(name: '_ItemStore.setItem');
    try {
      return super.setItem(value);
    } finally {
      _$_ItemStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEditModeEnabled(bool value) {
    final _$actionInfo = _$_ItemStoreActionController.startAction(
        name: '_ItemStore.setEditModeEnabled');
    try {
      return super.setEditModeEnabled(value);
    } finally {
      _$_ItemStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
map: ${map},
selectedItem: ${selectedItem},
isEditModeEnabled: ${isEditModeEnabled}
    ''';
  }
}
