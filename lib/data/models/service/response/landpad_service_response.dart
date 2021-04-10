import 'package:SpaceXFlutterOdyssey/domain/entities/landpad.dart';
import 'package:SpaceXFlutterOdyssey/domain/entities/landpad_status.dart';
import 'package:enum_to_string/enum_to_string.dart';

class LandPadServiceResponse extends LandPad {

  LandPadServiceResponse({
    required String id,
    required LandPadStatus status,
    required int landingAttempts,
    required int landingSuccesses,
    required List<String> launchesIds,
    String? name,
    String? fullName,
    String? type,
    String? locality,
    String? region,
    double? latitude,
    double? longitude,
    String? details,
  }) : super(
            status: status,
            launchesIds: launchesIds,
            landingSuccesses: landingSuccesses,
            landingAttempts: landingSuccesses,
            name: name,
            id: id,
            type: type,
            region: region,
            longitude: longitude,
            latitude: latitude,
            locality: locality,
            fullName: fullName,
            details: details);

factory LandPadServiceResponse.fromMap(Map<String, dynamic> map) {
  final launchesIds = new List<String>.from(map['launches']);

  final status = EnumToString.fromString(LandPadStatus.values, map['status'],
      camelCase: true);

  return LandPadServiceResponse(
    id: map['id'],
    landingAttempts: map['landing_attempts'],
    landingSuccesses: map['landing_successes'],
    launchesIds: launchesIds,
    status: status ?? LandPadStatus.unknown,
    details: map['details'],
    fullName: map['full_name'],
    latitude: map['latitude'],
    locality: map['locality'],
    longitude: map['longitude'],
    name: map['name'],
    region: map['region'],
    type: map['type'],
  );
}
}
