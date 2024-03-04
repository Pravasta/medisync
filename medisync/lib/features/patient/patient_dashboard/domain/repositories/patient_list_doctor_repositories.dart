import 'package:dartz/dartz.dart';
import 'package:medisync/common/exception/failure.dart';
import 'package:medisync/features/patient/patient_dashboard/domain/entities/patient_list_doctor_entity.dart';

abstract class PatientDoctorListRepositories {
  Future<Either<Failures, List<Doctor>>> getDoctors();
}
