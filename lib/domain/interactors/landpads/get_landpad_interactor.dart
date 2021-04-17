import 'package:SpaceXFlutterOdyssey/domain/entities/landpad.dart';
import 'package:SpaceXFlutterOdyssey/domain/repositories/landpads/landpads_remote_repository.dart';

abstract class GetLandPadInteractor {
  Future<LandPad> get(String landPadId);
}

class GetLandPadInteractorImpl extends GetLandPadInteractor {
  final LandPadsRepositoryRemote _landPadsRepositoryRemote;

  GetLandPadInteractorImpl(this._landPadsRepositoryRemote);

  @override
  Future<LandPad> get(String landPadId) async {
    return await _landPadsRepositoryRemote.getLandPad(landPadId);
  }
}
