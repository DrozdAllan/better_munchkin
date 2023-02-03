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

  void addMonster(int monsterPower) {
    final newMonsterList = state.monsterList.toList();
    newMonsterList.add(Monster(power: monsterPower));
    return emit(state.copyWith(monsterList: newMonsterList));
  }

  void removeMonster(int index) {
    final newMonsterList = state.monsterList;
    newMonsterList.removeAt(index);
    return emit(state.copyWith(monsterList: newMonsterList));
  }
}
