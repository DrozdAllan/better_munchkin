import 'package:better_munchkin/logic/cubit/battle_cubit.dart';
import 'package:better_munchkin/utils/commons.dart';

class PlayerChip extends StatelessWidget {
  final String name;
  final int colorId;
  final int power;
  const PlayerChip(
      {super.key,
      required this.name,
      required this.colorId,
      required this.power});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0),
      child: Chip(
        label: Text('$name (${power.toString()})'),
        backgroundColor: Color(colorId),
        deleteIcon: const Icon(CustomIcons.crossedBones, size: 16.0),
        onDeleted: () {
          context.read<BattleCubit>().removePlayer(name);
        },
      ),
    );
  }
}
