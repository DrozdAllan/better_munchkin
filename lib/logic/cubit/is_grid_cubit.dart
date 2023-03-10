import 'package:flutter_bloc/flutter_bloc.dart';

class IsGridCubit extends Cubit<bool> {
  IsGridCubit() : super(false);

  void swap() => emit(!state);
}
