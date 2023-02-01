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
  @override
  Widget build(BuildContext context) {
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
                  ),
                  SizedBox(
                    height: 140.0,
                    width: 75.0,
                    child: BlocBuilder<IsEpicCubit, bool>(
                      builder: (context, state) {
                        return ListWheelScrollView(
                          itemExtent: 52,
                          diameterRatio: 1.2,
                          useMagnifier: true,
                          magnification: 1.4,
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
                              //   widget.player.level.toString(),
                              style: const TextStyle(
                                fontSize: 38.0,
                              ),
                            );
                          }, growable: false),
                        );
                      },
                    ),
                  ),
                ]),
              ),
              SizedBox(
                height: 140.0,
                width: 100.0,
                child: Row(children: [
                  const Icon(
                    RpgAwesome.large_hammer,
                  ),
                  SizedBox(
                    height: 140.0,
                    width: 75.0,
                    child: ListWheelScrollView(
                      itemExtent: 52,
                      diameterRatio: 1.2,
                      useMagnifier: true,
                      magnification: 1.4,
                      onSelectedItemChanged: (index) {
                        context
                            .read<PlayerCubit>()
                            .setBonus(widget.player.name, index);
                      },
                      children: List.generate(30, (index) {
                        return Text(
                          //   widget.player.bonus.toString(),
                          index.toString(),
                          style: const TextStyle(
                            fontSize: 38.0,
                          ),
                        );
                      }, growable: false),
                    ),
                  ),
                ]),
              ),
              SizedBox(
                height: 140.0,
                width: 100.0,
                child: Row(children: [
                  const Icon(
                    RpgAwesome.targeted,
                  ),
                  SizedBox(
                    height: 140.0,
                    width: 75.0,
                    child: Center(
                      child: Text(
                        widget.player.power.toString(),
                        style: const TextStyle(
                          fontSize: 54.0,
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
