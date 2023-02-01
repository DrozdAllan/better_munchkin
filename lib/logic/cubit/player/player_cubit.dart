import 'package:better_munchkin/data/models/player.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'player_state.dart';

// class PlayerCubit extends Cubit<PlayerState> {
//   PlayerCubit() : super(PlayerInitial());
// }

class PlayerCubit extends Cubit<List<Player>> {
  PlayerCubit() : super([]);

  void addPlayer(Player player) => emit([...state, player]);

  void removePlayer(String playerName) => emit([
        for (final player in state)
          if (player.name != playerName) player
      ]);

  void setLevel(String playerName, int level) {
    emit([
      for (final player in state)
        if (player.name == playerName)
          player.copyWith(level: level, power: (level + player.bonus))
        else
          player
    ]);
  }

  void setBonus(String playerName, int bonus) {
    emit([
      for (final player in state)
        if (player.name == playerName)
          player.copyWith(bonus: bonus, power: (bonus + player.level))
        else
          player
    ]);
  }
}
