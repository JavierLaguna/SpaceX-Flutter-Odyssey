import 'package:flutter/material.dart';

class Launch {
  Launch({
    @required this.flightNumber,
    @required this.missionName,
    @required this.missionID,
    @required this.upcoming,
    @required this.launchYear,
    @required this.launchDateUnix,
    @required this.launchDateUTC,
    @required this.launchDateLocal,
    @required this.isTentative,
  });

  int flightNumber;
  String missionName;
  List<String> missionID;
  bool upcoming;
  String launchYear;
  int launchDateUnix;
  String launchDateUTC;
  DateTime launchDateLocal;
  bool isTentative;
}
