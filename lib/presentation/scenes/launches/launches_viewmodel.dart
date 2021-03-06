import 'package:SpaceXFlutterOdyssey/domain/interactors/launches/get_launches_interactor.dart';
import 'package:SpaceXFlutterOdyssey/domain/entities/launch.dart';
import 'package:SpaceXFlutterOdyssey/presentation/routes/spacex_routes.dart';
import 'package:SpaceXFlutterOdyssey/presentation/scenes/launchDetail/launch_detail_viewmodel.dart';
import 'package:get/get.dart';

class LaunchesViewModel extends GetxController {
  final GetLaunchesInteractor _getLaunchesInteractor;

  LaunchesViewModel(this._getLaunchesInteractor);

  RxList<Launch> launches = <Launch>[].obs;

  @override
  void onReady() {
    super.onReady();

    _getLaunches();
  }

  onSelectLaunch(Launch launch) {
    _goToLaunchDetail(launch);
  }

  _getLaunches() async {
    final launches = await _getLaunchesInteractor.get();
    this.launches.assignAll(launches);
  }

  _goToLaunchDetail(Launch launch) {
    Get.lazyPut(() => LaunchDetailViewModel(launch: launch));
    Get.toNamed(SpaceXRoutes.launchDetail);
  }
}
