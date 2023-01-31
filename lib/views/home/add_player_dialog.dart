import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:better_munchkin/provider/player_provider.dart';

class AddPlayerDialog extends ConsumerStatefulWidget {
  const AddPlayerDialog({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AddPlayerDialogState();
}

class _AddPlayerDialogState extends ConsumerState<AddPlayerDialog> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  Color _color = const Color.fromARGB(255, 0, 0, 0);

  @override
  void dispose() {
    _name.dispose();
    super.dispose();
  }

  void changeColor(Color color) {
    setState(() => _color = color);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 355.0,
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _name,
                decoration: const InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 200.0,
                child: BlockPicker(
                    // TODO: at least 8 Colors
                    availableColors: const [
                      Color(0xFF8EDBCE),
                      Color(0xFFFFC4C6),
                      Color(0xFFFFDE9C),
                      Color(0xFFC5E7FF)
                    ], pickerColor: _color, onColorChanged: changeColor),
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ref.read(playerProvider.notifier).addPlayer(Player(
                        name: _name.text,
                        colorId: _color.value,
                        level: 1,
                        bonus: 0,
                        power: 1));
                    Navigator.pop(context);
                  }
                },
                child: const Text('Validate'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
