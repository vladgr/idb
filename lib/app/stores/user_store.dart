import 'dart:async';
import 'dart:ui';

import 'package:idb/app/config.dart';
import 'package:idb/app/models/user.dart';
import 'package:idb/app/services/api.dart';
import 'package:idb/app/services/token.dart';
import 'package:idb/app/stores/base_store.dart';
import 'package:mobx/mobx.dart';

part 'user_store.g.dart';

class UserStore = _UserStore with _$UserStore;

abstract class _UserStore extends BaseStore with Store {
  @observable
  bool? isAuthenticated;

  @observable
  User? profile;

  @observable
  String? accessToken;

  @action
  void clear() {
    this.isInprogress = false;
  }

  @action
  Future<void> tempAuth() async {
    await Future.delayed(Duration(milliseconds: 200), () async {
      await Token.setToken('test');
      this.accessToken = 'test';
      this.isAuthenticated = true;
    });
  }

  @action
  Future<void> init() async {
    await this.getProfile();
  }

  // Check token locally
  // Used in Root widget when app started
  @action
  Future<void> checkLocalToken() async {
    var token = await Token.getToken();
    if (token == null) {
      this.accessToken = null;
      this.isAuthenticated = false;
    } else {
      this.accessToken = token;
      this.isAuthenticated = true;
    }
  }

  @action
  Future<void> logout() async {
    await Token.removeToken();
    this.accessToken = null;
    this.isAuthenticated = false;

    Timer(Duration(seconds: 3), () {
      this.profile = null;
    });
  }

  @action
  Future<void> login(dynamic data, VoidCallback onSuccess) async {
    this.isInprogress = true;
    this.errors = null;

    var result = await apiCall(Config.apiLoginUrl, 'POST', data, false);
    if (result.isError) {
      this.errors = result.data;
    } else {
      Token.setToken(result.data['token']);
      this.accessToken = result.data['token'];
      this.isAuthenticated = true;

      onSuccess();
    }

    this.isInprogress = false;
  }

  @action
  Future<void> getProfile() async {
    this.profile = User();
    // this.isInprogress = true;
    // this.errors = null;

    // var result = await apiCall(Config.apiProfileUrl, 'GET', {}, true);
    // if (result.isError) {
    //   this.logout();
    // } else {
    //   this.profile = User.fromJson(result.data);
    // }

    // this.isInprogress = false;
  }

  @action
  Future<void> editProfile(dynamic data, VoidCallback onSuccess) async {
    // this.isInprogress = true;
    // this.errors = null;

    // var result = await apiCall(Config.apiProfileUrl, 'PATCH', data, true);
    // if (result.isError) {
    //   this.errors = result.data;
    // } else {
    //   this.profile = User.fromJson(result.data);
    //   onSuccess();
    // }

    // this.isInprogress = false;
  }

  @action
  Future<void> changePassword(dynamic data, VoidCallback onSuccess) async {
    // this.isInprogress = true;
    // this.errors = null;

    // var result = await apiCall(Config.apiChangePasswordUrl, 'POST', data, true);
    // if (result.isError) {
    //   this.errors = result.data;
    // } else {
    //   onSuccess();
    // }

    // this.isInprogress = false;
  }
}
