// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:better_munchkin/data/models/monster.dart';
import 'package:better_munchkin/data/models/player.dart';
import 'package:better_munchkin/utils/commons.dart';

@immutable
class BattleSet {
  final List<Player> playerList;
  final List<Monster> monsterList;
  final bool? isWinner;

  const BattleSet(
      {required this.playerList, required this.monsterList, this.isWinner});

  BattleSet copyWith(
      {List<Player>? playerList, List<Monster>? monsterList, bool? isWinner}) {
    return BattleSet(
        playerList: playerList ?? this.playerList,
        monsterList: monsterList ?? this.monsterList,
        isWinner: isWinner);
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
      emit(state.copyWith(playerList: newPlayerList));
      calculateScore();
    }
  }

  void modifyPlayer(String playerName, int playerStrength) {
    final newPlayerList = [
      for (final oldPlayer in state.playerList)
        if (oldPlayer.name == playerName)
          oldPlayer.copyWith(strength: playerStrength)
        else
          oldPlayer,
    ];
    emit(state.copyWith(playerList: newPlayerList));
    calculateScore();
  }

  void removePlayer(String playerName) {
    final newPlayerList = state.playerList;
    newPlayerList.removeWhere((element) => element.name == playerName);
    emit(state.copyWith(playerList: newPlayerList));
    calculateScore();
  }

  void addMonster(int monsterStrength) {
    final newMonsterList = state.monsterList.toList();
    newMonsterList.add(Monster(strength: monsterStrength));
    emit(state.copyWith(monsterList: newMonsterList));
    calculateScore();
  }

  void removeMonster(int index) {
    final newMonsterList = state.monsterList;
    newMonsterList.removeAt(index);
    emit(state.copyWith(monsterList: newMonsterList));
    calculateScore();
  }

  void calculateScore() {
    final playersStrength = state.playerList
        .fold(0, (previousValue, element) => previousValue + element.strength);

    final monstersStrength = state.monsterList
        .fold(0, (previousValue, element) => previousValue + element.strength);

    if (playersStrength == 0 || monstersStrength == 0) {
      emit(state.copyWith(isWinner: null));
    } else if (playersStrength > monstersStrength) {
      emit(state.copyWith(isWinner: true));
    } else {
      emit(state.copyWith(isWinner: false));
    }
  }
}
