import 'package:better_munchkin/logic/cubit/battle_cubit.dart';
import 'package:better_munchkin/utils/commons.dart';
import 'package:better_munchkin/views/battle/dice.dart';
import 'package:better_munchkin/views/battle/monster_battle_dialog.dart';
import 'package:better_munchkin/views/battle/player_battle_dialog.dart';
import 'package:fluttericon/rpg_awesome_icons.dart';

import 'monster_chip.dart';
import 'player_chip.dart';

class Battle extends StatefulWidget {
  const Battle({super.key});

  @override
  State<Battle> createState() => _BattleState();
}

class _BattleState extends State<Battle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Column(children: [
          const Icon(RpgAwesome.knight_helmet, size: 52.0),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: BlocBuilder<BattleCubit, BattleSet>(
                  builder: (context, state) {
                // instead of rendering directly the chips, generate a List of Chips from the playerList and add an IconButton at the end
                final List<Widget> chipsList = List.generate(
                  state.playerList.length,
                  (index) => PlayerChip(
                      name: state.playerList.elementAt(index).name,
                      colorId: state.playerList.elementAt(index).colorId,
                      power: state.playerList.elementAt(index).power),
                );
                chipsList.add(
                  IconButton(
                    onPressed: () => showDialog(
                      context: context,
                      builder: (context) => const PlayerBattleDialog(),
                    ),
                    icon: const Icon(RpgAwesome.hospital_cross),
                  ),
                );
                return Wrap(
                  alignment: WrapAlignment.center,
                  children: chipsList,
                );
              }),
            ),
          ]),
        ]),
        Column(children: [
          const Icon(RpgAwesome.monster_skull, size: 52.0),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: BlocBuilder<BattleCubit, BattleSet>(
                  builder: (context, state) {
                final List<Widget> chipsList = List.generate(
                  state.monsterList.length,
                  (index) => MonsterChip(
                      index: index,
                      power: state.monsterList.elementAt(index).power),
                );
                chipsList.add(
                  IconButton(
                    onPressed: () => showDialog(
                      context: context,
                      builder: (context) => const MonsterBattleDialog(),
                    ),
                    icon: const Icon(RpgAwesome.hospital_cross),
                  ),
                );
                return Wrap(
                  alignment: WrapAlignment.center,
                  children: chipsList,
                );
              }),
            ),
          ]),
        ]),
        BlocBuilder<BattleCubit, BattleSet>(
          builder: (context, state) {
            if (state.isWinner == true) {
              return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text('PLAYERS WIN '),
                    Icon(RpgAwesome.horn_call),
                  ]);
            } else if (state.isWinner == false) {
              return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text('PLAYERS LOOSE '),
                    Icon(RpgAwesome.skull)
                  ]);
            } else {
              // height with fixed height to avoid the alignment of the column making widgets move
              return const SizedBox(
                height: 34.0,
              );
            }
          },
        ),
        const DiceWidget(),
      ]),
    );
  }
}
