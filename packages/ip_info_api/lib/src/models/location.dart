import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'location.g.dart';

@JsonSerializable()
class Location extends Equatable {
  final String city;
  final String region;

  const Location({
    required this.city,
    required this.region,
  });

  @override
  String toString() {
    return "$city, $region";
  }

  String toJson() {
    return jsonEncode(
      Map<String, String>.from(
        {
          'city': city,
          'region': region,
        },
      ),
    );
  }

  @override
  factory Location.fromJson(Map<String, dynamic> json) {
    return _$LocationFromJson(json);
  }

  @override
  List<Object> get props => [
        city,
        region,
      ];
}
