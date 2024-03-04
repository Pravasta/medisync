import 'package:flutter/material.dart';
import 'package:medisync/config/routes/route_name.dart';
import 'package:medisync/features/auth/presentation/page/login_view.dart';
import 'package:medisync/features/auth/presentation/page/splash_view.dart';
import 'package:medisync/features/patient/patient_dashboard/domain/entities/patient_list_doctor_entity.dart';
import 'package:medisync/features/patient/patient_doctor_detail/presentation/page/patient_doctor_detail_view.dart';
import 'package:medisync/features/patient/patient_main_navigation/presentation/page/patient_main_navigation_view.dart';
import 'package:medisync/features/patient/patient_order/presentation/page/patient_order_view.dart';

class RouteHandler {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashPage:
        final status = settings.arguments;
        if (status == null || status is! bool) return _invalidPage;
        return MaterialPageRoute(
          builder: (context) => SplashView(
            status: status,
          ),
        );
      case Routes.login:
        return MaterialPageRoute(
          builder: (context) => const LoginView(),
        );
      case Routes.patientMainNavigation:
        return MaterialPageRoute(
          builder: (context) => const PatientMainNavigationView(),
        );
      case Routes.patientDoctorDetail:
        final item = settings.arguments;
        if (item == null || item is! Doctor) return _invalidPage;
        return MaterialPageRoute(
          builder: (context) => PatientDoctorDetailView(
            item: item,
          ),
        );
      case Routes.patientOrder:
        return MaterialPageRoute(
          builder: (context) => const PatientOrderView(),
        );

      default:
        return _invalidPage;
    }
  }

  static MaterialPageRoute get _invalidPage => MaterialPageRoute(
        builder: (context) => const Scaffold(
          body: Center(
            child: Text('Invalid Page'),
          ),
        ),
      );
}
