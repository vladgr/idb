import 'package:idb/app/constants/constants.dart';
import 'package:idb/app/services/l.dart';
import 'package:idb/app/stores/user_store.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

part 'layout_store.g.dart';

class LayoutStore = _LayoutStore with _$LayoutStore;

abstract class _LayoutStore with Store {
  // Controller for search TextField
  final searchController = TextEditingController();

  // Node for seach TextField
  final searchFocusNode = FocusNode();

  // Node for item content TextField
  final contentFocusNode = FocusNode();

  @observable
  bool isLayoutReady = false;

  @observable
  bool isKeyboardVisible = false;

  @observable
  Orientation? orientation;

  @observable
  double width = 0;

  @observable
  double height = 0;

  // Size of device padding top, before SafeArea starts
  @observable
  double paddingTop = 0;

  @observable
  bool isMobile = false;

  @observable
  bool isTablet = false;

  @observable
  bool isDesktop = false;

  @observable
  String version = '';

  // Returns content height: for screens with standard app bar.
  @computed
  double get contentHeight {
    return height - L.appBarHeight - paddingTop;
  }

  @computed
  double get safeAreaHeight {
    return height - paddingTop;
  }

  // Init all stores, that require init
  @action
  Future<void> init() async {
    final user = GetIt.I<UserStore>();

    await user.checkLocalToken();

    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    version = packageInfo.version;

    isLayoutReady = true;
  }

  @action
  void setOrientation(Orientation value) {
    orientation = value;
  }

  @action
  void setWidth(double value) {
    width = value;
  }

  @action
  void setHeight(double value) {
    height = value;
  }

  @action
  void setPaddingTop(double value) {
    paddingTop = value;
  }

  @action
  void setKeyboardVisibility(bool value) {
    isKeyboardVisible = value;
  }

  @action
  void setBreakpoints(double w) {
    isMobile = w < kTabletBreakpoint ? true : false;

    isTablet = (w >= kTabletBreakpoint && w < kDesktopBreakpoint) ? true : false;

    isDesktop = w >= kDesktopBreakpoint ? true : false;
  }
}
