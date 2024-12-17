import 'package:either_dart/src/either.dart';
import 'package:wifi_list/data/service/wifi_service.dart';
import 'package:wifi_list/domain/models/wifi_model.dart';
import 'package:wifi_list/domain/repositories/wifi_repository.dart';

final class WiFiRepositoryImpl implements WiFiRepository {

  WiFiRepositoryImpl(this._wifiService);

  final WiFiService _wifiService;

  @override
  Future<Either<Exception, List<WiFiModel>>> scanWiFi() async {
    return await _wifiService.scanWiFi();
  }

}