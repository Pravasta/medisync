import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medisync/common/theme/theme_data.dart';
import 'package:medisync/config/routes/route_handler.dart';
import 'package:medisync/config/routes/route_name.dart';
import 'package:medisync/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:medisync/features/auth/presentation/bloc/credential/credential_bloc.dart';
import 'package:medisync/features/patient/patient_dashboard/presentation/bloc/patient_doctor_list_bloc.dart';
import 'features/patient/patient_dashboard/presentation/cubit/patient_dashboad_tabbar_cubit.dart';
import 'features/patient/patient_main_navigation/presentation/cubit/patiend_main_navigation_cubit.dart';
import 'package:medisync/injection.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await initlocator();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState!;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => locator<PatiendMainNavigationCubit>()),
        BlocProvider(create: (_) => locator<PatientDashboadTabbarCubit>()),
        BlocProvider(
            create: (_) => locator<AuthBloc>()..add(OnAuthenticatedEvent())),
        BlocProvider(create: (_) => locator<CredentialBloc>()),
        BlocProvider(
            create: (_) => locator<PatientDoctorListBloc>()
              ..add(OnGetPatientDoctorListEvent())),
      ],
      child: MaterialApp(
        title: 'Medisync',
        debugShowCheckedModeBanner: false,
        theme: ThemeDataStyle.lightColor,
        navigatorKey: _navigatorKey,
        themeMode: ThemeMode.light,
        initialRoute: Routes.splashPage,
        onGenerateRoute: RouteHandler.onGenerateRoute,
        builder: (context, child) {
          return BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is Authenticated) {
                _navigator.pushNamedAndRemoveUntil(
                    Routes.splashPage, (route) => false,
                    arguments: true);
              }
              if (state is Unauthenticated) {
                _navigator.pushNamedAndRemoveUntil(
                    Routes.splashPage, (route) => false,
                    arguments: false);
              }
            },
            child: child,
          );
        },
      ),
    );
  }
}
