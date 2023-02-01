import 'package:injectable/injectable.dart';

import '../router/app_router.gr.dart';
import 'di.config.dart';
import 'locator.dart';

@InjectableInit(
  initializerName: r'$configureDependencies',
  preferRelativeImports: true,
  asExtension: false,
  ignoreUnregisteredTypes: [AppRouter],
)
Future<void> configureDependencies() async {
  locator.registerSingleton<AppRouter>(AppRouter());
  $configureDependencies(locator);
}
