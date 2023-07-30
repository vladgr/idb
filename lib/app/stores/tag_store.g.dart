// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TagStore on _TagStore, Store {
  Computed<List<Tag>>? _$tagsComputed;

  @override
  List<Tag> get tags => (_$tagsComputed ??=
          Computed<List<Tag>>(() => super.tags, name: '_TagStore.tags'))
      .value;

  late final _$mapAtom = Atom(name: '_TagStore.map', context: context);

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

  late final _$selectedTagsAtom =
      Atom(name: '_TagStore.selectedTags', context: context);

  @override
  List<Tag> get selectedTags {
    _$selectedTagsAtom.reportRead();
    return super.selectedTags;
  }

  @override
  set selectedTags(List<Tag> value) {
    _$selectedTagsAtom.reportWrite(value, super.selectedTags, () {
      super.selectedTags = value;
    });
  }

  late final _$fetchTagsAsyncAction =
      AsyncAction('_TagStore.fetchTags', context: context);

  @override
  Future<void> fetchTags() {
    return _$fetchTagsAsyncAction.run(() => super.fetchTags());
  }

  late final _$_TagStoreActionController =
      ActionController(name: '_TagStore', context: context);

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
  void toggleTag(Tag tag) {
    final _$actionInfo =
        _$_TagStoreActionController.startAction(name: '_TagStore.toggleTag');
    try {
      return super.toggleTag(tag);
    } finally {
      _$_TagStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
map: ${map},
selectedTags: ${selectedTags},
tags: ${tags}
    ''';
  }
}
