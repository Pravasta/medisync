part of 'patient_doctor_list_bloc.dart';

sealed class PatientDoctorListState extends Equatable {
  const PatientDoctorListState();

  @override
  List<Object> get props => [];
}

final class PatientDoctorListInitial extends PatientDoctorListState {}

final class PatientDoctorListLoading extends PatientDoctorListState {}

final class PatientDoctorListLoaded extends PatientDoctorListState {
  final List<Doctor> data;

  const PatientDoctorListLoaded(this.data);

  @override
  List<Object> get props => [data];
}

final class PatientDoctorListFailed extends PatientDoctorListState {
  final String error;

  const PatientDoctorListFailed(this.error);

  @override
  List<Object> get props => [error];
}
