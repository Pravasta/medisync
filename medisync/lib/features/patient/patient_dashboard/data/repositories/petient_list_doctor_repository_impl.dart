import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:medisync/common/exception/exception.dart';
import 'package:medisync/common/exception/failure.dart';
import 'package:medisync/features/patient/patient_dashboard/data/datasource/patient_list_doctor_datasources.dart';
import 'package:medisync/features/patient/patient_dashboard/domain/entities/patient_list_doctor_entity.dart';
import 'package:medisync/features/patient/patient_dashboard/domain/repositories/patient_list_doctor_repositories.dart';

class PatientDoctorListRepositoriesImpl
    implements PatientDoctorListRepositories {
  final PatientDoctorListDataSources patientDoctorListDataSources;

  PatientDoctorListRepositoriesImpl(this.patientDoctorListDataSources);
  @override
  Future<Either<Failures, List<Doctor>>> getDoctors() async {
    try {
      final result = await patientDoctorListDataSources.getDoctor();
      return Right(result.map((e) => e.toEntity()).toList());
    } on TimeoutException {
      return const Left(TimeOutFailure('Timeout. No Response'));
    } on NotFoundException catch (e) {
      return Left(NotFoundFailure(e.message.toString()));
    } on ServerException {
      return const Left(ServerFailure('Server Error'));
    } catch (e) {
      return const Left(ServerFailure('Something went wrong'));
    }
  }
}
