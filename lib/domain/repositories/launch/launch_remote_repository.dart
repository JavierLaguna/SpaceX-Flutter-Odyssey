import 'package:SpaceXFlutterOdyssey/domain/entities/launches_list.dart';

abstract class LaunchRepositoryRemote {
  Future<LaunchesList> getAllLaunches();
}
