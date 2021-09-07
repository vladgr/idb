import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:idb/app/stores/item_store.dart';
import 'package:idb/app/stores/layout_store.dart';
import 'package:idb/app/stores/search_store.dart';
import 'package:idb/app/stores/user_store.dart';
import 'package:idb/app/widgets/shortcuts/intents.dart';
import 'package:idb/app/widgets/shortcuts/keysets.dart';

/// Global keyboard shortcuts using FocusableActionDetector
class AppShortcuts extends StatelessWidget {
  final Widget child;

  AppShortcuts({
    Key? key,
    required this.child,
  }) : super(key: key);

  final _item = GetIt.I<ItemStore>();
  final _layout = GetIt.I<LayoutStore>();
  final _search = GetIt.I<SearchStore>();
  final _user = GetIt.I<UserStore>();

  void _onPressClear() => _search.clear();

  Future<void> _onPressSave() async {
    if (_user.isAdmin) {
      final item = _item.selectedItem;
      if (item != null && _item.isEditModeEnabled) {
        _item.updateItemFromUI(item);
      }
    }
  }

  void _onPressToggleEditMode() {
    _item.toggleEditModeEnabled();

    if (_item.isEditModeEnabled) {
      _layout.contentFocusNode.requestFocus();
    }
  }

  // Num should be from 1 to 9
  void _onPressNum(int num) {
    if (num >= 1 && num <= 9) {
      int index = num - 1;

      if (_item.map.length > index) {
        _item.setAndFetchItem(_item.map.values.toList()[index]);
      }
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
        KeySets.n6: N6ItemBoxIntent(),
        KeySets.n7: N7ItemBoxIntent(),
        KeySets.n8: N8ItemBoxIntent(),
        KeySets.n9: N9ItemBoxIntent(),
      },
      actions: {
        ClearIntent: CallbackAction(onInvoke: (e) => _onPressClear()),
        SaveIntent: CallbackAction(onInvoke: (e) => _onPressSave()),
        ToggleEditModeIntent: CallbackAction(onInvoke: (e) => _onPressToggleEditMode()),
        N1ItemBoxIntent: CallbackAction(onInvoke: (e) => _onPressNum(1)),
        N2ItemBoxIntent: CallbackAction(onInvoke: (e) => _onPressNum(2)),
        N3ItemBoxIntent: CallbackAction(onInvoke: (e) => _onPressNum(3)),
        N4ItemBoxIntent: CallbackAction(onInvoke: (e) => _onPressNum(4)),
        N5ItemBoxIntent: CallbackAction(onInvoke: (e) => _onPressNum(5)),
        N6ItemBoxIntent: CallbackAction(onInvoke: (e) => _onPressNum(6)),
        N7ItemBoxIntent: CallbackAction(onInvoke: (e) => _onPressNum(7)),
        N8ItemBoxIntent: CallbackAction(onInvoke: (e) => _onPressNum(8)),
        N9ItemBoxIntent: CallbackAction(onInvoke: (e) => _onPressNum(9)),
      },
      child: child,
    );
  }
}
