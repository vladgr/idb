// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserStore on _UserStore, Store {
  final _$isAuthenticatedAtom = Atom(name: '_UserStore.isAuthenticated');

  @override
  bool? get isAuthenticated {
    _$isAuthenticatedAtom.reportRead();
    return super.isAuthenticated;
  }

  @override
  set isAuthenticated(bool? value) {
    _$isAuthenticatedAtom.reportWrite(value, super.isAuthenticated, () {
      super.isAuthenticated = value;
    });
  }

  final _$profileAtom = Atom(name: '_UserStore.profile');

  @override
  User? get profile {
    _$profileAtom.reportRead();
    return super.profile;
  }

  @override
  set profile(User? value) {
    _$profileAtom.reportWrite(value, super.profile, () {
      super.profile = value;
    });
  }

  final _$accessTokenAtom = Atom(name: '_UserStore.accessToken');

  @override
  String? get accessToken {
    _$accessTokenAtom.reportRead();
    return super.accessToken;
  }

  @override
  set accessToken(String? value) {
    _$accessTokenAtom.reportWrite(value, super.accessToken, () {
      super.accessToken = value;
    });
  }

  final _$tempAuthAsyncAction = AsyncAction('_UserStore.tempAuth');

  @override
  Future<void> tempAuth() {
    return _$tempAuthAsyncAction.run(() => super.tempAuth());
  }

  final _$initAsyncAction = AsyncAction('_UserStore.init');

  @override
  Future<void> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  final _$checkLocalTokenAsyncAction =
      AsyncAction('_UserStore.checkLocalToken');

  @override
  Future<void> checkLocalToken() {
    return _$checkLocalTokenAsyncAction.run(() => super.checkLocalToken());
  }

  final _$logoutAsyncAction = AsyncAction('_UserStore.logout');

  @override
  Future<void> logout() {
    return _$logoutAsyncAction.run(() => super.logout());
  }

  final _$loginAsyncAction = AsyncAction('_UserStore.login');

  @override
  Future<void> login(dynamic data, VoidCallback onSuccess) {
    return _$loginAsyncAction.run(() => super.login(data, onSuccess));
  }

  final _$getProfileAsyncAction = AsyncAction('_UserStore.getProfile');

  @override
  Future<void> getProfile() {
    return _$getProfileAsyncAction.run(() => super.getProfile());
  }

  final _$editProfileAsyncAction = AsyncAction('_UserStore.editProfile');

  @override
  Future<void> editProfile(dynamic data, VoidCallback onSuccess) {
    return _$editProfileAsyncAction
        .run(() => super.editProfile(data, onSuccess));
  }

  final _$changePasswordAsyncAction = AsyncAction('_UserStore.changePassword');

  @override
  Future<void> changePassword(dynamic data, VoidCallback onSuccess) {
    return _$changePasswordAsyncAction
        .run(() => super.changePassword(data, onSuccess));
  }

  final _$_UserStoreActionController = ActionController(name: '_UserStore');

  @override
  void clear() {
    final _$actionInfo =
        _$_UserStoreActionController.startAction(name: '_UserStore.clear');
    try {
      return super.clear();
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isAuthenticated: ${isAuthenticated},
profile: ${profile},
accessToken: ${accessToken}
    ''';
  }
}
