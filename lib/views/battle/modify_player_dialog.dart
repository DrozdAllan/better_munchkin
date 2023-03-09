import 'package:better_munchkin/data/models/player.dart';
import 'package:better_munchkin/logic/cubit/battle_cubit.dart';
import 'package:better_munchkin/utils/commons.dart';

class ModifyPlayerDialog extends StatefulWidget {
  final Player player;
  const ModifyPlayerDialog({super.key, required this.player});

  @override
  State<ModifyPlayerDialog> createState() => _ModifyPlayerDialogState();
}

class _ModifyPlayerDialogState extends State<ModifyPlayerDialog> {
  late int _playerPower;

  @override
  void initState() {
    super.initState();
    _playerPower = widget.player.power;
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text(
        '${widget.player.name}\'s Power',
        textAlign: TextAlign.center,
      ),
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 4.4,
              child: ListWheelScrollView(
                physics: const FixedExtentScrollPhysics(),
                controller:
                    FixedExtentScrollController(initialItem: _playerPower),
                itemExtent: 52,
                diameterRatio: 1.2,
                useMagnifier: true,
                magnification: 1.6,
                onSelectedItemChanged: (initialItem) {
                  _playerPower = initialItem;
                },
                children: List.generate(40, (initialItem) {
                  return Text(
                    (initialItem).toString(),
                    style: const TextStyle(
                      fontSize: 38.0,
                    ),
                  );
                }, growable: false),
              ),
            ),
            TextButton(
              onPressed: () {
                context
                    .read<BattleCubit>()
                    .modifyPlayer(widget.player, _playerPower);
                Navigator.pop(context);
              },
              child: const Text(
                'Modify Power',
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
