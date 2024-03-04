import 'package:intl/intl.dart';
import 'package:medisync/features/patient/patient_dashboard/domain/entities/patient_list_doctor_entity.dart';

class PatientDoctorDetailItem {
  final Hospital hospital;
  final List<DoctorSchedule> schedules;

  PatientDoctorDetailItem({required this.hospital, required this.schedules});
}

class PatientDoctorDetailScheduleList {
  List<PatientDoctorDetailItem> generate(Doctor doctor) {
    var todayDay = DateFormat("EEEE").format(DateTime.now());
    List<PatientDoctorDetailItem> doctorSchedulesByHospitals = [];
    /*
    Last Format : 
    sc1
      hospital1
    sc2
      hospital1
    sc3
      hospital1

    To Format :
    hospital1:
      sc1
      sc2
      sc3
    */
    List<Hospital> hospitals = [];
    for (var item in doctor.doctorSchedules) {
      var index = hospitals.indexWhere((element) => element.id == item.id);
      if (index == -1) {
        hospitals.add(item.hospital);
      }
    }

    hospitals = hospitals.toSet().toList();

    for (var schedule in doctor.doctorSchedules) {
      var index = doctorSchedulesByHospitals
          .indexWhere((element) => element.hospital.id == schedule.hospital.id);

      if (todayDay == schedule.day) {
        if (index > -1) {
          doctorSchedulesByHospitals[index].schedules.add(schedule);
        } else {
          doctorSchedulesByHospitals.add(
            PatientDoctorDetailItem(
              hospital: schedule.hospital,
              schedules: [schedule],
            ),
          );
        }
      }
    }
    return doctorSchedulesByHospitals;
  }
}
