import 'package:SpaceXFlutterOdyssey/Interactors/get_launches_interactor.dart';
import 'package:SpaceXFlutterOdyssey/domain/entities/launch.dart';
import 'package:flutter/cupertino.dart';

class LaunchesProvider with ChangeNotifier {
  final GetLaunchesInteractor _getLaunchesInteractor;

  LaunchesProvider(this._getLaunchesInteractor)
      : assert(_getLaunchesInteractor != null);

  // Fields
  List<Launch> _launches;
  String _errorMessage;

  // Getters
  List<Launch> get launches => _launches;

  String get errorMessage => _errorMessage;

  void getLaunches() async {
    try {
      var launchesList = await _getLaunchesInteractor();
      _launches = launchesList.launches;
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      notifyListeners();
    }
  }
}
