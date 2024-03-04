import 'package:dartz/dartz.dart';
import 'package:medisync/features/patient/patient_dashboard/domain/entities/patient_list_doctor_entity.dart';
import 'package:medisync/features/patient/patient_dashboard/domain/repositories/patient_list_doctor_repositories.dart';

import '../../../../../common/exception/failure.dart';

class PatientDoctorListUsecases {
  final PatientDoctorListRepositories _patientDoctorListRepositories;

  PatientDoctorListUsecases(this._patientDoctorListRepositories);

  Future<Either<Failures, List<Doctor>>> call() {
    return _patientDoctorListRepositories.getDoctors();
  }
}
