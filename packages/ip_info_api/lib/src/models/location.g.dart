// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Location _$LocationFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Location',
      json,
      ($checkedConvert) {
        final val = Location(
          city: $checkedConvert('city', (v) => v as String),
          region: $checkedConvert('region', (v) => v as String),
        );
        return val;
      },
    );
