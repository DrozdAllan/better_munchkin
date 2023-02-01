import 'package:better_munchkin/data/models/player.dart';
import 'package:better_munchkin/logic/cubit/player/player_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'player_card.dart';

class PlayerList extends StatelessWidget {
  const PlayerList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // List<Player> players = ref.watch(playerProvider);

    return BlocBuilder<PlayerCubit, List<Player>>(
      builder: (context, state) {
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: state.length,
          itemBuilder: (context, index) {
            return PlayerCard(player: state.elementAt(index));
          },
        );
      },
    );
  }
}
