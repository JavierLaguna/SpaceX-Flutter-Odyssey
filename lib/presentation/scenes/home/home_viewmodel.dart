import 'package:SpaceXFlutterOdyssey/domain/entities/launch.dart';
import 'package:SpaceXFlutterOdyssey/domain/interactors/launches/get_latest_launches_interactor.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  // -- Properties
  final GetLatestLaunchesInteractor _getLatestLaunchesInteractor;
  RxList<Launch> latestLaunches = <Launch>[].obs;

  // -- Constructor
  HomeViewModel(this._getLatestLaunchesInteractor);

  // -- Lifecycle
  @override
  void onReady() {
    super.onReady();

    _getLatestLaunches();
  }

  // -- Private methods
  _getLatestLaunches() async {
    final latestLaunches = await _getLatestLaunchesInteractor.get();
    this.latestLaunches.assignAll(latestLaunches);
  }
}
