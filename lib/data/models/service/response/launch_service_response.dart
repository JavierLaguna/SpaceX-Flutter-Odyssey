import 'package:SpaceXFlutterOdyssey/domain/entities/launch.dart';

class LaunchServiceResponse extends Launch {
  LaunchServiceResponse({
    required int flightNumber,
    required String name,
    required bool upcoming,
    required DateTime launchDateLocal,
    int? launchDateUnix,
    String? launchDateUTC,
    bool? success,
    String? patchImageSmall,
    String? patchImageLarge,
    String? details,
    String? youtubeId,
    String? launchpadId,
  }) : super(
          flightNumber: flightNumber,
          name: name,
          upcoming: upcoming,
          launchDateLocal: launchDateLocal,
          launchDateUnix: launchDateUnix,
          launchDateUTC: launchDateUTC,
          success: success,
          patchImageSmall: patchImageSmall,
          patchImageLarge: patchImageLarge,
          details: details,
          youtubeId: youtubeId,
          launchpadId: launchpadId,
        );

  factory LaunchServiceResponse.fromMap(Map<String, dynamic> map) {
    final links = map['links'] as Map<String, dynamic>;
    final patches = links['patch'] as Map<String, dynamic>;

    return LaunchServiceResponse(
      flightNumber: map['flight_number'],
      name: map['name'],
      upcoming: map['upcoming'],
      launchDateLocal: DateTime.parse(map['date_local']),
      launchDateUnix: map['static_fire_date_unix'],
      launchDateUTC: map['static_fire_date_utc'],
      success: map['success'],
      patchImageSmall: patches['small'],
      patchImageLarge: patches['large'],
      details: map['details'],
      youtubeId: links['youtube_id'],
      launchpadId: map['launchpad'],
    );
  }
}
