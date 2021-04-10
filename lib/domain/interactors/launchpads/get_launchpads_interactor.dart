import 'package:SpaceXFlutterOdyssey/domain/entities/launchpad.dart';
import 'package:SpaceXFlutterOdyssey/domain/repositories/launchpad/launchpads_remote_repository.dart';

abstract class GetLaunchpadsInteractor {
  Future<List<Launchpad>> get();
}

class GetLaunchpadsInteractorImpl extends GetLaunchpadsInteractor {
  final LaunchpadsRepositoryRemote _launchpadsRepositoryRemote;

  GetLaunchpadsInteractorImpl(this._launchpadsRepositoryRemote);

  @override
  Future<List<Launchpad>> get() async {
    return await _launchpadsRepositoryRemote.getAllLaunchpads();
  }
}
