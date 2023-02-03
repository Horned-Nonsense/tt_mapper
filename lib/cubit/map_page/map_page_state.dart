part of 'map_page_cubit.dart';

//TODO: Change statuses on better
enum MapPageStatus {
  initial,
  loading,
  error,
  success;

  bool get isInitial => this == MapPageStatus.initial;
  bool get isLoading => this == MapPageStatus.loading;
  bool get isError => this == MapPageStatus.error;
  bool get isSuccess => this == MapPageStatus.success;
}

class MapPageState extends Equatable {
  final MapPageStatus status;
  final String errorMessage;
  final Set<Marker> markers;
  final MapperUser currentUser;
  final Set<Marker> usersAround;

  const MapPageState({
    required this.status,
    this.errorMessage = '',
    this.markers = const {},
    this.currentUser = const MapperUser.empty(),
    this.usersAround = const {},
  });

  MapPageState copyWith({
    MapPageStatus? status,
    String? errorMessage,
    Set<Marker>? markers,
    MapperUser? currentUser,
    Set<Marker>? usersAround,
  }) {
    return MapPageState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      markers: markers ?? this.markers,
      currentUser: currentUser ?? this.currentUser,
      usersAround: usersAround ?? this.usersAround,
    );
  }

  @override
  List<Object?> get props => [
        status,
        errorMessage,
        markers,
        currentUser,
        usersAround,
      ];
}
