import 'package:better_munchkin/data/models/player.dart';
import 'package:better_munchkin/logic/cubit/player_cubit.dart';
import 'package:better_munchkin/utils/commons.dart';
import 'package:better_munchkin/utils/string_casing_extension.dart';

class AddPlayerDialog extends StatefulWidget {
  const AddPlayerDialog({super.key});

  @override
  State<AddPlayerDialog> createState() => _AddPlayerDialogState();
}

class _AddPlayerDialogState extends State<AddPlayerDialog> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();

  List<Color> lightColors = const [
    Color(0xFFffbcaf),
    Color(0xFFffb2ff),
    Color(0xFFc0cfff),
    Color(0xFF8EDBCE),
    Color(0xFFe1ffb1),
    Color(0xFFb5ffff),
    Color(0xFFffffb1),
    Color(0xFFFFDE9C),
  ];

  List<Color> darkColors = const [
    Color(0xFFc62828),
    Color(0xFF6a1b9a),
    Color(0xFF283593),
    Color(0xFF0277bd),
    Color(0xFF00695c),
    Color(0xFF558b2f),
    Color(0xFFff8f00),
    Color(0xFFef6c00),
  ];

  @override
  void dispose() {
    _name.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: MediaQuery.of(context).size.height / 2.45,
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextFormField(
                textAlign: TextAlign.start,
                controller: _name,
                decoration: const InputDecoration(
                    label: Center(child: Text('Name')),
                    border: OutlineInputBorder()),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  for (Player player in context.read<PlayerCubit>().state) {
                    if (player.name == value.toTitleCase()) {
                      return 'Name already taken';
                    }
                  }
                  return null;
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 4.4,
                child: GridView.builder(
                  itemCount: lightColors.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 5.0,
                    crossAxisSpacing: 5.0,
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<PlayerCubit>().addPlayer(Player(
                              name: _name.text.toTitleCase(),
                              colorId: lightColors.elementAt(index).value,
                              level: 1,
                              bonus: 0,
                              power: 1));
                          Navigator.pop(context);
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: lightColors.elementAt(index),
                            shape: BoxShape.circle),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
