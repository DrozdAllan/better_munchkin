import 'package:better_munchkin/data/models/monster.dart';
import 'package:better_munchkin/data/models/player.dart';
import 'package:better_munchkin/utils/commons.dart';

@immutable
class BattleSet {
  final List<Player>? playerList;
  final List<Monster>? monsterList;

  const BattleSet(this.playerList, this.monsterList);

  BattleSet copyWith({
    List<Player>? playerList,
    List<Monster>? monsterList,
  }) {
    return BattleSet(
      playerList ?? this.playerList,
      monsterList ?? this.monsterList,
    );
  }
}

class BattleCubit extends Cubit<BattleSet> {
  BattleCubit() : super(const BattleSet([], []));

  void addPlayer(Player player) {
    emit(state.copyWith(playerList: [...state.playerList!, player]));
  }

  void removePlayer(String playerName) {
    var newList = state.playerList;

    for (final player in state.playerList!) {
      if (player.name != playerName) {
        newList!.add(player);
      }
    }

    emit(state.copyWith(playerList: newList));
  }
}
