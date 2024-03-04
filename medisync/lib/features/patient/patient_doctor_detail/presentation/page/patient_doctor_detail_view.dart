import 'package:flutter/material.dart';
import 'package:medisync/common/constant/app_colors.dart';
import 'package:medisync/common/constant/url_asset.dart';
import 'package:medisync/features/patient/patient_dashboard/domain/entities/patient_list_doctor_entity.dart';
import 'package:medisync/features/patient/patient_doctor_detail/presentation/widgets/section_five.dart';
import 'package:medisync/features/patient/patient_doctor_detail/presentation/widgets/section_four.dart';
import 'package:medisync/features/patient/patient_doctor_detail/presentation/widgets/section_one/section_one.dart';
import 'package:medisync/features/patient/patient_doctor_detail/presentation/widgets/section_three.dart';
import 'package:medisync/features/patient/patient_doctor_detail/presentation/widgets/section_two.dart';
import '../../../../../common/constant/app_text.dart';

class PatientDoctorDetailView extends StatefulWidget {
  const PatientDoctorDetailView({super.key, required this.item});

  final Doctor item;

  @override
  State<PatientDoctorDetailView> createState() =>
      _PatientDoctorDetailViewState();
}

class _PatientDoctorDetailViewState extends State<PatientDoctorDetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            header(),
            body(),
          ],
        ),
      ),
    );
  }

  AppBar appbar() {
    return AppBar(
      title: const Text('Profil Dokter'),
      elevation: 0,
      backgroundColor: Colors.transparent,
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.share,
            size: 24,
            color: AppColors.blackColor,
          ),
        ),
      ],
    );
  }

  Widget header() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey[200]!,
            blurRadius: 18,
            offset: const Offset(0, 11),
          ),
        ],
        border: Border(
          bottom: BorderSide(
            width: 0.5,
            color: AppColors.greyColor300!,
          ),
        ),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 32,
                backgroundImage: AssetImage(
                  UrlAsset.doctor,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.item.doctorName,
                      style: AppText.text16.copyWith(
                        color: AppColors.blackColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      'Doctor ${widget.item.specialization.specializationsName}',
                      style: AppText.text14.copyWith(
                          color: AppColors.greyColor500,
                          fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: 3),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  width: 0.6,
                  color: AppColors.greyColor300!,
                ),
              ),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.thumb_up,
                  color: AppColors.primaryColor,
                  size: 16,
                ),
                const SizedBox(width: 4),
                Text(
                  '98%',
                  style: AppText.text16.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 4),
                Text(
                  '5 patient',
                  style: AppText.text14.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.greyColor400,
                  ),
                ),
                Icon(
                  Icons.chevron_right,
                  size: 16,
                  color: AppColors.greyColor500,
                ),
                const Spacer(),
                OutlinedButton.icon(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size(0, 0),
                    padding: const EdgeInsets.all(0),
                    side: const BorderSide(
                      color: Colors.transparent,
                      width: 0,
                    ),
                  ),
                  icon: const Icon(
                    Icons.add,
                    size: 12,
                    color: AppColors.primaryColor,
                  ),
                  label: Text(
                    'Give a review',
                    style: AppText.text14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget body() {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          sectionOne(context, doctor: widget.item),
          const SizedBox(height: 6),
          sectionTwo(widget.item.description),
          const SizedBox(height: 6),
          sectionThree(widget.item.medicalTreatment),
          const SizedBox(height: 6),
          sectionFour(widget.item.practicalExperience),
          const SizedBox(height: 6),
          sectionFive(),
        ],
      ),
    );
  }
}
