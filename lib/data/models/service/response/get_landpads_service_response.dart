import 'dart:convert';
import 'package:SpaceXFlutterOdyssey/domain/entities/landpad.dart';

GetLandPadsServiceResponse makeFromResponse(String str) =>
    GetLandPadsServiceResponse.fromJson(json.decode(str));

class GetLandPadsServiceResponse {
  final List<LandPad> landpads;

  GetLandPadsServiceResponse({required this.landpads});

  factory GetLandPadsServiceResponse.fromJson(List<dynamic> parsedJson) {
    return GetLandPadsServiceResponse(
        landpads: parsedJson.map((json) => LandPad.fromMap(json)).toList());
  }
}
