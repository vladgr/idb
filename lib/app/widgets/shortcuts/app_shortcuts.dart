import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:idb/app/stores/item_store.dart';
import 'package:idb/app/stores/search_store.dart';
import 'package:idb/app/widgets/shortcuts/intents.dart';
import 'package:idb/app/widgets/shortcuts/keysets.dart';

/// To simplify keyboard shortcuts, use all keybindings in single class.
/// In that case there is no need to manage focus for different widgets.
/// Use this wrapper in NavbarSearch and ContentBoxEditMode,
/// only these widgets have focus.
class AppShortcuts extends StatelessWidget {
  final Widget child;

  AppShortcuts({
    Key? key,
    required this.child,
  }) : super(key: key);

  final _item = GetIt.I<ItemStore>();
  final _search = GetIt.I<SearchStore>();

  void _onPressClear() => _search.clear();

  Future<void> _onPressSave() async {
    final item = _item.selectedItem;
    if (item != null && _item.isEditModeEnabled) {
      _item.updateItemFromUI(item);
    }
  }

  void _onPressToggleEditMode() => _item.toggleEditModeEnabled();

  void _onPress1() {
    if (_item.map.length > 0) {
      _item.setAndFetchItem(_item.map.values.toList()[0]);
    }
  }

  void _onPress2() {
    if (_item.map.length > 1) {
      _item.setAndFetchItem(_item.map.values.toList()[1]);
    }
  }

  void _onPress3() {
    if (_item.map.length > 2) {
      _item.setAndFetchItem(_item.map.values.toList()[2]);
    }
  }

  void _onPress4() {
    if (_item.map.length > 3) {
      _item.setAndFetchItem(_item.map.values.toList()[3]);
    }
  }

  void _onPress5() {
    if (_item.map.length > 4) {
      _item.setAndFetchItem(_item.map.values.toList()[4]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FocusableActionDetector(
      autofocus: true,
      shortcuts: {
        KeySets.clear: ClearIntent(),
        KeySets.save: SaveIntent(),
        KeySets.toggleEditMode: ToggleEditModeIntent(),
        KeySets.n1: N1ItemBoxIntent(),
        KeySets.n2: N2ItemBoxIntent(),
        KeySets.n3: N3ItemBoxIntent(),
        KeySets.n4: N4ItemBoxIntent(),
        KeySets.n5: N5ItemBoxIntent(),
      },
      actions: {
        ClearIntent: CallbackAction(onInvoke: (e) => _onPressClear.call()),
        SaveIntent: CallbackAction(onInvoke: (e) => _onPressSave.call()),
        ToggleEditModeIntent: CallbackAction(onInvoke: (e) => _onPressToggleEditMode.call()),
        N1ItemBoxIntent: CallbackAction(onInvoke: (e) => _onPress1.call()),
        N2ItemBoxIntent: CallbackAction(onInvoke: (e) => _onPress2.call()),
        N3ItemBoxIntent: CallbackAction(onInvoke: (e) => _onPress3.call()),
        N4ItemBoxIntent: CallbackAction(onInvoke: (e) => _onPress4.call()),
        N5ItemBoxIntent: CallbackAction(onInvoke: (e) => _onPress5.call()),
      },
      child: child,
    );
  }
}
