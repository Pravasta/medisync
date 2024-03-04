import 'package:equatable/equatable.dart';

class PatientDoctorListEntity extends Equatable {
  final int currentPage;
  final List<Doctor> data;
  final String firstPageUrl;
  final int from;
  final int lastPage;
  final String lastPageUrl;
  final List<Link> links;
  final dynamic nextPageUrl;
  final String path;
  final int perPage;
  final dynamic prevPageUrl;
  final int to;
  final int total;

  const PatientDoctorListEntity({
    required this.currentPage,
    required this.data,
    required this.firstPageUrl,
    required this.from,
    required this.lastPage,
    required this.lastPageUrl,
    required this.links,
    required this.nextPageUrl,
    required this.path,
    required this.perPage,
    required this.prevPageUrl,
    required this.to,
    required this.total,
  });

  @override
  List<Object?> get props => [
        currentPage,
        data,
        firstPageUrl,
        from,
        lastPage,
        lastPageUrl,
        links,
        nextPageUrl,
        path,
        perPage,
        prevPageUrl,
        to,
        total,
      ];
}

class Doctor extends Equatable {
  final int id;
  final String doctorName;
  final String description;
  final String photo;
  final int specializationId;
  final int hospitalId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<DoctorSchedule> doctorSchedules;
  final String medicalTreatment;
  final String practicalExperience;
  final String educationalHistory;
  final Specialization specialization;

  const Doctor({
    required this.description,
    required this.id,
    required this.doctorName,
    required this.photo,
    required this.specializationId,
    required this.hospitalId,
    required this.createdAt,
    required this.updatedAt,
    required this.doctorSchedules,
    required this.medicalTreatment,
    required this.practicalExperience,
    required this.educationalHistory,
    required this.specialization,
  });

  @override
  List<Object?> get props => [
        id,
        doctorName,
        description,
        photo,
        specializationId,
        hospitalId,
        createdAt,
        updatedAt,
        doctorSchedules,
        medicalTreatment,
        educationalHistory,
        practicalExperience,
        specialization,
      ];
}

class DoctorSchedule extends Equatable {
  final int id;
  final int hospitalId;
  final int doctorId;
  final String day;
  final String startTime;
  final String endTime;
  final int patientLimit;
  final int constultationFee;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Hospital hospital;

  const DoctorSchedule({
    required this.id,
    required this.hospitalId,
    required this.doctorId,
    required this.day,
    required this.startTime,
    required this.endTime,
    required this.patientLimit,
    required this.constultationFee,
    required this.createdAt,
    required this.updatedAt,
    required this.hospital,
  });

  @override
  List<Object?> get props => [
        id,
        hospitalId,
        doctorId,
        day,
        startTime,
        endTime,
        patientLimit,
        constultationFee,
        createdAt,
        updatedAt,
        hospital,
      ];
}

class Hospital extends Equatable {
  final int id;
  final String photo;
  final String hospitalName;
  final String hospitalAddress;
  final double hospitalLocationLatitude;
  final double hospitalLocationLongitude;
  final String hospitalPhoneNumber;
  final String hospitalWhatsappNumber;
  final String hospitalEmail;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Hospital({
    required this.id,
    required this.photo,
    required this.hospitalName,
    required this.hospitalAddress,
    required this.hospitalLocationLatitude,
    required this.hospitalLocationLongitude,
    required this.hospitalPhoneNumber,
    required this.hospitalWhatsappNumber,
    required this.hospitalEmail,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        photo,
        hospitalName,
        hospitalAddress,
        hospitalLocationLatitude,
        hospitalLocationLongitude,
        hospitalPhoneNumber,
        hospitalWhatsappNumber,
        hospitalEmail,
        createdAt,
        updatedAt,
      ];
}

class Specialization extends Equatable {
  final int id;
  final String specializationsName;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Specialization({
    required this.id,
    required this.specializationsName,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        specializationsName,
        createdAt,
        updatedAt,
      ];
}

class Link extends Equatable {
  final String? url;
  final String label;
  final bool active;

  const Link({
    required this.url,
    required this.label,
    required this.active,
  });

  @override
  List<Object?> get props => [
        url,
        label,
        active,
      ];
}
