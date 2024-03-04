import 'package:bloc/bloc.dart';

class PatiendMainNavigationCubit extends Cubit<int> {
  PatiendMainNavigationCubit() : super(0);

  changePage(newIndex) => emit(newIndex);
}
