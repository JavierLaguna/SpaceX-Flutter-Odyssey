import 'package:SpaceXFlutterOdyssey/data/datasources/spacex_service/launchpad_service.dart';
import 'package:SpaceXFlutterOdyssey/domain/entities/launchpad.dart';
import 'package:SpaceXFlutterOdyssey/domain/repositories/launchpad/launchpads_remote_repository.dart';

class LaunchpadsRepositoryRemoteImpl extends LaunchpadsRepositoryRemote {
  final LaunchpadService _launchpadService;

  LaunchpadsRepositoryRemoteImpl(this._launchpadService);

  @override
  Future<List<Launchpad>> getAllLaunchpads() async {
    return await _launchpadService.getAllLaunchpads();
  }

  @override
  Future<Launchpad> getLaunchpad(String launchpadId) async {
    return await _launchpadService.getLaunchpad(launchpadId);
  }
}
