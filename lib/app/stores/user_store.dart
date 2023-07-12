import 'dart:async';
import 'dart:ui';

import 'package:idb/app/config.dart';
import 'package:idb/app/models/user.dart';
import 'package:idb/app/services/api.dart';
import 'package:idb/app/services/token.dart';
import 'package:idb/app/stores/base_store.dart';
import 'package:mobx/mobx.dart';

part 'user_store.g.dart';

// ignore: library_private_types_in_public_api
class UserStore = _UserStore with _$UserStore;

abstract class _UserStore extends BaseStore with Store {
  @observable
  bool? isAuthenticated;

  @observable
  User? profile;

  @observable
  String? accessToken;

  @observable
  List<User> users = [];

  @computed
  bool get isAdmin {
    if (profile == null) return false;
    return profile!.isAdmin ? true : false;
  }

  @action
  void clear() {
    isInprogress = false;
  }

  @action
  Future<void> init() async {
    await fetchProfile();
    await fetchUsers();
  }

  // Check token locally
  // Used in Root widget when app started
  @action
  Future<void> checkLocalToken() async {
    var token = await Token.getToken();
    if (token == null) {
      accessToken = null;
      isAuthenticated = false;
    } else {
      accessToken = token;
      isAuthenticated = true;
    }
  }

  @action
  Future<void> logout() async {
    await Token.removeToken();
    accessToken = null;
    isAuthenticated = false;

    Timer(Duration(seconds: 3), () {
      profile = null;
    });
  }

  @action
  Future<void> login(dynamic data, VoidCallback onSuccess) async {
    isInprogress = true;
    errors = null;

    var result = await apiCall(Config.apiLoginUrl, 'POST', data, false);
    if (result.isError) {
      errors = result.data;
    } else {
      Token.setToken(result.data['token']);
      accessToken = result.data['token'];
      isAuthenticated = true;

      onSuccess();
    }

    isInprogress = false;
  }

  @action
  Future<void> fetchProfile() async {
    isInprogress = true;
    errors = null;

    var result = await apiCall(Config.apiProfileUrl, 'GET', {}, true);
    if (result.isError) {
      logout();
    } else {
      profile = User.fromJson(result.data);
    }

    isInprogress = false;
  }

  @action
  Future<void> fetchUsers() async {
    var result = await apiCall(Config.apiUsersUrl, 'GET', {}, true);
    if (!result.isError) {
      var l = <User>[];
      for (var d in result.data) {
        l.add(User.fromJson(d));
      }

      users = l;
    }
  }
}
