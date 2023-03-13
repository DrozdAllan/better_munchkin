import 'package:better_munchkin/utils/commons.dart';

@immutable
class Player {
  final String name;
  final int colorId;
  final int level;
  final int bonus;
  final int strength;

  const Player(
      {required this.name,
      required this.colorId,
      required this.level,
      required this.bonus,
      required this.strength});

  Player copyWith({
    String? name,
    int? colorId,
    int? level,
    int? bonus,
    int? strength,
  }) {
    return Player(
      name: name ?? this.name,
      colorId: colorId ?? this.colorId,
      level: level ?? this.level,
      bonus: bonus ?? this.bonus,
      strength: strength ?? this.strength,
    );
  }
}
