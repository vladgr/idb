// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'layout_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LayoutStore on _LayoutStore, Store {
  Computed<double>? _$contentHeightComputed;

  @override
  double get contentHeight =>
      (_$contentHeightComputed ??= Computed<double>(() => super.contentHeight,
              name: '_LayoutStore.contentHeight'))
          .value;
  Computed<double>? _$safeAreaHeightComputed;

  @override
  double get safeAreaHeight =>
      (_$safeAreaHeightComputed ??= Computed<double>(() => super.safeAreaHeight,
              name: '_LayoutStore.safeAreaHeight'))
          .value;

  late final _$isLayoutReadyAtom =
      Atom(name: '_LayoutStore.isLayoutReady', context: context);

  @override
  bool get isLayoutReady {
    _$isLayoutReadyAtom.reportRead();
    return super.isLayoutReady;
  }

  @override
  set isLayoutReady(bool value) {
    _$isLayoutReadyAtom.reportWrite(value, super.isLayoutReady, () {
      super.isLayoutReady = value;
    });
  }

  late final _$isKeyboardVisibleAtom =
      Atom(name: '_LayoutStore.isKeyboardVisible', context: context);

  @override
  bool get isKeyboardVisible {
    _$isKeyboardVisibleAtom.reportRead();
    return super.isKeyboardVisible;
  }

  @override
  set isKeyboardVisible(bool value) {
    _$isKeyboardVisibleAtom.reportWrite(value, super.isKeyboardVisible, () {
      super.isKeyboardVisible = value;
    });
  }

  late final _$orientationAtom =
      Atom(name: '_LayoutStore.orientation', context: context);

  @override
  Orientation? get orientation {
    _$orientationAtom.reportRead();
    return super.orientation;
  }

  @override
  set orientation(Orientation? value) {
    _$orientationAtom.reportWrite(value, super.orientation, () {
      super.orientation = value;
    });
  }

  late final _$widthAtom = Atom(name: '_LayoutStore.width', context: context);

  @override
  double get width {
    _$widthAtom.reportRead();
    return super.width;
  }

  @override
  set width(double value) {
    _$widthAtom.reportWrite(value, super.width, () {
      super.width = value;
    });
  }

  late final _$heightAtom = Atom(name: '_LayoutStore.height', context: context);

  @override
  double get height {
    _$heightAtom.reportRead();
    return super.height;
  }

  @override
  set height(double value) {
    _$heightAtom.reportWrite(value, super.height, () {
      super.height = value;
    });
  }

  late final _$paddingTopAtom =
      Atom(name: '_LayoutStore.paddingTop', context: context);

  @override
  double get paddingTop {
    _$paddingTopAtom.reportRead();
    return super.paddingTop;
  }

  @override
  set paddingTop(double value) {
    _$paddingTopAtom.reportWrite(value, super.paddingTop, () {
      super.paddingTop = value;
    });
  }

  late final _$isMobileAtom =
      Atom(name: '_LayoutStore.isMobile', context: context);

  @override
  bool get isMobile {
    _$isMobileAtom.reportRead();
    return super.isMobile;
  }

  @override
  set isMobile(bool value) {
    _$isMobileAtom.reportWrite(value, super.isMobile, () {
      super.isMobile = value;
    });
  }

  late final _$isTabletAtom =
      Atom(name: '_LayoutStore.isTablet', context: context);

  @override
  bool get isTablet {
    _$isTabletAtom.reportRead();
    return super.isTablet;
  }

  @override
  set isTablet(bool value) {
    _$isTabletAtom.reportWrite(value, super.isTablet, () {
      super.isTablet = value;
    });
  }

  late final _$isDesktopAtom =
      Atom(name: '_LayoutStore.isDesktop', context: context);

  @override
  bool get isDesktop {
    _$isDesktopAtom.reportRead();
    return super.isDesktop;
  }

  @override
  set isDesktop(bool value) {
    _$isDesktopAtom.reportWrite(value, super.isDesktop, () {
      super.isDesktop = value;
    });
  }

  late final _$versionAtom =
      Atom(name: '_LayoutStore.version', context: context);

  @override
  String get version {
    _$versionAtom.reportRead();
    return super.version;
  }

  @override
  set version(String value) {
    _$versionAtom.reportWrite(value, super.version, () {
      super.version = value;
    });
  }

  late final _$initAsyncAction =
      AsyncAction('_LayoutStore.init', context: context);

  @override
  Future<void> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  late final _$_LayoutStoreActionController =
      ActionController(name: '_LayoutStore', context: context);

  @override
  void setOrientation(Orientation value) {
    final _$actionInfo = _$_LayoutStoreActionController.startAction(
        name: '_LayoutStore.setOrientation');
    try {
      return super.setOrientation(value);
    } finally {
      _$_LayoutStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setWidth(double value) {
    final _$actionInfo = _$_LayoutStoreActionController.startAction(
        name: '_LayoutStore.setWidth');
    try {
      return super.setWidth(value);
    } finally {
      _$_LayoutStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setHeight(double value) {
    final _$actionInfo = _$_LayoutStoreActionController.startAction(
        name: '_LayoutStore.setHeight');
    try {
      return super.setHeight(value);
    } finally {
      _$_LayoutStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPaddingTop(double value) {
    final _$actionInfo = _$_LayoutStoreActionController.startAction(
        name: '_LayoutStore.setPaddingTop');
    try {
      return super.setPaddingTop(value);
    } finally {
      _$_LayoutStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setKeyboardVisibility(bool value) {
    final _$actionInfo = _$_LayoutStoreActionController.startAction(
        name: '_LayoutStore.setKeyboardVisibility');
    try {
      return super.setKeyboardVisibility(value);
    } finally {
      _$_LayoutStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBreakpoints(double w) {
    final _$actionInfo = _$_LayoutStoreActionController.startAction(
        name: '_LayoutStore.setBreakpoints');
    try {
      return super.setBreakpoints(w);
    } finally {
      _$_LayoutStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLayoutReady: ${isLayoutReady},
isKeyboardVisible: ${isKeyboardVisible},
orientation: ${orientation},
width: ${width},
height: ${height},
paddingTop: ${paddingTop},
isMobile: ${isMobile},
isTablet: ${isTablet},
isDesktop: ${isDesktop},
version: ${version},
contentHeight: ${contentHeight},
safeAreaHeight: ${safeAreaHeight}
    ''';
  }
}
