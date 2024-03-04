import 'dart:convert';

import 'package:medisync/features/patient/patient_dashboard/domain/entities/patient_list_doctor_entity.dart';

class PatientDoctorListModel {
  final int currentPage;
  final List<DoctorModel> data;
  final String firstPageUrl;

  final int from;
  final int lastPage;
  final String lastPageUrl;
  final List<LinkModel> links;
  final dynamic nextPageUrl;
  final String path;
  final int perPage;
  final dynamic prevPageUrl;
  final int to;
  final int total;

  PatientDoctorListModel({
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

  factory PatientDoctorListModel.fromRawJson(String str) =>
      PatientDoctorListModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PatientDoctorListModel.fromJson(Map<String, dynamic> json) =>
      PatientDoctorListModel(
        currentPage: json["current_page"],
        data: List<DoctorModel>.from(
            json["data"].map((x) => DoctorModel.fromJson(x))),
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
        links: List<LinkModel>.from(
            json["links"].map((x) => LinkModel.fromJson(x))),
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "first_page_url": firstPageUrl,
        "from": from,
        "last_page": lastPage,
        "last_page_url": lastPageUrl,
        "links": List<dynamic>.from(links.map((x) => x.toJson())),
        "next_page_url": nextPageUrl,
        "path": path,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
        "total": total,
      };

  PatientDoctorListEntity get toEntity => PatientDoctorListEntity(
        currentPage: currentPage,
        data: data.map((e) => e.toEntity()).toList(),
        firstPageUrl: firstPageUrl,
        from: from,
        lastPage: lastPage,
        lastPageUrl: lastPageUrl,
        links: links.map((e) => e.toEntity()).toList(),
        nextPageUrl: nextPageUrl,
        path: path,
        perPage: perPage,
        prevPageUrl: prevPageUrl,
        to: to,
        total: total,
      );
}

class DoctorModel {
  final int id;
  final String doctorName;
  final String description;
  final String photo;
  final int specializationId;
  final int hospitalId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<DoctorScheduleModel> doctorSchedules;
  final String medicalTreatment;
  final String practicalExperience;
  final String educationalHistory;
  final SpecializationModel specialization;

  DoctorModel({
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

  factory DoctorModel.fromRawJson(String str) =>
      DoctorModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DoctorModel.fromJson(Map<String, dynamic> json) => DoctorModel(
        description: json['description'],
        id: json["id"],
        doctorName: json["doctor_name"],
        photo: json["photo"],
        specializationId: json["specialization_id"],
        hospitalId: json["hospital_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        doctorSchedules: List<DoctorScheduleModel>.from(json["doctor_schedules"]
            .map((x) => DoctorScheduleModel.fromJson(x))),
        specialization: SpecializationModel.fromJson(json["specialization"]),
        medicalTreatment: json['medical_treatment'],
        practicalExperience: json['practical_experience'],
        educationalHistory: json['educational_history'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "doctor_name": doctorName,
        "description": description,
        "photo": photo,
        "specialization_id": specializationId,
        "hospital_id": hospitalId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "doctor_schedules":
            List<dynamic>.from(doctorSchedules.map((x) => x.toJson())),
        "specialization": specialization.toJson(),
        "medical_treatment": medicalTreatment,
        "practical_experience": practicalExperience,
        'educational_history': educationalHistory,
      };

  Doctor toEntity() => Doctor(
        id: id,
        doctorName: doctorName,
        description: description,
        photo: photo,
        specializationId: specializationId,
        hospitalId: hospitalId,
        createdAt: createdAt,
        updatedAt: updatedAt,
        doctorSchedules: doctorSchedules.map((e) => e.toEntity()).toList(),
        specialization: specialization.toEntity(),
        medicalTreatment: medicalTreatment,
        educationalHistory: educationalHistory,
        practicalExperience: practicalExperience,
      );
}

class DoctorScheduleModel {
  final int id;
  final int hospitalId;
  final int doctorId;
  final String day;
  final String startTime;
  final String endTime;
  final int patientLimit;
  final int consultationFee;
  final DateTime createdAt;
  final DateTime updatedAt;
  final HospitalModel hospital;

  DoctorScheduleModel({
    required this.id,
    required this.hospitalId,
    required this.doctorId,
    required this.day,
    required this.startTime,
    required this.endTime,
    required this.patientLimit,
    required this.consultationFee,
    required this.createdAt,
    required this.updatedAt,
    required this.hospital,
  });

  factory DoctorScheduleModel.fromRawJson(String str) =>
      DoctorScheduleModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DoctorScheduleModel.fromJson(Map<String, dynamic> json) =>
      DoctorScheduleModel(
        id: json["id"],
        hospitalId: json["hospital_id"],
        doctorId: json["doctor_id"],
        day: json["day"],
        startTime: json["start_time"],
        endTime: json["end_time"],
        patientLimit: json["patient_limit"],
        consultationFee: json["consultation_fee"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        hospital: HospitalModel.fromJson(json["hospital"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "hospital_id": hospitalId,
        "doctor_id": doctorId,
        "day": day,
        "start_time": startTime,
        "end_time": endTime,
        "patient_limit": patientLimit,
        "consultation_fee": consultationFee,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "hospital": hospital.toJson(),
      };

  DoctorSchedule toEntity() => DoctorSchedule(
        id: id,
        hospitalId: hospitalId,
        doctorId: doctorId,
        day: day,
        startTime: startTime,
        endTime: endTime,
        patientLimit: patientLimit,
        constultationFee: consultationFee,
        createdAt: createdAt,
        updatedAt: updatedAt,
        hospital: hospital.toEntity(),
      );
}

class HospitalModel {
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

  HospitalModel({
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

  factory HospitalModel.fromRawJson(String str) =>
      HospitalModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory HospitalModel.fromJson(Map<String, dynamic> json) => HospitalModel(
        id: json["id"],
        photo: json["photo"],
        hospitalName: json["hospital_name"],
        hospitalAddress: json["hospital_address"],
        hospitalLocationLatitude:
            json["hospital_location_latitude"]?.toDouble(),
        hospitalLocationLongitude:
            json["hospital_location_longitude"]?.toDouble(),
        hospitalPhoneNumber: json["hospital_phone_number"],
        hospitalWhatsappNumber: json["hospital_whatsapp_number"],
        hospitalEmail: json["hospital_email"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "photo": photo,
        "hospital_name": hospitalName,
        "hospital_address": hospitalAddress,
        "hospital_location_latitude": hospitalLocationLatitude,
        "hospital_location_longitude": hospitalLocationLongitude,
        "hospital_phone_number": hospitalPhoneNumber,
        "hospital_whatsapp_number": hospitalWhatsappNumber,
        "hospital_email": hospitalEmail,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };

  Hospital toEntity() => Hospital(
        id: id,
        photo: photo,
        hospitalName: hospitalName,
        hospitalAddress: hospitalAddress,
        hospitalLocationLatitude: hospitalLocationLatitude,
        hospitalLocationLongitude: hospitalLocationLongitude,
        hospitalPhoneNumber: hospitalPhoneNumber,
        hospitalWhatsappNumber: hospitalWhatsappNumber,
        hospitalEmail: hospitalEmail,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );
}

class SpecializationModel {
  final int id;
  final String specializationsName;
  final DateTime createdAt;
  final DateTime updatedAt;

  SpecializationModel({
    required this.id,
    required this.specializationsName,
    required this.createdAt,
    required this.updatedAt,
  });

  factory SpecializationModel.fromRawJson(String str) =>
      SpecializationModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SpecializationModel.fromJson(Map<String, dynamic> json) =>
      SpecializationModel(
        id: json["id"],
        specializationsName: json["specializations_name"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "specializations_name": specializationsName,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };

  Specialization toEntity() => Specialization(
        id: id,
        specializationsName: specializationsName,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );
}

class LinkModel {
  final String? url;
  final String label;
  final bool active;

  LinkModel({
    required this.url,
    required this.label,
    required this.active,
  });

  factory LinkModel.fromRawJson(String str) =>
      LinkModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LinkModel.fromJson(Map<String, dynamic> json) => LinkModel(
        url: json["url"],
        label: json["label"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "label": label,
        "active": active,
      };

  Link toEntity() => Link(
        url: url,
        label: label,
        active: active,
      );
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
