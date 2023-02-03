import 'package:better_munchkin/utils/commons.dart';

@immutable
class Monster {
  final String name;
  final int power;

  const Monster({
    required this.name,
    required this.power,
  });

  Monster copyWith({
    String? name,
    int? power,
  }) {
    return Monster(
      name: name ?? this.name,
      power: power ?? this.power,
    );
  }
}
