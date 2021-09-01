import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:idb/app/config.dart';
import 'package:idb/app/constants/constants.dart';
import 'package:idb/app/screens/splash_screen.dart';
import 'package:idb/app/services/l.dart';
import 'package:idb/app/services/logger_service.dart';
import 'package:idb/app/stores/layout_store.dart';
import 'package:idb/app/stores/tag_store.dart';
import 'package:idb/app/stores/user_store.dart';
import 'package:idb/app/widgets/dashboard/content/content_col.dart';
import 'package:idb/app/widgets/dashboard/items/items_col.dart';
import 'package:idb/app/widgets/dashboard/navbar/navbar.dart';
import 'package:idb/app/widgets/dashboard/tags/tags_col.dart';
import 'package:idb/app/widgets/layout/br.dart';
import 'package:idb/app/widgets/layout/empty.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
    if (_layout.width < kTabletBreakpoint) {
      return Empty();
    }

    return Container(
      width: L.v(300),
      margin: EdgeInsets.only(left: L.v(20)),
      child: ItemsCol(),
    );
  }

  Widget _wContentCol() {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: L.v(20)),
        child: ContentCol(),
      ),
    );
  }

  Widget _wTagsCol() {
    if (_layout.width < kDesktopBreakpoint) {
      return Empty();
    }

    return Container(
      width: L.v(180),
      margin: EdgeInsets.only(right: L.v(20)),
      child: TagsCol(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (BuildContext context) {
      if (_user.isAuthenticated == false || _user.profile == null || _tag.map.isEmpty) {
        return SplashScreen();
      }

      return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
          backgroundColor: Config.primaryColor,
          foregroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
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
