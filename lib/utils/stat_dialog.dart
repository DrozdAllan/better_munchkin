import 'package:better_munchkin/data/models/player.dart';
import 'package:better_munchkin/logic/cubit/battle_cubit.dart';
import 'package:better_munchkin/logic/cubit/is_epic_cubit.dart';
import 'package:better_munchkin/logic/cubit/player_cubit.dart';
import 'package:better_munchkin/utils/commons.dart';

enum DialogType { monster, level, bonus, battleStrength }

class StatDialog extends StatefulWidget {
  final DialogType type;
  final Player? player;

  const StatDialog({super.key, required this.type, this.player});

  @override
  State<StatDialog> createState() => _StatDialogState();
}

class _StatDialogState extends State<StatDialog> {
  late int _baseIndex;
  late int _listLength;
  late String _dialogTitle;
  late String _buttonTitle;
  late Function _buttonFunction;

  @override
  Widget build(BuildContext context) {
    switch (widget.type) {
      case DialogType.monster:
        _baseIndex = 1;
        _listLength = 30;
        _dialogTitle = AppLocalizations.of(context)!.monsterDialog;
        _buttonTitle = AppLocalizations.of(context)!.addMonster;
        _buttonFunction =
            () => context.read<BattleCubit>().addMonster(_baseIndex);
        break;
      case DialogType.level:
        _baseIndex = widget.player!.level;
        _dialogTitle = AppLocalizations.of(context)!
            .playerLevelDialog(widget.player!.name);
        _buttonTitle = AppLocalizations.of(context)!.modifLevel;
        _buttonFunction = () => context
            .read<PlayerCubit>()
            .setLevel(widget.player!.name, _baseIndex + 1);
        break;
      case DialogType.bonus:
        _baseIndex = widget.player!.bonus;
        _listLength = 40;
        _dialogTitle = AppLocalizations.of(context)!
            .playerBonusDialog(widget.player!.name);
        _buttonTitle = AppLocalizations.of(context)!.modifBonus;
        _buttonFunction = () => context
            .read<PlayerCubit>()
            .setBonus(widget.player!.name, _baseIndex);
        break;
      case DialogType.battleStrength:
        _baseIndex = widget.player!.strength;
        _listLength = 40;
        _dialogTitle = AppLocalizations.of(context)!
            .playerStrengthDialog(widget.player!.name);
        _buttonTitle = AppLocalizations.of(context)!.modifStrength;
        _buttonFunction = () => context
            .read<BattleCubit>()
            .modifyPlayer(widget.player!.name, _baseIndex + 1);

			// TODO: add case.DialogType.monsterStrength to add to monster chip
        break;
    }

    return SimpleDialog(
      title: Text(
        _dialogTitle,
        textAlign: TextAlign.center,
      ),
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 4.4,
              child: BlocBuilder<IsEpicCubit, bool>(
                builder: (context, state) {
                  if (widget.type == DialogType.level && state == true) {
                    _listLength = 19;
                  } else if (widget.type == DialogType.level &&
                      state == false) {
                    _listLength = 9;
                  }
                  return ListWheelScrollView(
                    itemExtent: 52,
                    diameterRatio: 1.2,
                    useMagnifier: true,
                    magnification: 1.6,
                    physics: const FixedExtentScrollPhysics(),
                    controller:
                        FixedExtentScrollController(initialItem: _baseIndex),
                    onSelectedItemChanged: (index) {
                      _baseIndex = index;
                    },
                    children: List.generate(_listLength, (index) {
                      return Text(
                        widget.type == DialogType.level
                            ? (index + 1).toString()
                            : (index).toString(),
                        style: const TextStyle(
                          fontSize: 38.0,
                        ),
                      );
                    }, growable: false),
                  );
                },
              ),
            ),
            TextButton(
              onPressed: () {
                _buttonFunction();
                Navigator.pop(context);
              },
              child: Text(
                _buttonTitle,
                style: const TextStyle(fontSize: 20.0),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
