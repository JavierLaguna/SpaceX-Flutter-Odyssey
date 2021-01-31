import 'package:SpaceXFlutterOdyssey/Interactors/get_launches_interactor.dart';
import 'package:SpaceXFlutterOdyssey/domain/repository/launchRepository.dart';
import 'package:SpaceXFlutterOdyssey/domain/repository/launchRepositoryImpl.dart';
import 'package:SpaceXFlutterOdyssey/domain/spacex_service/launch_service.dart';
import 'package:SpaceXFlutterOdyssey/presentation/providers/launches_provider.dart';
import 'package:get_it/get_it.dart';

final _injector = GetIt.instance;

void setUpDI() {
  // Services
  _injector.registerLazySingleton<LaunchService>(() => LaunchService());

  // Repositories
  _injector.registerLazySingleton<LaunchRepository>(
      () => LaunchRepositoryImpl(_injector<LaunchService>()));

  // Interactors
  _injector.registerLazySingleton<GetLaunchesInteractor>(
      () => GetLaunchesInteractor(_injector<LaunchRepository>()));

  // Providers
  _injector.registerLazySingleton<LaunchesProvider>(
      () => LaunchesProvider(_injector<GetLaunchesInteractor>()));
}
