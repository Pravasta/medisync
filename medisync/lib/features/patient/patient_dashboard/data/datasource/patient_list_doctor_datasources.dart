import 'package:http/http.dart' as http;
import 'package:medisync/common/endpoint/app_endpoint.dart';
import 'package:medisync/common/exception/exception.dart';
import 'package:medisync/features/patient/patient_dashboard/data/model/patient_list_doctor_model.dart';

abstract class PatientDoctorListDataSources {
  Future<List<DoctorModel>> getDoctor();
}

class PatientDoctorListDataSourcesImpl implements PatientDoctorListDataSources {
  final http.Client client;
  final AppEndPoint appEndPoint;

  PatientDoctorListDataSourcesImpl(this.client, this.appEndPoint);

  @override
  Future<List<DoctorModel>> getDoctor() async {
    final url = appEndPoint.get('doctors');

    final response = await client.get(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return PatientDoctorListModel.fromRawJson(response.body).data;
    } else {
      throw ServerException();
    }
  }
}
