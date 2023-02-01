import 'package:better_munchkin/data/models/monster.dart';
import 'package:better_munchkin/data/models/player.dart';
import 'package:better_munchkin/utils/commons.dart';

@immutable
class Battle {
  final List<Player> playerList;
  final List<Monster> monsterList;

  const Battle(this.playerList, this.monsterList);

  Battle copyWith({
    List<Player>? playerList,
    List<Monster>? monsterList,
  }) {
    return Battle(
      playerList ?? this.playerList,
      monsterList ?? this.monsterList,
    );
  }
}

class BattleCubit extends Cubit<Battle> {
  BattleCubit() : super(const Battle([], []));

  void addPlayer(Player player) {
    emit(state.copyWith(playerList: [...state.playerList, player]));
  }

//TODO: continue
//   void removePlayer()
}
