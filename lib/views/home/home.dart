import 'package:better_munchkin/views/home/player_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:better_munchkin/views/strategic/strategic.dart';
import 'package:better_munchkin/provider/is_epic_provider.dart';
import 'add_player_dialog.dart';
import 'remove_player_dialog.dart';
import 'package:fluttericon/rpg_awesome_icons.dart';

class Home extends ConsumerWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          splashRadius: 20.0,
          icon: ref.watch(isEpicProvider)
              ? const Icon(RpgAwesome.wyvern)
              : const Icon(RpgAwesome.gecko),
          onPressed: () {
            ScaffoldMessenger.of(context).clearSnackBars();
            ref.read(isEpicProvider.notifier).update((state) => !state);
            String mode = ref.watch(isEpicProvider)
                ? 'epic : maximum level is 20'
                : 'normal : maximum level is 10';
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Gamemode set to $mode'),
              ),
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
    );
  }
}
