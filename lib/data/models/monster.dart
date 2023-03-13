import 'package:better_munchkin/utils/commons.dart';

@immutable
class Monster {
  final int strength;

  const Monster({
    required this.strength,
  });

  Monster copyWith({
    int? strength,
  }) {
    return Monster(
      strength: strength ?? this.strength,
    );
  }
}
