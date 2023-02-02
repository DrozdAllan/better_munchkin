import 'package:better_munchkin/data/models/player.dart';
import 'package:better_munchkin/logic/cubit/battle_cubit.dart';
import 'package:better_munchkin/utils/commons.dart';
import 'package:better_munchkin/utils/custom_chip.dart';
import 'package:better_munchkin/views/battle/player_battle_dialog.dart';
import 'package:better_munchkin/views/battle/player_battle_row.dart';
import 'package:fluttericon/rpg_awesome_icons.dart';

class Battle extends StatelessWidget {
  const Battle({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  const Icon(RpgAwesome.knight_helmet, size: 52.0),
                  const SizedBox(
                    height: 350.0,
                    width: 350.0,
                    child: PlayerBattleRow(),
                  ),
                  IconButton(
                    onPressed: () => showDialog(
                      context: context,
                      builder: (context) => const PlayerBattleDialog(),
                    ),
                    icon: const Icon(RpgAwesome.hospital_cross),
                  ),
                ],
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  const Icon(RpgAwesome.monster_skull, size: 52.0),
                  Row(
                    children: [
                      const CustomChip(name: 'Monster 1', power: 12),
                      const CustomChip(name: 'Monster 2', power: 8),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(RpgAwesome.hospital_cross)),
                    ],
                  )
                ],
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('players win'),
              Icon(RpgAwesome.horn_call),
              Text(' or monsters win'),
              Icon(RpgAwesome.skull)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(RpgAwesome.perspective_dice_six_two),
              // TODO: use icons for dice result (1 to 6)
              Text('dice roll function')
            ],
          ),
        ],
      ),
    );
  }
}
