import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:idb/app/config.dart';
import 'package:idb/app/screens/splash_screen.dart';
import 'package:idb/app/services/logger_service.dart';
import 'package:idb/app/stores/user_store.dart';
import 'package:idb/app/widgets/dashboard/content_col.dart';
import 'package:idb/app/widgets/dashboard/items_col.dart';
import 'package:idb/app/widgets/dashboard/navbar/navbar.dart';
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

    bootstrapGridParameters(gutterSize: 0);
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

      return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
          backgroundColor: Config.primaryColor,
          foregroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: BootstrapContainer(
            fluid: true,
            children: <Widget>[
              Navbar(),
              BootstrapRow(
                height: 60,
                children: <BootstrapCol>[
                  BootstrapCol(
                    sizes: 'col-xl-2 col-lg-3 col-md-4 col-sm-12',
                    child: ItemsCol(),
                  ),
                  BootstrapCol(
                    sizes: 'col-xl-8 col-lg-7 col-md-8 col-sm-12',
                    child: ContentCol(),
                  ),
                  BootstrapCol(
                    sizes: 'col-xl-2 col-lg-2 col-md-12 col-sm-12',
                    invisibleForSizes: 'xs sm md',
                    child: TagsCol(),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
