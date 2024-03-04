import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medisync/features/patient/patient_dashboard/domain/entities/patient_list_doctor_entity.dart';
import 'package:medisync/features/patient/patient_dashboard/domain/usecases/patient_list_doctor_usecases.dart';

part 'patient_doctor_list_event.dart';
part 'patient_doctor_list_state.dart';

class PatientDoctorListBloc
    extends Bloc<PatientDoctorListEvent, PatientDoctorListState> {
  final PatientDoctorListUsecases _patientDoctorListUsecases;

  PatientDoctorListBloc(this._patientDoctorListUsecases)
      : super(PatientDoctorListInitial()) {
    on<PatientDoctorListEvent>((event, emit) {});
    on<OnGetPatientDoctorListEvent>((event, emit) async {
      emit(PatientDoctorListLoading());
      final result = await _patientDoctorListUsecases.call();
      result.fold(
        (l) => emit(PatientDoctorListFailed(l.message.toString())),
        (r) => emit(PatientDoctorListLoaded(r)),
      );
    });
  }
}
