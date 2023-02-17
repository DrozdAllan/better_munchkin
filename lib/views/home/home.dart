import 'package:better_munchkin/logic/cubit/is_epic_cubit.dart';
import 'package:better_munchkin/views/battle/battle.dart';
import 'package:better_munchkin/views/home/player_list.dart';
import 'package:better_munchkin/utils/commons.dart';
import 'package:better_munchkin/views/strategic/strategic.dart';
import 'add_player_dialog.dart';
import 'remove_player_dialog.dart';
import 'package:fluttericon/rpg_awesome_icons.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
	// TODO: package icons before build
    return Scaffold(
      appBar: AppBar(
        title: const Text('Better Munchkin'),
        leading: BlocBuilder<IsEpicCubit, bool>(
          builder: (context, state) {
            return IconButton(
              icon: state
                  ? const Icon(RpgAwesome.wyvern)
                  : const Icon(RpgAwesome.gecko),
              onPressed: () {
                ScaffoldMessenger.of(context).clearSnackBars();
                context.read<IsEpicCubit>().swap();
                String mode = state
                    ? 'normal : maximum level is 10'
                    : 'epic : maximum level is 20';
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Gamemode set to $mode'),
                  ),
                );
              },
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(RpgAwesome.circle_of_circles),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const Strategic(),
                ),
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(
              onPressed: () => showDialog(
                context: context,
                builder: (context) => const AddPlayerDialog(),
              ),
              child: const Text('Add Player'),
            ),
            TextButton(
              onPressed: () => showDialog(
                context: context,
                builder: (context) => const RemovePlayerDialog(),
              ),
              child: const Text('Remove Player'),
            ),
          ],
        ),
      ),
      body: const PlayerList(),
      floatingActionButton: FloatingActionButton(
        mini: true,
        elevation: 0.0,
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const Battle(),
            ),
          );
        },
        child: const Icon(
          RpgAwesome.crossed_axes,
          size: 28.0,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndDocked,
    );
  }
}
