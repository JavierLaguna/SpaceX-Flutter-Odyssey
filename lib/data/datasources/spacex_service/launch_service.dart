import 'package:SpaceXFlutterOdyssey/data/models/service/response/get_launches_service_response.dart'
    as GetLaunchesServiceResponse;
import 'package:SpaceXFlutterOdyssey/domain/entities/launch.dart';
import 'package:http/http.dart' as http;

class LaunchService {
  final String baseUrl = 'https://api.spacexdata.com/v4';

  Future<List<Launch>> getAllLaunches() async {
    final url = Uri.parse('$baseUrl/launches');

    final response = await http.get(url);
    final responseModel =
        GetLaunchesServiceResponse.makeFromResponse(response.body);

    return responseModel.launches;
  }

  Future<List<Launch>> getUpcomingLaunches() async {
    final url = Uri.parse('$baseUrl/launches/upcoming');

    final response = await http.get(url);
    final responseModel =
    GetLaunchesServiceResponse.makeFromResponse(response.body);

    return responseModel.launches;
  }
}
