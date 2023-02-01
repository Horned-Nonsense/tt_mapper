import 'package:injectable/injectable.dart';

import '../../router/app_router.gr.dart';

@module
abstract class RouterModule {
  @singleton
  AppRouter get appRouter => AppRouter();
}
