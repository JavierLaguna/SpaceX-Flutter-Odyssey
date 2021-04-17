import 'package:SpaceXFlutterOdyssey/domain/interactors/launches/get_launches_interactor.dart';
import 'package:SpaceXFlutterOdyssey/domain/entities/launch.dart';
import 'package:SpaceXFlutterOdyssey/domain/interactors/launchpads/get_launchpad_interactor.dart';
import 'package:SpaceXFlutterOdyssey/presentation/routes/spacex_routes.dart';
import 'package:SpaceXFlutterOdyssey/presentation/scenes/launchDetail/launch_detail_viewmodel.dart';
import 'package:get/get.dart';

class LaunchesViewModel extends GetxController {
  // -- Properties
  final GetLaunchesInteractor _getLaunchesInteractor;
  RxList<Launch> launches = <Launch>[].obs;

  // -- Constructor
  LaunchesViewModel(this._getLaunchesInteractor);

  // -- Lifecycle
  @override
  void onReady() {
    super.onReady();

    _getLaunches();
  }

  // -- Public methods
  onSelectLaunch(Launch launch) {
    _goToLaunchDetail(launch);
  }

  Future<void> refreshLaunches() async {
    await _getLaunches();
    return;
  }

  // -- Private methods
  _getLaunches() async {
    final launches = await _getLaunchesInteractor.get();
    this.launches.assignAll(launches);
  }

  _goToLaunchDetail(Launch launch) {
    Get.lazyPut(() => LaunchDetailViewModel(
        launch: launch,
        getLaunchpadInteractor: Get.find<GetLaunchpadInteractor>()));

    Get.toNamed(SpaceXRoutes.launchDetail);
  }
}
