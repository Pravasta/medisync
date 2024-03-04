import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medisync/common/constant/app_colors.dart';
import 'package:medisync/common/constant/app_text.dart';
import 'package:medisync/common/constant/dummy_data.dart';
import 'package:medisync/common/constant/url_asset.dart';
import 'package:medisync/config/routes/route_name.dart';
import 'package:medisync/features/patient/patient_dashboard/presentation/bloc/patient_doctor_list_bloc.dart';
import 'package:medisync/features/patient/patient_dashboard/presentation/widgets/doctor_card.dart';
import '../cubit/patient_dashboad_tabbar_cubit.dart';

class PatientDashboardTabbarWidget extends StatefulWidget {
  const PatientDashboardTabbarWidget({super.key});

  @override
  State<PatientDashboardTabbarWidget> createState() =>
      _PatientDashboardTabbarWidgetState();
}

class _PatientDashboardTabbarWidgetState
    extends State<PatientDashboardTabbarWidget> {
  refresh() {
    context.read<PatientDoctorListBloc>().add(OnGetPatientDoctorListEvent());
  }

  @override
  void initState() {
    refresh();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.read<PatientDashboadTabbarCubit>();
    Widget tab(String title, int index) {
      return Expanded(
        child: InkWell(
          onTap: () {
            controller.changeTab(index);
          },
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: controller.state == index
                  ? AppColors.whiteColor
                  : Colors.grey.withOpacity(0.2),
              border: Border(
                top: BorderSide(
                  width: 1,
                  color: Colors.grey.withOpacity(0.2),
                ),
                left: index == 0
                    ? BorderSide.none
                    : BorderSide(
                        width: 1,
                        color: Colors.grey.withOpacity(0.2),
                      ),
                right: index == 2
                    ? BorderSide.none
                    : BorderSide(
                        width: 1,
                        color: Colors.grey.withOpacity(0.2),
                      ),
                bottom: controller.state == index
                    ? BorderSide.none
                    : BorderSide(
                        width: 1,
                        color: Colors.grey.withOpacity(0.2),
                      ),
              ),
              borderRadius: BorderRadius.circular(3),
            ),
            child: Center(
              child: Text(
                title,
                style: AppText.text18.copyWith(
                  fontWeight: controller.state == index
                      ? FontWeight.bold
                      : FontWeight.normal,
                  color: controller.state == index
                      ? AppColors.primaryColor
                      : Colors.grey.withOpacity(0.5),
                ),
              ),
            ),
          ),
        ),
      );
    }

    buildContent(int index) {
      switch (index) {
        case 0:
          return doctor();
        case 1:
          return Container(
              width: double.infinity, height: 100, color: Colors.white);
        case 2:
          return Container(
              width: double.infinity, height: 100, color: Colors.white);

        default:
          return doctor();
      }
    }

    return BlocBuilder<PatientDashboadTabbarCubit, int>(
      builder: (context, state) {
        return SizedBox(
          child: Column(
            children: [
              Row(
                children: [
                  tab('Dokter', 0),
                  tab('Lab Test', 1),
                  tab('Action', 2),
                ],
              ),
              buildContent(state),
            ],
          ),
        );
      },
    );
  }

  Widget doctor() {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          color: AppColors.whiteColor,
          height: 50,
          child: Row(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      DummyData.doctorSpecialists.length,
                      (index) {
                        bool selectedIndex = index == 0;
                        var item = DummyData.doctorSpecialists[index];
                        return InkWell(
                          onTap: () {},
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  width: 3,
                                  color: selectedIndex
                                      ? AppColors.infoColor
                                      : Colors.transparent,
                                ),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                item,
                                style: AppText.text16.copyWith(
                                  color: selectedIndex
                                      ? AppColors.primaryColor
                                      : AppColors.greyColor500,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 40,
                child: Icon(
                  Icons.menu,
                  size: 24,
                  color: AppColors.infoColor,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height,
          child: BlocBuilder<PatientDoctorListBloc, PatientDoctorListState>(
            builder: (context, state) {
              if (state is PatientDoctorListLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (state is PatientDoctorListFailed) {
                return Center(
                  child: Text(
                    state.error,
                    style: AppText.text16.copyWith(
                      color: AppColors.blackColor,
                    ),
                  ),
                );
              }

              if (state is PatientDoctorListLoaded) {
                var data = state.data;

                return ListView.builder(
                  padding: const EdgeInsets.all(8),
                  shrinkWrap: true,
                  itemCount: data.length,
                  physics: const ScrollPhysics(),
                  itemBuilder: (context, index) {
                    var item = data[index];

                    return InkWell(
                      onTap: () => Navigator.of(context).pushNamed(
                        Routes.patientDoctorDetail,
                        arguments: item,
                      ),
                      child: DoctorCard(
                        imageAsset: UrlAsset.doctor,
                        name: item.doctorName,
                        specialization: item.specialization.specializationsName,
                        locationInKm: '23',
                        rate: '98',
                        reviewCount: '5',
                        onTap: () => Navigator.of(context).pushNamed(
                          Routes.patientDoctorDetail,
                          arguments: item,
                        ),
                      ),
                    );
                  },
                );
              }
              return const SizedBox();
            },
          ),
        ),
      ],
    );
  }

  Widget labTest() {
    return Container(
      width: double.infinity,
      color: Colors.white,
    );
  }

  Widget tindakan() {
    return Container(
      width: double.infinity,
      color: Colors.white,
    );
  }
}
