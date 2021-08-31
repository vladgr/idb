import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:idb/app/config.dart';
import 'package:idb/app/screens/splash_screen.dart';
import 'package:idb/app/services/l.dart';
import 'package:idb/app/services/logger_service.dart';
import 'package:idb/app/stores/user_store.dart';
import 'package:idb/app/widgets/dashboard/content_col.dart';
import 'package:idb/app/widgets/dashboard/items_col.dart';
import 'package:idb/app/widgets/dashboard/navbar.dart';
import 'package:idb/app/widgets/dashboard/tags_col.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _logger = GetIt.I<LoggerService>();
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

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (BuildContext context) {
      if (_user.isAuthenticated == false || _user.profile == null) {
        return SplashScreen();
      }

      return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                AppTopNavbar(),
                Row(
                  children: [
                    SizedBox(
                      width: L.v(250),
                      child: ItemsCol(),
                    ),
                    Expanded(
                      flex: 7,
                      child: ContentCol(),
                    ),
                    Expanded(
                      flex: 2,
                      child: TagsCol(),
                    ),
                  ],
                ),
              ],
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: Icon(Icons.add),
            backgroundColor: Config.primaryColor,
            foregroundColor: Colors.white,
          ),
        ),
      );
    });
  }
}
