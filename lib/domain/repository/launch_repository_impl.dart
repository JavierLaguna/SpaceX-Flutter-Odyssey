import 'package:SpaceXFlutterOdyssey/domain/entities/launches_list.dart';
import 'package:SpaceXFlutterOdyssey/domain/spacex_service/launch_service.dart';
import 'launch_repository.dart';

class LaunchRepositoryImpl extends LaunchRepository {
  final LaunchService _launchService;

  LaunchRepositoryImpl(this._launchService) : assert(_launchService != null);

  @override
  Future<LaunchesList> getAllLaunches() async {
    final launches = await _launchService.getAllLaunches();
    return launches;
  }
}
