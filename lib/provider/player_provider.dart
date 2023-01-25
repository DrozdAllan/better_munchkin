import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@immutable
class Player {
  const Player({required this.name, required this.colorId, required this.power});

  final String name;
  final int colorId;
  final int power;

  Player copyWith({
    String? name,
    int? colorId,
    int? power,
  }) {
    return Player(
      name: name ?? this.name,
      colorId: colorId ?? this.colorId,
      power: power ?? this.power,
    );
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

  void setPower(String playerName, int power) {
    state = [
      for (final player in state)
        if (player.name == playerName) player.copyWith(power: power) else player,
    ];
  }
}

final playerProvider = StateNotifierProvider<PlayerNotifier, List<Player>>((ref) => PlayerNotifier());
