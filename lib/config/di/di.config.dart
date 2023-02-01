// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:tt_mapper/config/router/app_router.gr.dart' as _i5;
import 'package:tt_mapper/config/router/mapper_router.dart' as _i4;
import 'package:tt_mapper/cubit/app_control/app_control_cubit.dart' as _i9;
import 'package:tt_mapper/services/account_service.dart' as _i8;
import 'package:tt_mapper/services/auth_service.dart' as _i3;
import 'package:tt_mapper/services/user_service/user_firestore_service.dart'
    as _i7;
import 'package:tt_mapper/services/user_service/user_service.dart' as _i6;

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
  gh.singleton<_i3.AuthService>(_i3.AuthService());
  gh.singleton<_i4.NotaroRouter>(_i4.NotaroRouter(gh<_i5.AppRouter>()));
  gh.factory<_i6.UserService>(
    () => _i7.UserFirestoreService(),
    instanceName: 'UserFirestoreService',
  );
  gh.singleton<_i8.AccountService>(_i8.AccountService(gh<_i3.AuthService>()));
  gh.singleton<_i9.AppControlCubit>(_i9.AppControlCubit(gh<_i3.AuthService>()));
  return getIt;
}
