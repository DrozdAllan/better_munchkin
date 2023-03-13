import 'package:better_munchkin/logic/cubit/battle_cubit.dart';
import 'package:better_munchkin/utils/commons.dart';

class MonsterChip extends StatelessWidget {
  final int index;
  final int strength;
  const MonsterChip({super.key, required this.index, required this.strength});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0),
      child: Chip(
        label: Text('${AppLocalizations.of(context)!.monster} ${index + 1} (${strength.toString()})'),
        deleteIcon: const Icon(CustomIcons.crossedBones, size: 16.0),
        onDeleted: () {
          context.read<BattleCubit>().removeMonster(index);
        },
      ),
    );
  }
}
