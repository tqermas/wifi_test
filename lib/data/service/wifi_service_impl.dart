import 'dart:math';
import 'package:either_dart/src/either.dart';
import 'package:wifi_list/data/service/wifi_service.dart';
import 'package:wifi_list/domain/models/wifi_model.dart';

final class WiFiServiceImpl implements WiFiService {

  @override
  Future<Either<Exception, List<WiFiModel>>> scanWiFi() async {
    await Future.delayed(Duration(seconds: 1));
    return Right(_randomWiFi());
  }

  List<WiFiModel> _randomWiFi() {
    final wifiList = <WiFiModel>[];
    final random = Random();
    for (var i = 0; i < 15; i++) {
      wifiList.add(
          WiFiModel(
              name: 'WiFi - test_${random.nextInt(100000)}-WLAN',
              protected: random.nextBool(),
              strength: random.nextInt(5)
          )
      );
    }
    return wifiList..removeWhere((e) => e.strength == 0);
  }

}