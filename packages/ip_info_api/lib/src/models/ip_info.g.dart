// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'ip_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IpInfo _$IpInfoFromJson(Map<String, dynamic> json) => $checkedCreate(
      'IpInfo',
      json,
      ($checkedConvert) {
        final val = IpInfo(
          ipAddress: $checkedConvert('ipAddress', (v) => v as String),
          internetProvider:
              $checkedConvert('internetProvider', (v) => v as String),
          location: $checkedConvert(
              'location', (v) => Location.fromJson(v as Map<String, dynamic>)),
          coordinates: $checkedConvert(
              'coordinates', (v) => LatLng.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
    );
