import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:idb/app/config.dart';
import 'package:idb/app/services/l.dart';
import 'package:idb/app/services/ts.dart';
import 'package:idb/app/stores/layout_store.dart';
import 'package:idb/app/stores/search_store.dart';

class NavbarSearch extends StatefulWidget {
  const NavbarSearch({Key? key}) : super(key: key);

  @override
  _NavbarSearchState createState() => _NavbarSearchState();
}

class _NavbarSearchState extends State<NavbarSearch> {
  final _layout = GetIt.I<LayoutStore>();
  final _search = GetIt.I<SearchStore>();

  @override
  void initState() {
    super.initState();
    _layout.searchController.text = _search.text;
    _layout.searchFocusNode.requestFocus();

    Timer.run(() {
      _layout.searchController.addListener(() {
        if (_layout.searchController.text != _search.text) {
          _search.setText(_layout.searchController.text);
        }
      });
    });
  }

  double get _width {
    return _layout.isMobile ? L.v(180) : L.v(350);
  }

  Widget _wSuffixIcon() {
    if (_search.text.isNotEmpty) {
      return IconButton(
        icon: Icon(
          CupertinoIcons.clear,
          color: Config.gray108Color,
          size: L.v(18),
        ),
        onPressed: () {
          _search.clear();
        },
      );
    }

    return Icon(
      CupertinoIcons.search,
      color: Config.gray108Color,
      size: L.v(18),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (BuildContext context) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: L.v(15)),
        child: PhysicalModel(
          color: Colors.transparent,
          shadowColor: Colors.black.withOpacity(0.2),
          elevation: 3.0,
          child: SizedBox(
            width: _width,
            height: L.v(40),
            child: TextField(
              focusNode: _layout.searchFocusNode,
              controller: _layout.searchController,
              cursorWidth: 1,
              cursorColor: Config.gray108Color,
              style: Ts.text14(Config.gray108Color),
              decoration: InputDecoration(
                hintText: 'Search',
                fillColor: Config.gray222Color,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(L.v(10)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Config.gray222Color, width: 0),
                  borderRadius: BorderRadius.circular(L.v(3)),
                ),
                focusedBorder: InputBorder.none,
                suffixIcon: _wSuffixIcon(),
              ),
            ),
          ),
        ),
      );
    });
  }
}
