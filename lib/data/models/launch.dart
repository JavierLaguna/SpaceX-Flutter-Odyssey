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

  Launch({
    @required this.flightNumber,
    @required this.name,
    @required this.id,
    @required this.upcoming,
    @required this.launchDateUnix,
    @required this.launchDateUTC,
    @required this.launchDateLocal,
    @required this.success,
  });

  factory Launch.fromMap(Map<String, dynamic> json) => Launch(
        flightNumber: json['flight_number'],
        name: json['name'],
        id: json['id'],
        upcoming: json['upcoming'],
        launchDateUnix: json['static_fire_date_unix'],
        launchDateUTC: json['static_fire_date_utc'],
        launchDateLocal: json['date_local'],
        success: json['success'],
      );
}
