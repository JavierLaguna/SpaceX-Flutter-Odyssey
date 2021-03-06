import 'package:SpaceXFlutterOdyssey/data/models/service/response/get_landpads_service_response.dart'
    as GetLandPadsServiceResponse;
import 'package:SpaceXFlutterOdyssey/data/models/service/response/landpad_service_response.dart'
    as LandPadServiceResponse;
import 'package:SpaceXFlutterOdyssey/domain/entities/landpad.dart';
import 'package:http/http.dart' as http;

class LandPadService {
  final String baseUrl = 'https://api.spacexdata.com/v4';

  Future<List<LandPad>> getAllLandPads() async {
    final url = Uri.parse('$baseUrl/landpads');

    final response = await http.get(url);
    final responseModel =
        GetLandPadsServiceResponse.makeFromResponse(response.body);

    return responseModel.landPads;
  }

  Future<LandPad> getLandPad(String landPadId) async {
    final url = Uri.parse('$baseUrl/landpads/$landPadId');

    final response = await http.get(url);
    final responseModel =
        LandPadServiceResponse.makeFromResponse(response.body);

    return responseModel;
  }
}
