import 'package:better_munchkin/logic/cubit/is_epic_cubit.dart';
import 'package:better_munchkin/utils/battle_fab.dart';
import 'package:better_munchkin/views/home/player_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:better_munchkin/views/strategic/strategic.dart';
import 'add_player_dialog.dart';
import 'remove_player_dialog.dart';
import 'package:fluttericon/rpg_awesome_icons.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => IsEpicCubit(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: BlocBuilder<IsEpicCubit, bool>(
            builder: (context, state) {
              return IconButton(
                splashRadius: 20.0,
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
              splashRadius: 20.0,
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
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => const AddPlayerDialog(),
                  );
                },
                child: const Text('Add Player'),
              ),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => const RemovePlayerDialog(),
                  );
                },
                child: const Text('Remove Player'),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: const [
              PlayerList(),
            ],
          ),
        ),
        floatingActionButton: const BattleFab(),
      ),
    );
  }
}
