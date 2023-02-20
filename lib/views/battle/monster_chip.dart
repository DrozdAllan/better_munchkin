import 'package:better_munchkin/logic/cubit/battle_cubit.dart';
import 'package:better_munchkin/utils/commons.dart';

class MonsterChip extends StatelessWidget {
  final int index;
  final int power;
  const MonsterChip({super.key, required this.index, required this.power});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0),
      child: Chip(
        label: Text('Monster ${index + 1} (${power.toString()})'),
        deleteIcon: const Icon(CustomIcons.crossedBones, size: 16.0),
        onDeleted: () {
          context.read<BattleCubit>().removeMonster(index);
        },
      ),
    );
  }
}
