// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BaseStore on _BaseStore, Store {
  Computed<bool>? _$hasErrorComputed;

  @override
  bool get hasError => (_$hasErrorComputed ??=
          Computed<bool>(() => super.hasError, name: '_BaseStore.hasError'))
      .value;

  late final _$errorsAtom = Atom(name: '_BaseStore.errors', context: context);

  @override
  dynamic get errors {
    _$errorsAtom.reportRead();
    return super.errors;
  }

  @override
  set errors(dynamic value) {
    _$errorsAtom.reportWrite(value, super.errors, () {
      super.errors = value;
    });
  }

  late final _$isInprogressAtom =
      Atom(name: '_BaseStore.isInprogress', context: context);

  @override
  bool get isInprogress {
    _$isInprogressAtom.reportRead();
    return super.isInprogress;
  }

  @override
  set isInprogress(bool value) {
    _$isInprogressAtom.reportWrite(value, super.isInprogress, () {
      super.isInprogress = value;
    });
  }

  late final _$_BaseStoreActionController =
      ActionController(name: '_BaseStore', context: context);

  @override
  void clearErrors() {
    final _$actionInfo = _$_BaseStoreActionController.startAction(
        name: '_BaseStore.clearErrors');
    try {
      return super.clearErrors();
    } finally {
      _$_BaseStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setError(String key, dynamic value) {
    final _$actionInfo =
        _$_BaseStoreActionController.startAction(name: '_BaseStore.setError');
    try {
      return super.setError(key, value);
    } finally {
      _$_BaseStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setInProgress(bool value) {
    final _$actionInfo = _$_BaseStoreActionController.startAction(
        name: '_BaseStore.setInProgress');
    try {
      return super.setInProgress(value);
    } finally {
      _$_BaseStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
errors: ${errors},
isInprogress: ${isInprogress},
hasError: ${hasError}
    ''';
  }
}
