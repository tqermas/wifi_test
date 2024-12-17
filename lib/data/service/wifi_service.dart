import 'package:either_dart/either.dart';
import '../../domain/models/wifi_model.dart';

abstract interface class WiFiService {

  Future<Either<Exception, List<WiFiModel>>> scanWiFi();
}