import 'package:idb/app/constants/constants.dart';
import 'package:idb/app/services/l.dart';
import 'package:idb/app/stores/user_store.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';

part 'layout_store.g.dart';

class LayoutStore = _LayoutStore with _$LayoutStore;

abstract class _LayoutStore with Store {
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

  // Returns content height: for screens with standard app bar.
  @computed
  double get contentHeight {
    return this.height - L.appBarHeight - this.paddingTop;
  }

  @computed
  double get safeAreaHeight {
    return this.height - this.paddingTop;
  }

  // Init all stores, that require init
  @action
  Future<void> init() async {
    final user = GetIt.I<UserStore>();

    await user.checkLocalToken();

    this.isLayoutReady = true;
  }

  @action
  void setOrientation(Orientation value) {
    this.orientation = value;
  }

  @action
  void setWidth(double value) {
    this.width = value;
  }

  @action
  void setHeight(double value) {
    this.height = value;
  }

  @action
  void setPaddingTop(double value) {
    this.paddingTop = value;
  }

  @action
  void setKeyboardVisibility(bool value) {
    this.isKeyboardVisible = value;
  }

  @action
  void setBreakpoints(double w) {
    this.isMobile = w < kTabletBreakpoint ? true : false;

    this.isTablet =
        (w >= kTabletBreakpoint && w < kDesktopBreakpoint) ? true : false;

    this.isDesktop = w >= kDesktopBreakpoint ? true : false;
  }
}

