import 'package:SpaceXFlutterOdyssey/domain/entities/launch.dart';
import 'package:SpaceXFlutterOdyssey/domain/interactors/launches/get_latest_launches_interactor.dart';
import 'package:SpaceXFlutterOdyssey/domain/interactors/launchpads/get_launchpad_interactor.dart';
import 'package:SpaceXFlutterOdyssey/presentation/routes/spacex_routes.dart';
import 'package:SpaceXFlutterOdyssey/presentation/scenes/launchDetail/launch_detail_viewmodel.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  // -- Properties
  final GetUpcomingLaunchesInteractor _getUpcomingLaunchesInteractor;
  RxList<Launch> latestLaunches = <Launch>[].obs;

  // -- Constructor
  HomeViewModel(this._getUpcomingLaunchesInteractor);

  // -- Lifecycle
  @override
  void onReady() {
    super.onReady();

    _getLatestLaunches();
  }

  // -- Public methods
  onSelectLaunch(Launch launch) {
    _goToLaunchDetail(launch);
  }

  // -- Private methods
  _getLatestLaunches() async {
    final latestLaunches = await _getUpcomingLaunchesInteractor.get();
    this.latestLaunches.assignAll(latestLaunches);
  }

  _goToLaunchDetail(Launch launch) {
    Get.lazyPut(() => LaunchDetailViewModel(
        launch: launch,
        getLaunchpadInteractor: Get.find<GetLaunchpadInteractor>()));

    Get.toNamed(SpaceXRoutes.launchDetail);
  }
}
