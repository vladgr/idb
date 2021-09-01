// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TagStore on _TagStore, Store {
  final _$mapAtom = Atom(name: '_TagStore.map');

  @override
  Map<int, Tag> get map {
    _$mapAtom.reportRead();
    return super.map;
  }

  @override
  set map(Map<int, Tag> value) {
    _$mapAtom.reportWrite(value, super.map, () {
      super.map = value;
    });
  }

  final _$loadAsyncAction = AsyncAction('_TagStore.load');

  @override
  Future<void> load() {
    return _$loadAsyncAction.run(() => super.load());
  }

  final _$_TagStoreActionController = ActionController(name: '_TagStore');

  @override
  void clear() {
    final _$actionInfo =
        _$_TagStoreActionController.startAction(name: '_TagStore.clear');
    try {
      return super.clear();
    } finally {
      _$_TagStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
map: ${map}
    ''';
  }
}
