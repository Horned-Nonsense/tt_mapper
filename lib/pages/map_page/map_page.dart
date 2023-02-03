import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tt_mapper/pages/map_page/views/mapper_drawer.dart';

import '../../config/di/locator.dart';
import '../../cubit/map_page/map_page_cubit.dart';

class MapPage extends StatefulWidget implements AutoRouteWrapper {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<MapPageCubit>(),
      child: this,
    );
  }
}

void _onStateChanged(
  BuildContext context,
  MapPageState state,
) {
  switch (state.status) {
    case MapPageStatus.error:
      break;
    case MapPageStatus.initial:
    case MapPageStatus.loading:
    case MapPageStatus.success:
      break;
  }
}

class _MapPageState extends State<MapPage> {
  MapPageCubit get cubit => context.read();

  final Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    cubit.goToCurrentUserPosition(_controller);
    return BlocConsumer<MapPageCubit, MapPageState>(
      listener: _onStateChanged,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Mapper"),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () async {
                  await cubit.goToCurrentUserPosition(_controller);
                },
                icon: const Icon(Icons.local_activity),
              ),
            ],
            backgroundColor: Colors.deepPurpleAccent,
          ),
          body: _buildMap(state),
          drawer: MapperDrawer(
            user: state.currentUser,
            onTap: cubit.signOut,
          ),
        );
      },
    );
  }

  Widget _buildMap(MapPageState state) {
    final initLocation = state.currentUser.location ??
        const LatLng(
          20.42796133580664,
          80.885749655962,
        );
        
    final Set<Marker> allMarkers = {};
    allMarkers
      ..addAll(state.markers)
      ..addAll(state.usersAround);

    return GoogleMap(
      mapToolbarEnabled: false,
      zoomGesturesEnabled: true,
      initialCameraPosition: CameraPosition(
        target: LatLng(initLocation.latitude, initLocation.longitude),
        zoom: 1.0,
      ),
      markers: allMarkers,
      mapType: MapType.normal,
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
    );
  }
}
