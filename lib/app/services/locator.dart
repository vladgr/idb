import 'package:idb/app/services/logger_service.dart';
import 'package:idb/app/services/navigation_service.dart';
import 'package:idb/app/services/scaffold_service.dart';
import 'package:idb/app/services/sentry_service.dart';
import 'package:idb/app/services/storage_service.dart';
import 'package:idb/app/stores/layout_store.dart';
import 'package:idb/app/stores/user_store.dart';
import 'package:get_it/get_it.dart';

void setupLocator() {
  GetIt locator = GetIt.instance;

  // Factories
  locator.registerFactory<SentryService>(() => SentryService());

  // Singletons that used in AppRouteDelegate and should be registered earlier
  locator.registerSingleton<LoggerService>(LoggerService());
  locator.registerSingleton<NavigationService>(NavigationService());

  // Singletons
  locator.registerSingleton<ScaffoldService>(ScaffoldService());
  locator.registerSingleton<StorageService>(StorageService());

  // Stores

  locator.registerLazySingleton<LayoutStore>(() => LayoutStore());
  locator.registerLazySingleton<UserStore>(() => UserStore());
}
