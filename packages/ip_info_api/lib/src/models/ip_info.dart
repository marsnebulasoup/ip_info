import 'package:equatable/equatable.dart';
import 'package:ip_info_api/src/models/models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ip_info.g.dart';

@JsonSerializable()
class IpInfo extends Equatable {
  @JsonKey(name: 'ipAddress')
  final String ipAddress;

  @JsonKey(name: 'internetProvider')
  final String internetProvider;

  @JsonKey(name: 'location')
  final Location location;

  @JsonKey(name: 'coordinates')
  final LatLng coordinates;

  const IpInfo({
    required this.ipAddress,
    required this.internetProvider,
    required this.location,
    required this.coordinates,
  });

  factory IpInfo.fromJson(Map<String, dynamic> json) {
    return _$IpInfoFromJson(json);
  }

  // implement toString
  String toString() {
    return 'IpInfo { \n'
        ' ipAddress: $ipAddress, \n'
        ' internetProvider: $internetProvider, \n'
        ' location: $location, \n'
        ' coordinates: $coordinates, \n'
        '}';
  }

  @override
  List<Object> get props => [
        ipAddress,
        internetProvider,
        location,
        coordinates,
      ];
}
