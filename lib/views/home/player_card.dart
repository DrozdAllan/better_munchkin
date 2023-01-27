import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttericon/rpg_awesome_icons.dart';

import 'package:better_munchkin/provider/is_epic_provider.dart';
import 'package:better_munchkin/provider/player_provider.dart';

class PlayerCard extends ConsumerStatefulWidget {
  const PlayerCard({Key? key, required this.player}) : super(key: key);

  final Player player;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PlayerCardState();
}

class _PlayerCardState extends ConsumerState<PlayerCard> {
  var level = 1;
  var bonus = 0;

  @override
  Widget build(BuildContext context) {
    final notifier = ref.read(playerProvider.notifier);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Color(widget.player.colorId), width: 3.0),
        color: Color(widget.player.colorId),
      ),
      margin: const EdgeInsets.only(top: 6.0),
      height: 190.0,
      child: Column(
        children: [
          Text(
            widget.player.name.toString().toUpperCase(),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28.0,
              // color: Colors.white
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 140.0,
                width: 100.0,
                child: Row(children: [
                  const Icon(
                    RpgAwesome.corked_tube,
                    // color: Colors.white,
                  ),
                  SizedBox(
                    height: 140.0,
                    width: 75.0,
                    child: ListWheelScrollView(
                        itemExtent: 52,
                        diameterRatio: 1.2,
                        useMagnifier: true,
                        magnification: 1.4,
                        onSelectedItemChanged: (value) {
                          level = value + 1;
                          notifier.setPower(widget.player.name, level + bonus);
                        },
                        children: List.generate(
                            ref.watch(isEpicProvider) ? 19 : 9, (index) {
                          var value = index + 1;
                          return Text(
                            value.toString(),
                            style: const TextStyle(
                              fontSize: 38.0,
                              // color: Colors.white
                            ),
                          );
                        })),
                  ),
                ]),
              ),
              SizedBox(
                height: 140.0,
                width: 100.0,
                child: Row(children: [
                  const Icon(RpgAwesome.large_hammer, 
				//   color: Colors.white
				  ),
                  SizedBox(
                    height: 140.0,
                    width: 75.0,
                    child: ListWheelScrollView(
                        itemExtent: 52,
                        diameterRatio: 1.2,
                        useMagnifier: true,
                        magnification: 1.4,
                        onSelectedItemChanged: (value) {
                          bonus = value;
                          notifier.setPower(widget.player.name, level + bonus);
                        },
                        children: [
                          for (var i = 0; i <= 30; i++)
                            Center(
                              child: Text(
                                i.toString(),
                                style: const TextStyle(
                                    fontSize: 38.0, 
									// color: Colors.white
									),
                              ),
                            ),
                        ]),
                  ),
                ]),
              ),
              SizedBox(
                height: 140.0,
                width: 100.0,
                child: Row(children: [
                  const Icon(RpgAwesome.targeted, 
				//   color: Colors.white
				  ),
                  SizedBox(
                    height: 140.0,
                    width: 75.0,
                    child: Center(
                      child: Text(
                        widget.player.power.toString(),
                        style: const TextStyle(
                            fontSize: 54.0, 
							// color: Colors.white
							),
                      ),
                    ),
                  ),
                ]),
              ),
            ],
          )
        ],
      ),
    );
  }
}
