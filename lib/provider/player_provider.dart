import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@immutable
class Player {
  const Player(
      {required this.name,
      required this.colorId,
      required this.level,
      required this.bonus,
      required this.power});

  final String name;
  final int colorId;
  final int level;
  final int bonus;
  final int power;

  Player copyWith(
      {String? name, int? colorId, int? level, int? bonus, int? power}) {
    return Player(
        name: name ?? this.name,
        colorId: colorId ?? this.colorId,
        level: level ?? this.level,
        bonus: bonus ?? this.bonus,
        power: power ?? this.power);
  }
}

class PlayerNotifier extends StateNotifier<List<Player>> {
  PlayerNotifier() : super([]);

  void addPlayer(Player player) {
    state = [...state, player];
  }

  void removePlayer(String playerName) {
    state = [
      for (final player in state)
        if (player.name != playerName) player,
    ];
  }

  void setLevel(String playerName, int level) {
    state = [
      for (final player in state)
        if (player.name == playerName)
          player.copyWith(level: level, power: (level + player.bonus))
        else
          player,
    ];
  }

  void setBonus(String playerName, int bonus) {
    state = [
      for (final player in state)
        if (player.name == playerName)
          player.copyWith(bonus: bonus, power: (bonus + player.level))
        else
          player,
    ];
  }
}

final playerProvider = StateNotifierProvider<PlayerNotifier, List<Player>>(
    (ref) => PlayerNotifier());
