import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';

import '../../models/mapper_user.dart';
import '../../services/account_service.dart';
import '../../services/auth_service.dart';
import '../../services/user_service/user_firestore_service.dart';
import '../../services/user_service/user_service.dart';
import '../core/base_cubit.dart';

part 'map_page_state.dart';

@injectable
class MapPageCubit extends BaseCubit<MapPageState> {
  final AuthService _authService;
  final AccountService _accountService;
  final UserService _userService;
  late final StreamSubscription<List> _usersAroundSubscription;

  MapPageCubit(
    this._authService,
    this._accountService,
    @Named.from(UserFirestoreService) this._userService,
  ) : super(const MapPageState(
          status: MapPageStatus.initial,
        )) {
    init();
  }

  Future<void> init() async {
    _getCurrenUsers();

    _usersAroundSubscription =
        _userService.getUsersAround().listen(_getUsersAround);
  }

  Future<void> goToCurrentUserPosition(
      Completer<GoogleMapController> completer) async {
    await _accountService.getCurrentUserLocation();

    final currentUserLocation = state.currentUser.location;
    final GoogleMapController controller = await completer.future;

    await makeErrorHandledCall(() async {
      if (currentUserLocation != null) {
        await _getCurrentUserMarker(LatLng(
            currentUserLocation.latitude, currentUserLocation.longitude));

        CameraPosition cameraPosition = CameraPosition(
          target: LatLng(
              currentUserLocation.latitude, currentUserLocation.longitude),
          zoom: 14,
        );

        controller
            .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
      }
    });
  }

  Future<void> _getCurrenUsers() async {
    emit(state.copyWith(status: MapPageStatus.loading));

    await makeErrorHandledCall(() async {
      final currentUser = await _accountService.getUsersData();
      emit(state.copyWith(
        status: MapPageStatus.success,
        currentUser: currentUser,
      ));
    });
  }

  Future<void> _getCurrentUserMarker(LatLng showLocation) async {
    emit(state.copyWith(status: MapPageStatus.loading));

    Set<Marker> markers = Set.from(state.markers);
    final currentUser = state.currentUser;

    final marker = Marker(
      markerId: MarkerId(showLocation.toString()),
      position: showLocation,
      infoWindow: InfoWindow(
        title: currentUser.fullName,
      ),
      icon: BitmapDescriptor.defaultMarker,
    );

    await makeErrorHandledCall(() async {
      markers
        ..clear()
        ..add(marker);

      emit(state.copyWith(
        status: MapPageStatus.success,
        markers: markers,
      ));
    });
  }

  Future<void> _getUsersAround(List<MapperUser> usersAroundFromStream) async {
    final currentUserLocation = state.currentUser.location;
    final Set<Marker> usersAround = {};

    await makeErrorHandledCall(() async {
      for (final user in usersAroundFromStream) {
        final userLocation = user.location;
        if (currentUserLocation != null && userLocation != null) {
          if (currentUserLocation.latitude - userLocation.latitude < 0.00001 ||
              currentUserLocation.latitude - userLocation.latitude > -0.00001) {
            usersAround.add(
              Marker(
                markerId: MarkerId(userLocation.toString()),
                position: userLocation,
                infoWindow: InfoWindow(
                  title: user.fullName,
                ),
                icon: BitmapDescriptor.defaultMarker,
              ),
            );
          }
        }
      }
      emit(state.copyWith(
        status: MapPageStatus.success,
        usersAround: usersAround,
      ));
    });
  }

  Future<void> signOut() async {
    _authService.signOut();
  }

  @override
  void handleError(String errorMessage) {
    emit(state.copyWith(
      status: MapPageStatus.error,
      errorMessage: errorMessage,
    ));
  }

  @override
  Future<void> close() {
    _usersAroundSubscription.cancel();
    return super.close();
  }
}
