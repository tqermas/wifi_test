part of 'wifi_cubit.dart';

sealed class WiFiState extends Equatable {}

class WiFiLoadingState extends WiFiState {
  @override
  List<Object?> get props => [];
}

class WiFiLoadedState extends WiFiState {

  final List<WiFiModel> wifiList;
  final String connectedWiFi;

  WiFiLoadedState(this.wifiList, [this.connectedWiFi = '']);

  @override
  List<Object?> get props => [wifiList, connectedWiFi];
}

class WiFiErrorState extends WiFiState {

  final Exception exception;

  WiFiErrorState(this.exception);

  @override
  List<Object?> get props => [identityHashCode(this)];
}