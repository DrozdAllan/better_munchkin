import 'dart:developer';
import 'dart:ffi';

import 'package:better_munchkin/data/models/monster.dart';
import 'package:better_munchkin/data/models/player.dart';
import 'package:better_munchkin/utils/commons.dart';

@immutable
class BattleSet {
  final List<Player> playerList;
  final List<Monster> monsterList;

  const BattleSet({required this.playerList, required this.monsterList});

  BattleSet copyWith({
    List<Player>? playerList,
    List<Monster>? monsterList,
  }) {
    return BattleSet(
      playerList: playerList ?? this.playerList,
      monsterList: monsterList ?? this.monsterList,
    );
  }
}

class BattleCubit extends Cubit<BattleSet> {
  BattleCubit() : super(const BattleSet(playerList: [], monsterList: []));

  void addPlayer(Player player) {
    // check if player already in list
    bool arleadyExists =
        state.playerList.any((element) => element.name == player.name);

    if (!arleadyExists) {
      // added toList() to create a new modifiable list
      final newPlayerList = state.playerList.toList();
      newPlayerList.add(player);
      return emit(state.copyWith(playerList: newPlayerList));
    }
  }

  void removePlayer(String playerName) {
    final newPlayerList = state.playerList;
    newPlayerList.removeWhere((element) => element.name == playerName);
    return emit(state.copyWith(playerList: newPlayerList));
  }

  void addMonster(Monster monster) {
	// TODO: add monster number based on monsterList.length ?
    final newMonsterList = state.monsterList.toList();
    newMonsterList.add(monster);
    return emit(state.copyWith(monsterList: newMonsterList));
  }
}
