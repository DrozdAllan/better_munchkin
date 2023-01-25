import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:better_munchkin/provider/player_provider.dart';

class RemovePlayerDialog extends ConsumerWidget {
  const RemovePlayerDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(playerProvider);
    final notifier = ref.read(playerProvider.notifier);

    return Dialog(
      child: Container(
        height: 400.0,
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Text('Select the player to remove'),
            SizedBox(
              height: 345,
              child: GridView.count(
                padding: const EdgeInsets.only(top: 12.0),
                childAspectRatio: 2,
                crossAxisCount: 2,
                crossAxisSpacing: 25.0,
                mainAxisSpacing: 25.0,
                children: [
                  for (Player player in provider)
                    ElevatedButton(
                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color(player.colorId))),
                      onPressed: () {
                        notifier.removePlayer(player.name);
                        Navigator.pop(context);
                      },
                      child: Text(
                        player.name.toString().toUpperCase(),
                      ),
                    )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
