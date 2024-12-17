import 'package:cubit_form/cubit_form.dart';
import 'package:equatable/equatable.dart';
import 'package:wifi_list/domain/models/wifi_model.dart';
import 'package:wifi_list/domain/repositories/wifi_repository.dart';

part 'wifi_state.dart';

class WiFiCubit extends Cubit<WiFiState> {
  WiFiCubit(this._wiFiRepository,) : super(WiFiLoadingState());

  final WiFiRepository _wiFiRepository;

  Future<void> scanWiFi() async {
    final result = await _wiFiRepository.scanWiFi();
    final resState = result.fold(
        (exc) => WiFiErrorState(exc),
        (wifi) => WiFiLoadedState(wifi)
    );
    emit(resState);
  }

  Future<void> reload() async {
    emit(WiFiLoadingState());
    scanWiFi();
  }

  Future<void> connect(String wifiName, String password) async {
    if (state is WiFiLoadedState) {
      emit(WiFiLoadedState((state as WiFiLoadedState).wifiList, wifiName));
    }
  }


}