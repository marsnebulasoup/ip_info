class IpInfo {
  final String ipAddress;
  final String internetProvider;
  final Location location;
  final Coordinates coordinates;

  IpInfo({
    required this.ipAddress,
    required this.internetProvider,
    required this.location,
    required this.coordinates,
  });

  factory IpInfo.fromJson(Map<String, dynamic> json) {
    return IpInfo(
      ipAddress: json['ipAddress'],
      internetProvider: json['internetProvider'],
      location: Location.fromJson(json['location']),
      coordinates: Coordinates.fromJson(json['coordinates']),
    );
  }
}

class Location {
  final String city;
  final String region;

  Location({
    required this.city,
    required this.region,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      city: json['city'],
      region: json['region'],
    );
  }

  @override
  String toString() {
    return "$city, $region";
  }
}

class Coordinates {
  final double latitude;
  final double longitude;

  Coordinates({
    required this.latitude,
    required this.longitude,
  });

  factory Coordinates.fromJson(Map<String, dynamic> json) {
    return Coordinates(
      longitude: double.parse(json['longitude']),
      latitude: double.parse(json['latitude']),
    );
  }

  @override
  String toString() {
    return "$latitude, $longitude";
  }
}
