import 'package:equatable/equatable.dart';

final class WiFiModel extends Equatable {

  const WiFiModel({
    required this.name,
    required this.protected,
    required this.strength
});

  final String name;
  final bool protected;
  final int strength;

  @override
  List<Object?> get props => [name, protected, strength];

}