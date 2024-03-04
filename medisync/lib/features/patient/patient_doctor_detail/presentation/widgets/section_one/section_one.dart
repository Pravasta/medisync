import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medisync/common/constant/url_asset.dart';
import 'package:medisync/config/routes/route_name.dart';
import 'package:medisync/features/patient/patient_dashboard/domain/entities/patient_list_doctor_entity.dart';
import 'package:medisync/features/patient/patient_doctor_detail/presentation/widgets/section_one/logic.dart';
import 'package:medisync/widgets/container/container_widget.dart';

import '../../../../../../common/constant/app_colors.dart';
import '../../../../../../common/constant/app_text.dart';

Widget sectionOne(BuildContext context, {required Doctor doctor}) {
  var logic = PatientDoctorDetailScheduleList().generate(doctor);

  return ContainerWidget(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'Schedules',
          style: AppText.text16.copyWith(
            color: AppColors.blackColor,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 6),
        for (var item in logic)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 6),
              Row(
                children: [
                  Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: NetworkImage(
                          UrlAsset.hospitalDummy,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.hospital.hospitalName,
                          style: AppText.text16.copyWith(
                            color: AppColors.blackColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          item.hospital.hospitalAddress + ", Paris",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: AppText.text12.copyWith(
                            color: AppColors.greyColor500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 4),
                  const CircleAvatar(
                    radius: 20,
                    backgroundColor: AppColors.primaryColor,
                    child: Icon(
                      Icons.directions,
                      size: 20,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                DateFormat('EEEE, d MMM y').format(DateTime.now()),
                style: AppText.text12.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.blackColor,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(
                    width: 1,
                    color: AppColors.greyColor200!,
                  ),
                ),
                child: Wrap(
                  spacing: 2,
                  children: [
                    for (var schedule in item.schedules)
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          minimumSize: const Size(36, 40),
                          side: const BorderSide(
                            color: AppColors.primaryColor,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushNamed(Routes.patientOrder);
                        },
                        child: Text(
                          '${schedule.startTime} - ${schedule.endTime}',
                          style: AppText.text12,
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 6),
              Divider(
                color: AppColors.greyColor200,
              ),
            ],
          ),
      ],
    ),
  );
}
