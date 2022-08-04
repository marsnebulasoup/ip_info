import 'package:ip_info_api/ip_info.dart';

const city = 'Quebec';
const region = 'Canada';
const ipAddress = '123.456.789.0';
const internetProvider = 'ASDF';
const latitude = -12.34;
const longitude = 56.78;

const String locationJson = '{"city":"$city","region":"$region"}';
const String coordinatesJson = '{"latitude":$latitude,"longitude":$longitude}';

const String ipInfoJson = '''
          {
            "ipAddress": "$ipAddress",
            "internetProvider": "$internetProvider",
            "location": $locationJson,
            "coordinates": $coordinatesJson
          }''';

const String ipInfoString =
    '''IpInfo { \n ipAddress: $ipAddress, \n internetProvider: $internetProvider, \n location: $city, $region, \n coordinates: $latitude, $longitude, \n}''';

const locationMap = {
  'city': city,
  'region': region,
};

const coordinatesMap = {
  'latitude': latitude,
  'longitude': longitude,
};

const ipInfoMap = <String, dynamic>{
  'ipAddress': ipAddress,
  'internetProvider': internetProvider,
  'location': locationMap,
  'coordinates': coordinatesMap,
};

final Location locationObject = Location(
  city: city,
  region: region,
);

final LatLng coordinatesObject = LatLng(
  latitude: latitude,
  longitude: longitude,
);

final IpInfo ipInfoObj = IpInfo(
  ipAddress: ipAddress,
  internetProvider: internetProvider,
  location: locationObject,
  coordinates: coordinatesObject,
);
