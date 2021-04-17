import 'package:SpaceXFlutterOdyssey/domain/entities/launchpad.dart';
import 'package:SpaceXFlutterOdyssey/domain/repositories/launchpad/launchpads_remote_repository.dart';

abstract class GetLaunchpadInteractor {
  Future<Launchpad> get(String launchpadId);
}

class GetLaunchpadInteractorImpl extends GetLaunchpadInteractor {
  final LaunchpadsRepositoryRemote _launchpadsRepositoryRemote;

  GetLaunchpadInteractorImpl(this._launchpadsRepositoryRemote);

  @override
  Future<Launchpad> get(String launchpadId) async {
    return await _launchpadsRepositoryRemote.getLaunchpad(launchpadId);
  }
}
