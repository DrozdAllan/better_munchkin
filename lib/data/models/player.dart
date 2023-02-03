import 'package:better_munchkin/utils/commons.dart';

@immutable
class Player {
  final String name;
  final int colorId;
  final int level;
  final int bonus;
  final int power;

  const Player(
      {required this.name,
      required this.colorId,
      required this.level,
      required this.bonus,
      required this.power});

  Player copyWith({
    String? name,
    int? colorId,
    int? level,
    int? bonus,
    int? power,
  }) {
    return Player(
      name: name ?? this.name,
      colorId: colorId ?? this.colorId,
      level: level ?? this.level,
      bonus: bonus ?? this.bonus,
      power: power ?? this.power,
    );
  }
}
