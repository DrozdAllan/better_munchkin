import 'package:better_munchkin/logic/cubit/battle_cubit.dart';
import 'package:better_munchkin/utils/commons.dart';
import 'package:better_munchkin/utils/custom_chip.dart';

class PlayerBattleRow extends StatelessWidget {
  const PlayerBattleRow({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BattleCubit, BattleSet>(builder: (context, state) {
      return GridView.builder(
        itemCount: state.playerList!.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
        itemBuilder: (context, index) => CustomChip(
            name: state.playerList!.elementAt(index).name.toString(),
            power: state.playerList!.elementAt(index).power),
      );
    });
  }
}
