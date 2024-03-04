part of 'patient_doctor_list_bloc.dart';

sealed class PatientDoctorListEvent extends Equatable {
  const PatientDoctorListEvent();

  @override
  List<Object> get props => [];
}

class OnGetPatientDoctorListEvent extends PatientDoctorListEvent {}
