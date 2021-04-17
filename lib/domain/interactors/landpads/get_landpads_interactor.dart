import 'package:SpaceXFlutterOdyssey/domain/entities/landpad.dart';
import 'package:SpaceXFlutterOdyssey/domain/repositories/landpads/landpads_remote_repository.dart';

abstract class GetLandPadsInteractor {
  Future<List<LandPad>> get();
}

class GetLandPadsInteractorImpl extends GetLandPadsInteractor {
  final LandPadsRepositoryRemote _landPadsRepositoryRemote;

  GetLandPadsInteractorImpl(this._landPadsRepositoryRemote);

  @override
  Future<List<LandPad>> get() async {
    return await _landPadsRepositoryRemote.getAllLandPads();
  }
}
