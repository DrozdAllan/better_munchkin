import 'dart:math';

import 'package:better_munchkin/utils/commons.dart';
import 'package:rive/rive.dart';

class DiceWidget extends StatefulWidget {
  const DiceWidget({super.key});

  @override
  State<DiceWidget> createState() => _DiceWidgetState();
}

class _DiceWidgetState extends State<DiceWidget> {
  SMITrigger? _onTap;
  SMIInput<double>? _diceResult;

  void _onRiveInit(Artboard artboard) {
    final controller =
        StateMachineController.fromArtboard(artboard, 'State Machine 1');
    artboard.addController(controller!);

    _onTap = controller.findInput<bool>('onTap') as SMITrigger;
    _diceResult = controller.findInput<double>('Result') as SMINumber;
  }

  void _userTap() => _onTap?.fire();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 75,
      height: 75,
      child: GestureDetector(
        onTap: diceRoll,
        child: RiveAnimation.asset(
          'assets/dice.riv',
          fit: BoxFit.cover,
          onInit: _onRiveInit,
        ),
      ),
    );
  }

  void diceRoll() {
    _userTap();

    double diceResult = (Random().nextInt(6) + 1).toDouble();

    setState(() {
      _diceResult!.value = diceResult;
    });
  }
}
