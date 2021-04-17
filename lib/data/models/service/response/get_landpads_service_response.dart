import 'dart:convert';
import 'package:SpaceXFlutterOdyssey/domain/entities/landpad.dart';
import 'landpad_service_response.dart';

GetLandPadsServiceResponse makeFromResponse(String str) =>
    GetLandPadsServiceResponse.fromJson(json.decode(str));

class GetLandPadsServiceResponse {
  final List<LandPad> landPads;

  GetLandPadsServiceResponse({required this.landPads});

  factory GetLandPadsServiceResponse.fromJson(List<dynamic> parsedJson) {
    return GetLandPadsServiceResponse(
        landPads: parsedJson
            .map((json) => LandPadServiceResponse.fromMap(json))
            .toList());
  }
}
