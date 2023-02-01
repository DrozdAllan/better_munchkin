import 'package:better_munchkin/provider/player_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@immutable
class Monster {
  final String name;
  final int power;

  const Monster({required this.name, required this.power});
}

class BattleMonsterNotifier extends StateNotifier<List<Monster>> {
  BattleMonsterNotifier() : super([]);

  void addMonster(Monster monster) {
    state = [...state, monster];
  }

  void removeMonster(String monsterName) {
    state = [
      for (final monster in state)
        if (monster.name != monsterName) monster,
    ];
  }
}

final battleMonsterProvider =
    StateNotifierProvider<BattleMonsterNotifier, List<Monster>>(
        (ref) => BattleMonsterNotifier());


class BattlePlayerNotifier extends StateNotifier<List<Player>> {
  BattlePlayerNotifier() : super([]);

  void addPlayer(Player player) {
    state = [...state, player];
  }

  void removePlayer(String playerName) {
    state = [
      for (final player in state)
        if (player.name != playerName) player,
    ];
  }
}

final battlePlayerProvider =
    StateNotifierProvider<BattlePlayerNotifier, List<Player>>(
        (ref) => BattlePlayerNotifier());
