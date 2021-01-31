import 'dart:convert';
import 'package:meta/meta.dart';
import 'launch.dart';

LaunchesList launchesListFromJson(String str) =>
    LaunchesList.fromJson(json.decode(str));

class LaunchesList {
  final List<Launch> launches;

  LaunchesList({@required this.launches});

  factory LaunchesList.fromJson(List<dynamic> parsedJson) {
    return LaunchesList(
        launches: parsedJson.map((json) => Launch.fromMap(json)).toList());
  }
}
