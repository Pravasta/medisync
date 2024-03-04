import 'package:bloc/bloc.dart';

class PatientDashboadTabbarCubit extends Cubit<int> {
  PatientDashboadTabbarCubit() : super(0);

  void changeTab(newIndex) => emit(newIndex);
}
