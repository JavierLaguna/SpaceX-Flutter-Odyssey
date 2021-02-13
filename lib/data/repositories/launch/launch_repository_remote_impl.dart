import 'package:SpaceXFlutterOdyssey/data/datasources/spacex_service/launch_service.dart';
import 'package:SpaceXFlutterOdyssey/domain/entities/launches_list.dart';
import 'package:SpaceXFlutterOdyssey/domain/repositories/launch/launch_remote_repository.dart';

class LaunchRepositoryRemoteImpl extends LaunchRepositoryRemote {
  final LaunchService _launchService;

  LaunchRepositoryRemoteImpl(this._launchService) : assert(_launchService != null);

  @override
  Future<LaunchesList> getAllLaunches() async {
    final launches = await _launchService.getAllLaunches();
    return launches;
  }
}
