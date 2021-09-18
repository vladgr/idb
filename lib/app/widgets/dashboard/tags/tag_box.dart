import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:idb/app/config.dart';
import 'package:idb/app/models/tag.dart';
import 'package:idb/app/services/l.dart';
import 'package:idb/app/services/ts.dart';
import 'package:idb/app/stores/layout_store.dart';
import 'package:idb/app/stores/tag_store.dart';
import 'package:idb/app/widgets/layout/tap_wrapper.dart';

class TagBox extends StatelessWidget {
  final Tag tag;
  final bool isActive;

  const TagBox({
    Key? key,
    required this.tag,
    required this.isActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _layout = GetIt.I<LayoutStore>();
    final _tag = GetIt.I<TagStore>();

    return TapWrapper(
      onPressed: () {
        _tag.toggleTag(tag);

        if (_layout.isDesktop) {
          _layout.searchFocusNode.requestFocus();
        }
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: L.v(10), vertical: L.v(6)),
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(width: L.v(1), color: Colors.black12),
            top: BorderSide(width: L.v(0.5), color: Colors.black12),
            right: BorderSide(width: L.v(1), color: Colors.black12),
            bottom: BorderSide(width: L.v(0.5), color: Colors.black12),
          ),
          color: isActive ? Config.gray125Color : Colors.white,
        ),
        child: Text(
          tag.name,
          style: Ts.text14(isActive ? Colors.white : Config.gray108Color),
        ),
      ),
    );
  }
}
