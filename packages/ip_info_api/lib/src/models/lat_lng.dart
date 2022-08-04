import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'lat_lng.g.dart';

@JsonSerializable()
class LatLng extends Equatable {
  @JsonKey(name: 'latitude')
  final double latitude;

  @JsonKey(name: 'longitude')
  final double longitude;

  const LatLng({
    required this.latitude,
    required this.longitude,
  });

  @override
  String toString() {
    return "$latitude, $longitude";
  }

  String toJson() {
    return jsonEncode(
      Map<String, double>.from(
        {
          'latitude': latitude,
          'longitude': longitude,
        },
      ),
    );
  }

  @override
  factory LatLng.fromJson(Map<String, dynamic> json) {
    return _$LatLngFromJson(json);
  }

  @override
  List<Object> get props => [
        latitude,
        longitude,
      ];
}
