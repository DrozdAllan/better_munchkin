import 'package:better_munchkin/utils/commons.dart';

@immutable
class Monster {
  final int power;

  const Monster({
    required this.power,
  });

  Monster copyWith({
    int? power,
  }) {
    return Monster(
      power: power ?? this.power,
    );
  }
}
