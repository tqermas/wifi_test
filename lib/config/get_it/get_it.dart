import 'package:get_it/get_it.dart';
import 'package:wifi_list/data/service/wifi_service.dart';
import 'package:wifi_list/data/service/wifi_service_impl.dart';
import 'package:wifi_list/domain/repositories/wifi_repository.dart';
import 'package:wifi_list/domain/repositories/wifi_repository_impl.dart';
import 'package:wifi_list/presentation/screens/wifi_search/cubit/password_form.dart';
import 'package:wifi_list/presentation/screens/wifi_search/cubit/wifi_cubit.dart';

final getIt = GetIt.instance;

Future<void> getItSetup() async {
  _setupRepositories();
  _setupServices();
  _setupCubits();
}

void _setupRepositories() {
  getIt.registerLazySingleton<WiFiRepository>(
          () => WiFiRepositoryImpl(getIt())
  );
}

void _setupServices() {
  getIt.registerLazySingleton<WiFiService>(() => WiFiServiceImpl());
}

void _setupCubits() {
  getIt.registerFactory(() => WiFiCubit(getIt()));
  getIt.registerFactory(() => WiFiPasswordForm());
}