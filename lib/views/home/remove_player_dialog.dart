import 'package:better_munchkin/data/models/player.dart';
import 'package:better_munchkin/logic/cubit/player/player_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RemovePlayerDialog extends StatelessWidget {
  const RemovePlayerDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 400.0,
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Text('Select the player to remove'),
            SizedBox(
              height: 345,
              child: BlocBuilder<PlayerCubit, List<Player>>(
                builder: (context, state) {
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
                            context.read<PlayerCubit>().removePlayer(player.name);
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
