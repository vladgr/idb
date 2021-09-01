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

  final _$loadAsyncAction = AsyncAction('_ItemStore.load');

  @override
  Future<void> load() {
    return _$loadAsyncAction.run(() => super.load());
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
  String toString() {
    return '''
map: ${map}
    ''';
  }
}
