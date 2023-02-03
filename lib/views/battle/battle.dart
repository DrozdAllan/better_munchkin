import 'package:better_munchkin/logic/cubit/battle_cubit.dart';
import 'package:better_munchkin/utils/commons.dart';
import 'package:better_munchkin/utils/custom_chip.dart';
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
                height: 100.0,
                width: 460.0,
                child: BlocBuilder<BattleCubit, BattleSet>(
                    builder: (context, state) {
                  // instead of rendering directly the chips, create a list and add the button at the end of it
                  final List<Widget> chipsList = List.generate(
                    state.playerList.length,
                    (index) => CustomChip(
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
                height: 100.0,
                width: 460.0,
                child: BlocBuilder<BattleCubit, BattleSet>(
                    builder: (context, state) {
                  // instead of rendering directly the chips, create a list and add the button at the end of it
                  final List<Widget> chipsList = List.generate(
                    state.monsterList.length,
                    // TODO: custom chip need to integrate remove monster function
                    (index) => CustomChip(
                        name:
                            state.monsterList.elementAt(index).name.toString(),
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
        Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
          Text('players win'),
          Icon(RpgAwesome.horn_call),
          Text(' or monsters win'),
          Icon(RpgAwesome.skull)
        ]),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
          Icon(RpgAwesome.perspective_dice_six_two),
          // TODO: use icons for dice result (1 to 6)
          Text('dice roll function')
        ]),
      ]),
    );
  }
}
