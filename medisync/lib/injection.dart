import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:medisync/common/endpoint/app_endpoint.dart';
import 'package:medisync/common/endpoint/uri_helper.dart';
import 'package:medisync/features/auth/data/datasources/google_auth/auth_remote_datasources.dart';
import 'package:medisync/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:medisync/features/auth/domain/repositories/auth_repositories.dart';
import 'package:medisync/features/auth/domain/usecases/get_current_uid_usecases.dart';
import 'package:medisync/features/auth/domain/usecases/is_loggin_google_usecases.dart';
import 'package:medisync/features/auth/domain/usecases/login_google_auth_usecases.dart';
import 'package:medisync/features/auth/domain/usecases/signout_google_usecases.dart';
import 'package:medisync/features/auth/presentation/bloc/credential/credential_bloc.dart';
import 'package:medisync/features/patient/patient_dashboard/data/datasource/patient_list_doctor_datasources.dart';
import 'package:medisync/features/patient/patient_dashboard/data/repositories/petient_list_doctor_repository_impl.dart';
import 'package:medisync/features/patient/patient_dashboard/domain/repositories/patient_list_doctor_repositories.dart';
import 'package:medisync/features/patient/patient_dashboard/domain/usecases/patient_list_doctor_usecases.dart';
import 'package:medisync/features/patient/patient_dashboard/presentation/bloc/patient_doctor_list_bloc.dart';
import 'package:medisync/features/patient/patient_dashboard/presentation/cubit/patient_dashboad_tabbar_cubit.dart';
import 'package:medisync/features/patient/patient_main_navigation/presentation/cubit/patiend_main_navigation_cubit.dart';

import 'features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:http/http.dart' as http;

final locator = GetIt.instance;

Future<void> initlocator() async {
  // BLOC
  locator.registerFactory(() => PatiendMainNavigationCubit());
  locator.registerFactory(() => PatientDashboadTabbarCubit());
  locator.registerFactory(() => AuthBloc(locator(), locator(), locator()));
  locator.registerFactory(() => CredentialBloc(locator()));
  locator.registerFactory(() => PatientDoctorListBloc(locator()));

  // Usecases
  locator.registerLazySingleton(() => GoogleAuthUsecases(locator()));
  locator.registerLazySingleton(() => SignOutUsecases(locator()));
  locator.registerLazySingleton(() => IsLoginUsecases(locator()));
  locator.registerLazySingleton(() => GetCurrentUidUsecases(locator()));
  locator.registerLazySingleton(() => PatientDoctorListUsecases(locator()));

  // Repository
  locator.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(locator()),
  );
  locator.registerLazySingleton<PatientDoctorListRepositories>(
      () => PatientDoctorListRepositoriesImpl(locator()));

  // Datasources
  locator.registerLazySingleton<AuthRemoteDataSources>(
    () => AuthRemoteDataSourcesImpl(
      firebaseAuth: locator(),
    ),
  );
  locator.registerLazySingleton<PatientDoctorListDataSources>(
    () => PatientDoctorListDataSourcesImpl(
      locator(),
      locator(),
    ),
  );

  // External
  final firebaseAuth = FirebaseAuth.instance;
  locator.registerLazySingleton(() => firebaseAuth);
  locator.registerLazySingleton(
    () => AppEndPoint(
      baseUrl: "192.168.100.62",
      port: 8000,
    ),
  );
  locator.registerLazySingleton(() => UriHelper());
  locator.registerLazySingleton<http.Client>(() => http.Client());
}
