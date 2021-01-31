import 'package:SpaceXFlutterOdyssey/domain/entities/launchesList.dart';

abstract class LaunchRepository {
  Future<LaunchesList> getAllLaunches();
}
