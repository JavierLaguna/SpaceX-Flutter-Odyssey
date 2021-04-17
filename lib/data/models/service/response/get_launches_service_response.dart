import 'dart:convert';
import 'package:SpaceXFlutterOdyssey/domain/entities/launch.dart';

import 'launch_service_response.dart';

GetLaunchesServiceResponse makeFromResponse(String str) =>
    GetLaunchesServiceResponse.fromJson(json.decode(str));

class GetLaunchesServiceResponse {
  final List<Launch> launches;

  GetLaunchesServiceResponse({required this.launches});

  factory GetLaunchesServiceResponse.fromJson(List<dynamic> parsedJson) {
    return GetLaunchesServiceResponse(
        launches: parsedJson.map((json) => LaunchServiceResponse.fromMap(json)).toList());
  }
}
