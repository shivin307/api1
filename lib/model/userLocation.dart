class Location {
  final Street street;
  final String city;
  final String state;
  final String country;
  final String postcode;
  final Coordinates coordinates;
  final Timezone timezone;

  Location({
    required this.street,
    required this.city,
    required this.state,
    required this.country,
    required this.postcode,
    required this.coordinates,
    required this.timezone,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      street: Street.fromJson(json['street'] as Map<String, dynamic>),
      city: json['city'] as String,
      state: json['state'] as String,
      country: json['country'] as String,
      postcode: json['postcode'].toString(),
      coordinates:
          Coordinates.fromJson(json['coordinates'] as Map<String, dynamic>),
      timezone: Timezone.fromJson(json['timezone'] as Map<String, dynamic>),
    );
  }

  String get fullLocation {
    return '${coordinates.latitude} ${coordinates.longitude}';
  }
}

class Street {
  final int number;
  final String name;

  Street({
    required this.number,
    required this.name,
  });

  factory Street.fromJson(Map<String, dynamic> json) {
    return Street(
      number: json['number'] as int,
      name: json['name'] as String,
    );
  }
}

class Coordinates {
  final String latitude;
  final String longitude;

  Coordinates({
    required this.latitude,
    required this.longitude,
  });

  factory Coordinates.fromJson(Map<String, dynamic> json) {
    return Coordinates(
      latitude: json['latitude'] as String,
      longitude: json['longitude'] as String,
    );
  }
}

class Timezone {
  final String offset;
  final String description;

  Timezone({
    required this.offset,
    required this.description,
  });

  factory Timezone.fromJson(Map<String, dynamic> json) {
    return Timezone(
      offset: json['offset'] as String,
      description: json['description'] as String,
    );
  }
}
