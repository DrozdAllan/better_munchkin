import 'package:better_munchkin/utils/custom_chip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttericon/rpg_awesome_icons.dart';

class Battle extends ConsumerWidget {
  const Battle({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  const Icon(RpgAwesome.knight_helmet, size: 52.0),
                  Row(
                    children: [
                      const CustomChip(name: 'Suzie', power: 6),
                      const CustomChip(name: 'Mimi', power: 4),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(RpgAwesome.hospital_cross)),
                    ],
                  )
                ],
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  const Icon(RpgAwesome.monster_skull, size: 52.0),
                  Row(
                    children: [
                      const CustomChip(name: 'Monster 1', power: 12),
                      const CustomChip(name: 'Monster 2', power: 8),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(RpgAwesome.hospital_cross)),
                    ],
                  )
                ],
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('players win'),
              Icon(RpgAwesome.horn_call),
              Text(' or monsters win'),
              Icon(RpgAwesome.skull)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(RpgAwesome.perspective_dice_six_two),
              // TODO: use icons for dice result (1 to 6)
              Text('dice roll function')
            ],
          ),
        ],
      ),
    );
  }
}
