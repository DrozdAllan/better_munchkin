import 'package:flutter_bloc/flutter_bloc.dart';

class IsEpicCubit extends Cubit<bool> {
  IsEpicCubit() : super(false);

  void swap() => emit(!state);
}
