import 'package:SpaceXFlutterOdyssey/data/datasources/spacex_service/landpad_service.dart';
import 'package:SpaceXFlutterOdyssey/domain/entities/landpad.dart';
import 'package:SpaceXFlutterOdyssey/domain/repositories/landpads/landpads_remote_repository.dart';

class LandPadsRepositoryRemoteImpl extends LandPadsRepositoryRemote {
  final LandPadService _landPadService;

  LandPadsRepositoryRemoteImpl(this._landPadService);

  @override
  Future<List<LandPad>> getAllLandPads() async {
    return await _landPadService.getAllLandPads();
  }

  @override
  Future<LandPad> getLandPad(String landPadId) async {
    return await _landPadService.getLandPad(landPadId);
  }
}
