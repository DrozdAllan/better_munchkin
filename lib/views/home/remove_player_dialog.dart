import 'package:better_munchkin/data/models/player.dart';
import 'package:better_munchkin/logic/cubit/player_cubit.dart';
import 'package:better_munchkin/utils/commons.dart';

class RemovePlayerDialog extends StatelessWidget {
  const RemovePlayerDialog({super.key});

  @override
  Widget build(BuildContext context) {
	// TODO: refactor remove_player_dialog & player_battle_dialog
    return SimpleDialog(
      contentPadding: const EdgeInsets.only(top: 12.0),
      title: const Text(
        'Select the player to remove',
        textAlign: TextAlign.center,
      ),
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 2.30,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.elliptical(23.0, 16.0),
            ),
            child: BlocBuilder<PlayerCubit, List<Player>>(
                builder: (context, state) {
              return GridView.count(
                childAspectRatio: 2,
                crossAxisCount: 2,
                crossAxisSpacing: 5.0,
                mainAxisSpacing: 5.0,
                children: [
                  for (Player player in state)
                    GestureDetector(
                      onTap: () {
                        context.read<PlayerCubit>().removePlayer(player.name);
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
            }),
          ),
        ),
      ],
    );
  }
}
