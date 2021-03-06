import 'package:SpaceXFlutterOdyssey/data/datasources/spacex_service/launch_service.dart';
import 'package:SpaceXFlutterOdyssey/domain/entities/launch.dart';
import 'package:SpaceXFlutterOdyssey/domain/repositories/launch/launch_remote_repository.dart';

class LaunchRepositoryRemoteImpl extends LaunchRepositoryRemote {
  final LaunchService _launchService;

  LaunchRepositoryRemoteImpl(this._launchService);

  @override
  Future<List<Launch>> getAllLaunches() async {
    return await _launchService.getAllLaunches();
  }

  @override
  Future<List<Launch>> getUpcomingLaunches() async {
    return await _launchService.getUpcomingLaunches();
  }
}
