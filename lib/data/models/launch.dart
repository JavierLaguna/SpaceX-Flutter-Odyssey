import 'dart:convert';
import 'package:flutter/material.dart';

Launch launchFromMap(String str) => Launch.fromMap(json.decode(str));

class Launch {
  Launch({
    @required this.flightNumber,
    @required this.missionName,
    @required this.missionID,
    @required this.upcoming,
    @required this.launchDateUnix,
    @required this.launchDateUTC,
    @required this.launchDateLocal,
    @required this.success,
  });

  final int flightNumber;
  final String missionName;
  final List<String> missionID;
  final bool upcoming;
  final int launchDateUnix;
  final String launchDateUTC;
  final DateTime launchDateLocal;
  final bool success;

  factory Launch.fromMap(Map<String, dynamic> json) => Launch(
        flightNumber: json['flight_number'],
        missionName: json['name'],
        missionID: json['id'],
        upcoming: json['upcoming'],
        launchDateUnix: json['static_fire_date_unix'],
        launchDateUTC: json['static_fire_date_utc'],
        launchDateLocal: json['date_local'],
        success: json['success'],
      );
}
