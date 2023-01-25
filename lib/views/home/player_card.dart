import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../provider/is_epic_provider.dart';
import '../../provider/player_provider.dart';

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
      height: 180.0,
      child: Column(
        children: [
          Text(
            widget.player.name.toString().toUpperCase(),
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28.0,
                color: Theme.of(context).cardColor),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 140.0,
                width: 100.0,
                child: Row(children: [
                  Icon(
                    Icons.airplanemode_on,
                    color: Theme.of(context).cardColor,
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
                            style: TextStyle(
                                fontSize: 38.0,
                                color: Theme.of(context).cardColor),
                          );
                        })),
                  ),
                ]),
              ),
              SizedBox(
                height: 140.0,
                width: 100.0,
                child: Row(children: [
                  Icon(Icons.push_pin, color: Theme.of(context).cardColor),
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
                                style: TextStyle(
                                    fontSize: 38.0,
                                    color: Theme.of(context).cardColor),
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
                  Icon(Icons.equalizer, color: Theme.of(context).cardColor),
                  SizedBox(
                    height: 140.0,
                    width: 75.0,
                    child: Center(
                      child: Text(
                        widget.player.power.toString(),
                        style: TextStyle(
                            fontSize: 54.0, color: Theme.of(context).cardColor),
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
