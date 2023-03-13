import 'package:better_munchkin/data/models/player.dart';
import 'package:better_munchkin/logic/cubit/battle_cubit.dart';
import 'package:better_munchkin/utils/commons.dart';
import 'package:better_munchkin/utils/stat_dialog.dart';

class PlayerChip extends StatelessWidget {
  final Player player;
  const PlayerChip({super.key, required this.player});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0),
      child: GestureDetector(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) =>
                StatDialog(type: DialogType.battleStrength, player: player),
          );
        },
        child: Chip(
          label: Text('${player.name} (${player.strength.toString()})'),
          backgroundColor: Color(player.colorId),
          deleteIcon: const Icon(CustomIcons.crossedBones, size: 16.0),
          onDeleted: () {
            context.read<BattleCubit>().removePlayer(player.name);
          },
        ),
      ),
    );
  }
}
