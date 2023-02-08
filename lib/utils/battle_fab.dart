import 'package:better_munchkin/views/battle/battle.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/rpg_awesome_icons.dart';

class BattleFab extends StatelessWidget {
  const BattleFab({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      mini: true,
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
    );
  }
}
