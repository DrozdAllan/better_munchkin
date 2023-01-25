import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:better_munchkin/provider/player_provider.dart';

import 'player_card.dart';

class PlayerList extends ConsumerWidget {
  const PlayerList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Player> players = ref.watch(playerProvider);

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: players.length,
      itemBuilder: (context, index) {
        return PlayerCard(player: players.elementAt(index));
      },
    );
  }
}
