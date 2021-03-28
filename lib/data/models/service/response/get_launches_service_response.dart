import 'dart:convert';
import 'package:SpaceXFlutterOdyssey/domain/entities/launch.dart';

GetLaunchesServiceResponse makeFromResponse(String str) =>
    GetLaunchesServiceResponse.fromJson(json.decode(str));

class GetLaunchesServiceResponse {
  final List<Launch> launches;

  GetLaunchesServiceResponse({required this.launches});

  factory GetLaunchesServiceResponse.fromJson(List<dynamic> parsedJson) {
    return GetLaunchesServiceResponse(
        launches: parsedJson.map((json) => Launch.fromMap(json)).toList());
  }
}
