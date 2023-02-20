import 'package:better_munchkin/logic/cubit/battle_cubit.dart';
import 'package:better_munchkin/utils/commons.dart';
import 'package:better_munchkin/utils/custom_dialog.dart';
import 'package:better_munchkin/views/battle/dice.dart';
import 'package:better_munchkin/views/battle/monster_battle_dialog.dart';

import 'monster_chip.dart';
import 'player_chip.dart';

class Battle extends StatelessWidget {
  const Battle({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Column(children: [
          const Icon(CustomIcons.knightHelmet, size: 52.0),
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
                      builder: (context) =>
                          const CustomDialog(dialogType: true),
                    ),
                    icon: const Icon(CustomIcons.hospitalCross),
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
          const Icon(CustomIcons.monsterSkull, size: 52.0),
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
                    icon: const Icon(CustomIcons.hospitalCross),
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
                    Icon(CustomIcons.hornCall),
                  ]);
            } else if (state.isWinner == false) {
              return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text('PLAYERS LOOSE '),
                    Icon(CustomIcons.skull)
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
