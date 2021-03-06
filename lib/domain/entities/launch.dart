import 'dart:convert';
import 'package:meta/meta.dart';

Launch launchFromMap(String str) => Launch.fromMap(json.decode(str));

class Launch {
  final int flightNumber;
  final String name;
  final String id;
  final bool upcoming;
  final int launchDateUnix;
  final String launchDateUTC;
  final DateTime launchDateLocal;
  final bool success;
  final String patchImageSmall;
  final String patchImageLarge;
  final String details;

  Launch({
    @required this.flightNumber,
    @required this.name,
    @required this.id,
    @required this.upcoming,
    @required this.launchDateUnix,
    @required this.launchDateUTC,
    @required this.launchDateLocal,
    @required this.success,
    @required this.patchImageSmall,
    @required this.patchImageLarge,
    @required this.details,
  });

  factory Launch.fromMap(Map<String, dynamic> map) {
    final links = map['links'] as Map<String, dynamic>;
    final patches = links['patch'] as Map<String, dynamic>;

    return Launch(
        flightNumber: map['flight_number'],
        name: map['name'],
        id: map['id'],
        upcoming: map['upcoming'],
        launchDateUnix: map['static_fire_date_unix'],
        launchDateUTC: map['static_fire_date_utc'],
        launchDateLocal: DateTime.parse(map['date_local']),
        success: map['success'],
        patchImageSmall: patches['small'],
        patchImageLarge: patches['large'],
        details: map['details']);
  }
}
