// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:tt_mapper/config/router/app_router.gr.dart' as _i3;
import 'package:tt_mapper/config/router/mapper_router.dart' as _i6;
import 'package:tt_mapper/cubit/app_control/app_control_cubit.dart' as _i10;
import 'package:tt_mapper/cubit/login_page/login_page_cubit.dart' as _i5;
import 'package:tt_mapper/services/account_service.dart' as _i9;
import 'package:tt_mapper/services/auth_service.dart' as _i4;
import 'package:tt_mapper/services/user_service/user_firestore_service.dart'
    as _i8;
import 'package:tt_mapper/services/user_service/user_service.dart' as _i7;

import 'modules/router_module.dart' as _i11;

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of main-scope dependencies inside of [GetIt]
_i1.GetIt $configureDependencies(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final routerModule = _$RouterModule();
  gh.singleton<_i3.AppRouter>(routerModule.appRouter);
  gh.singleton<_i4.AuthService>(_i4.AuthService());
  gh.factory<_i5.LoginPageCubit>(
      () => _i5.LoginPageCubit(gh<_i4.AuthService>()));
  gh.singleton<_i6.NotaroRouter>(_i6.NotaroRouter(gh<_i3.AppRouter>()));
  gh.factory<_i7.UserService>(
    () => _i8.UserFirestoreService(),
    instanceName: 'UserFirestoreService',
  );
  gh.singleton<_i9.AccountService>(_i9.AccountService(gh<_i4.AuthService>()));
  gh.factory<_i10.AppControlCubit>(
      () => _i10.AppControlCubit(gh<_i4.AuthService>()));
  return getIt;
}

class _$RouterModule extends _i11.RouterModule {}
