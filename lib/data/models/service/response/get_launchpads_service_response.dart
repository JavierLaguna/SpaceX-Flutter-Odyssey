import 'dart:convert';
import 'package:SpaceXFlutterOdyssey/domain/entities/launchpad.dart';
import 'launchpad_service_response.dart';

GetLaunchpadsServiceResponse makeFromResponse(String str) =>
    GetLaunchpadsServiceResponse.fromJson(json.decode(str));

class GetLaunchpadsServiceResponse {
  final List<Launchpad> launchpads;

  GetLaunchpadsServiceResponse({required this.launchpads});

  factory GetLaunchpadsServiceResponse.fromJson(List<dynamic> parsedJson) {
    return GetLaunchpadsServiceResponse(
        launchpads: parsedJson
            .map((json) => LaunchpadServiceResponse.fromMap(json))
            .toList());
  }
}
