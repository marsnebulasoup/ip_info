part of 'ip_info_bloc.dart';

enum IpInfoStatus { initial, success, failure }

class IpInfoState extends Equatable {
  final IpInfoStatus status;
  final IpInfo ipInfo;

  const IpInfoState({
    this.status = IpInfoStatus.initial,
    this.ipInfo = const IpInfo(
      ipAddress: "Unknown",
      internetProvider: "Unknown",
      location: Location(city: "Unknown", region: "Unknown"),
      coordinates: LatLng(latitude: 0, longitude: 0),
    ),
  });

  IpInfoState copyWith({
    IpInfoStatus? status,
    IpInfo? ipInfo,
  }) {
    return IpInfoState(
      status: status ?? this.status,
      ipInfo: ipInfo ?? this.ipInfo,
    );
  }

  @override
  List<Object> get props => [status, ipInfo];
}
