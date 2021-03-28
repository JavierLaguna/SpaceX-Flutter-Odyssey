import 'dart:convert';

Launch launchFromMap(String str) => Launch.fromMap(json.decode(str));

class Launch {
  final int flightNumber;
  final String name;
  final bool upcoming;
  final DateTime launchDateLocal;
  final int? launchDateUnix;
  final String? launchDateUTC;
  final bool? success;
  final String? patchImageSmall;
  final String? patchImageLarge;
  final String? details;
  final String? youtubeId;

  Launch({
    required this.flightNumber,
    required this.name,
    required this.upcoming,
    required this.launchDateLocal,
    this.launchDateUnix,
    this.launchDateUTC,
    this.success,
    this.patchImageSmall,
    this.patchImageLarge,
    this.details,
    this.youtubeId,
  });

  factory Launch.fromMap(Map<String, dynamic> map) {
    final links = map['links'] as Map<String, dynamic>;
    final patches = links['patch'] as Map<String, dynamic>;

    return Launch(
      flightNumber: map['flight_number'],
      name: map['name'],
      upcoming: map['upcoming'],
      launchDateLocal: DateTime.parse(map['date_local']),
      launchDateUnix: map['static_fire_date_unix'],
      launchDateUTC: map['static_fire_date_utc'],
      success: map['success'],
      patchImageSmall: patches['small'],
      patchImageLarge: patches['large'],
      details: map['details'],
      youtubeId: links['youtube_id'],
    );
  }
}
