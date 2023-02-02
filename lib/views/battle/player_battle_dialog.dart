import 'package:better_munchkin/data/models/player.dart';
import 'package:better_munchkin/logic/cubit/battle_cubit.dart';
import 'package:better_munchkin/logic/cubit/player_cubit.dart';
import 'package:better_munchkin/utils/commons.dart';

class PlayerBattleDialog extends StatelessWidget {
  const PlayerBattleDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 400.0,
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Text('Select the player to battle'),
            SizedBox(
              height: 345,
              child: BlocBuilder<PlayerCubit, List<Player>>(
                builder: (context, state) {
					// TODO: change GridView to Checkbox
                  return GridView.count(
                    padding: const EdgeInsets.only(top: 12.0),
                    childAspectRatio: 2,
                    crossAxisCount: 2,
                    crossAxisSpacing: 25.0,
                    mainAxisSpacing: 25.0,
                    children: [
                      for (Player player in state)
                        TextButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  Color(player.colorId))),
                          onPressed: () {
                            context
                                .read<BattleCubit>()
                                .addPlayer(player);
                            Navigator.pop(context);
                          },
                          child: Text(
                            player.name.toString().toUpperCase(),
                          ),
                        )
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
