import 'package:better_munchkin/data/models/player.dart';
import 'package:better_munchkin/logic/cubit/is_epic_cubit.dart';
import 'package:better_munchkin/logic/cubit/player_cubit.dart';
import 'package:better_munchkin/utils/commons.dart';
import 'package:fluttericon/rpg_awesome_icons.dart';

class PlayerCard extends StatefulWidget {
  const PlayerCard({super.key, required this.player});

  final Player player;

  @override
  State<PlayerCard> createState() => _PlayerCardState();
}

class _PlayerCardState extends State<PlayerCard> {
  final _iconSize = 28.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: Color(widget.player.colorId),
      ),
      height: 150.0,
      margin: const EdgeInsets.all(3.0),
      child: Column(
        children: [
          Text(
            widget.player.name,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 100.0,
                width: 100.0,
                child: Row(children: [
                  Icon(
                    RpgAwesome.corked_tube,
                    size: _iconSize,
                  ),
                  Expanded(
                    child: BlocBuilder<IsEpicCubit, bool>(
                      builder: (context, state) {
                        return ListWheelScrollView(
                          itemExtent: 42,
                          diameterRatio: 1.2,
                          onSelectedItemChanged: (index) {
                            // Note : it starts with index 0 but the minimum level is 1
                            // so it's always index + 1
                            context
                                .read<PlayerCubit>()
                                .setLevel(widget.player.name, index + 1);
                          },
                          children: List.generate(state ? 19 : 9, (index) {
                            return Text(
                              (index + 1).toString(),
                            );
                          }, growable: false),
                        );
                      },
                    ),
                  ),
                ]),
              ),
              SizedBox(
                height: 100.0,
                width: 100.0,
                child: Row(children: [
                  Icon(
                    RpgAwesome.large_hammer,
                    size: _iconSize,
                  ),
                  Expanded(
                    child: ListWheelScrollView(
                      itemExtent: 42,
                      diameterRatio: 1.2,
                      //   useMagnifier: true,
                      //   magnification: 1.2,
                      onSelectedItemChanged: (index) {
                        context
                            .read<PlayerCubit>()
                            .setBonus(widget.player.name, index);
                      },
                      children: List.generate(30, (index) {
                        return Text(
                          //   widget.player.bonus.toString(),
                          index.toString(),
                        );
                      }, growable: false),
                    ),
                  ),
                ]),
              ),
              SizedBox(
                height: 100.0,
                width: 100.0,
                child: Row(children: [
                  Icon(
                    RpgAwesome.targeted,
                    size: _iconSize,
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        widget.player.power.toString(),
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
