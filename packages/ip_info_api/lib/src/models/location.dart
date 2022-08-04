import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'location.g.dart';

@JsonSerializable()
class Location extends Equatable {
  final String city;
  final String region;

  const Location({city, region})
      : this.city = city ?? "",
        this.region = region ?? "";

  @override
  String toString() {
    String location = "";
    if (city != "") {
      location += city;
    }
    if (city != "" && region != "") {
      location += ", ";
    }
    if (region != "") {
      location += region;
    }
    return location;
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
