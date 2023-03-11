import 'package:better_munchkin/logic/cubit/is_epic_cubit.dart';
import 'package:better_munchkin/logic/cubit/is_grid_cubit.dart';
import 'package:better_munchkin/utils/custom_dialog.dart';
import 'package:better_munchkin/views/battle/battle.dart';
import 'package:better_munchkin/views/home/player_grid.dart';
import 'package:better_munchkin/views/home/player_list.dart';
import 'package:better_munchkin/utils/commons.dart';
import 'add_player_dialog.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Better Munchkin'),
        leading: BlocBuilder<IsEpicCubit, bool>(
          builder: (context, state) {
            return Padding(
			  padding: const EdgeInsets.all(7.0),
			  child: IconButton(
				iconSize: state ? 28.0 : 24.0,
				icon: state
					? const Icon(
						CustomIcons.bladeBite,
					  )
					: const Icon(CustomIcons.boneBite),
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
			  ),
			);
          },
        ),
        actions: [
          BlocBuilder<IsGridCubit, bool>(
            builder: (context, state) {
              return IconButton(
                icon: AnimatedRotation(
                    duration: const Duration(milliseconds: 600),
                    turns: state ? 0 : 1,
                    child: const Icon(CustomIcons.doubled)),
                onPressed: () {
                  context.read<IsGridCubit>().swap();
                },
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
                builder: (context) => const CustomDialog(dialogType: false),
              ),
              child: const Text('Remove Player'),
            ),
          ],
        ),
      ),
      body: BlocBuilder<IsGridCubit, bool>(
        builder: (context, state) {
          if (state == true) {
            return const PlayerGrid();
          } else {
            return const PlayerList();
          }
        },
      ),
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
          CustomIcons.crossedAxes,
          size: 28.0,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndDocked,
    );
  }
}
