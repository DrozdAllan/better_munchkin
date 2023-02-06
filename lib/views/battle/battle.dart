import 'package:better_munchkin/logic/cubit/battle_cubit.dart';
import 'package:better_munchkin/utils/commons.dart';
import 'package:better_munchkin/utils/monster_chip.dart';
import 'package:better_munchkin/utils/player_chip.dart';
import 'package:better_munchkin/views/battle/dice.dart';
import 'package:better_munchkin/views/battle/monster_battle_dialog.dart';
import 'package:better_munchkin/views/battle/player_battle_dialog.dart';
import 'package:fluttericon/rpg_awesome_icons.dart';

class Battle extends StatelessWidget {
  const Battle({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Column(children: [
            const Icon(RpgAwesome.knight_helmet, size: 52.0),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(
                // TODO: MEDIA QUERY SIZES
                height: 100.0,
                width: 360.0,
                child: BlocBuilder<BattleCubit, BattleSet>(
                    builder: (context, state) {
                  // instead of rendering directly the chips, create a list and add the button at the end of it
                  final List<Widget> chipsList = List.generate(
                    state.playerList.length,
                    (index) => PlayerChip(
                        name: state.playerList.elementAt(index).name.toString(),
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
          ])
        ]),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Column(children: [
            const Icon(RpgAwesome.monster_skull, size: 52.0),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(
                // TODO: MEDIA QUERY SIZES
                height: 100.0,
                width: 360.0,
                child: BlocBuilder<BattleCubit, BattleSet>(
                    builder: (context, state) {
                  // instead of rendering directly the chips, create a list and add the button at the end of it
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
          ])
        ]),
        BlocBuilder<BattleCubit, BattleSet>(
          builder: (context, state) {
            if (state.isWinner == true) {
              return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text('PLAYERS WIN ! '),
                    Icon(RpgAwesome.horn_call),
                  ]);
            } else if (state.isWinner == false) {
              return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text('PLAYERS LOOSE ! '),
                    Icon(RpgAwesome.skull)
                  ]);
            } else {
              return Container();
            }
          },
        ),
        const DiceWidget(),
      ]),
    );
  }
}
