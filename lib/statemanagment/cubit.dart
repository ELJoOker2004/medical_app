import 'package:flutter_bloc/flutter_bloc.dart';

enum Option {
  doctor,
  receptionist,
  nurse,
  analysisEmployee,
  manager,
  hr,
}

class AppCubit extends Cubit<Option> {
  AppCubit() : super(Option.doctor); // Set the initial option

  void updateOption(Option option) {
    emit(option); // Emit the new option
  }
}
