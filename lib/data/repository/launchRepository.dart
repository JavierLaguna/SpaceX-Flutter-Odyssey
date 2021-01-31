import 'package:SpaceXFlutterOdyssey/data/models/launchesList.dart';

abstract class LaunchRepository {
  Future<LaunchesList> getAllLaunches();
}
