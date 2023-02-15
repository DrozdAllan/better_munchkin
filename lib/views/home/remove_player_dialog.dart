import 'package:better_munchkin/data/models/player.dart';
import 'package:better_munchkin/logic/cubit/player_cubit.dart';
import 'package:better_munchkin/utils/commons.dart';

class RemovePlayerDialog extends StatelessWidget {
  const RemovePlayerDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: MediaQuery.of(context).size.height / 1.75,
        padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
        child: Column(
          children: [
            const Text('Select the player to remove',
                textAlign: TextAlign.center),
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.elliptical(23.0, 11.0),
                ),
                child: BlocBuilder<PlayerCubit, List<Player>>(
                  builder: (context, state) {
                    return GridView.count(
                      shrinkWrap: true,
                      padding: const EdgeInsets.only(top: 12.0),
                      childAspectRatio: 2,
                      crossAxisCount: 2,
                      crossAxisSpacing: 5.0,
                      mainAxisSpacing: 5.0,
                      children: [
                        for (Player player in state)
                          GestureDetector(
                            onTap: () {
                              context
                                  .read<PlayerCubit>()
                                  .removePlayer(player.name);
                              Navigator.pop(context);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(player.colorId),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Center(
                                child: Text(
                                  player.name,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
