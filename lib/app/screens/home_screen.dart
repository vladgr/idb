import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:idb/app/screens/splash_screen.dart';
import 'package:idb/app/services/l.dart';
import 'package:idb/app/services/logger_service.dart';
import 'package:idb/app/stores/item_store.dart';
import 'package:idb/app/stores/layout_store.dart';
import 'package:idb/app/stores/tag_store.dart';
import 'package:idb/app/stores/user_store.dart';
import 'package:idb/app/widgets/dashboard/content/content_col.dart';
import 'package:idb/app/widgets/dashboard/items/create_item_button.dart';
import 'package:idb/app/widgets/dashboard/items/items_col.dart';
import 'package:idb/app/widgets/dashboard/navbar/navbar.dart';
import 'package:idb/app/widgets/dashboard/tags/tags_col.dart';
import 'package:idb/app/widgets/dashboard/tags/tags_drawer.dart';
import 'package:idb/app/widgets/layout/br.dart';
import 'package:idb/app/widgets/layout/empty.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _item = GetIt.I<ItemStore>();
  final _layout = GetIt.I<LayoutStore>();
  final _logger = GetIt.I<LoggerService>();
  final _tag = GetIt.I<TagStore>();
  final _user = GetIt.I<UserStore>();

  @override
  void initState() {
    super.initState();
    _logger.debug('HomeScreen inited');
  }

  @override
  void dispose() {
    _logger.debug('HomeScreen disposed');
    super.dispose();
  }

  Widget _wItemsCol() {
    if (_layout.isMobile && _item.hasSelectedItem) {
      return Empty();
    }

    if (_layout.isMobile) {
      return Expanded(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: L.v(20)),
          child: ItemsCol(),
        ),
      );
    }

    return Container(
      width: L.v(300),
      margin: EdgeInsets.only(left: L.v(20)),
      child: ItemsCol(),
    );
  }

  Widget _wContentCol() {
    if (_layout.isMobile && !_item.hasSelectedItem) {
      return Empty();
    }

    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: L.v(20)),
        child: ContentCol(),
      ),
    );
  }

  Widget _wTagsCol() {
    if (_layout.isDesktop) {
      return Container(
        width: L.v(180),
        margin: EdgeInsets.only(right: L.v(20)),
        child: TagsCol(),
      );
    }
    return Empty();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (BuildContext context) {
      if (_user.isAuthenticated == false || _user.profile == null || _tag.map.isEmpty) {
        return SplashScreen();
      }

      return Scaffold(
        endDrawer: _layout.isDesktop ? null : TagsDrawer(),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: CreateItemButton(),
        body: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Column(
            children: <Widget>[
              Navbar(),
              BR(L.v(20)),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _wItemsCol(),
                  _wContentCol(),
                  _wTagsCol(),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
