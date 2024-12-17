import 'package:either_dart/either.dart';
import 'package:wifi_list/domain/models/wifi_model.dart';

abstract interface class WiFiRepository {

  Future<Either<Exception, List<WiFiModel>>> scanWiFi();
}