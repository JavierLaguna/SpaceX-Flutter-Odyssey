import 'package:SpaceXFlutterOdyssey/data/models/service/response/get_launchpads_service_response.dart'
    as GetLaunchpadsServiceResponse;
import 'package:SpaceXFlutterOdyssey/data/models/service/response/launchpad_service_response.dart'
    as LaunchpadServiceResponse;
import 'package:SpaceXFlutterOdyssey/domain/entities/launchpad.dart';
import 'package:http/http.dart' as http;

class LaunchpadService {
  final String baseUrl = 'https://api.spacexdata.com/v4';

  Future<List<Launchpad>> getAllLaunchpads() async {
    final url = Uri.parse('$baseUrl/launchpads');

    final response = await http.get(url);
    final responseModel =
        GetLaunchpadsServiceResponse.makeFromResponse(response.body);

    return responseModel.launchpads;
  }

  Future<Launchpad> getLaunchpad(String launchpadId) async {
    final url = Uri.parse('$baseUrl/launchpads/$launchpadId');

    final response = await http.get(url);
    final responseModel =
        LaunchpadServiceResponse.makeFromResponse(response.body);

    return responseModel;
  }
}
