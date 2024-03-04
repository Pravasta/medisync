import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medisync/common/constant/app_colors.dart';
import 'package:medisync/common/constant/app_text.dart';
import 'package:medisync/features/patient/patient_dashboard/presentation/page/patient_dashboard_view.dart';
import 'package:medisync/features/patient/patient_profile/presentation/page/patient_profile_view.dart';
import '../cubit/patiend_main_navigation_cubit.dart';

class PatientMainNavigationView extends StatelessWidget {
  const PatientMainNavigationView({super.key});

  @override
  Widget build(BuildContext context) {
    buildContent(int index) {
      switch (index) {
        case 0:
          return const PatientDashboadView();
        case 1:
          return Container(color: Colors.blueAccent);
        case 2:
          return const PatientProfileView();

        default:
          return const PatientDashboadView();
      }
    }

    return BlocBuilder<PatiendMainNavigationCubit, int>(
      builder: (context, state) {
        return DefaultTabController(
          length: 3,
          child: Scaffold(
            body: buildContent(state),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: state,
              onTap: (value) {
                context.read<PatiendMainNavigationCubit>().changePage(value);
              },
              selectedItemColor: AppColors.infoColor,
              selectedLabelStyle:
                  AppText.text16.copyWith(fontWeight: FontWeight.w500),
              unselectedLabelStyle:
                  AppText.text16.copyWith(fontWeight: FontWeight.w500),
              iconSize: 28,
              type: BottomNavigationBarType.fixed,
              elevation: 2,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.list_alt_outlined),
                  label: 'Transaction',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_2_outlined),
                  label: 'Profile',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
