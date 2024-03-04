import 'package:flutter/material.dart';
import 'package:medisync/common/constant/app_colors.dart';
import 'package:medisync/common/constant/app_text.dart';
import 'package:medisync/common/constant/url_asset.dart';
import 'package:medisync/features/patient/patient_dashboard/presentation/widgets/patient_dashboard_tabbar_widget.dart';
import 'package:medisync/widgets/field/default_text_field.dart';

class PatientDashboadView extends StatelessWidget {
  const PatientDashboadView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: appbar(),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Container(
              height: 230,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.secondaryColor,
                    AppColors.primaryColor,
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
            ),
            Positioned(
              top: 120,
              left: 20,
              right: 20,
              child: content(),
            ),
          ],
        ),
      ),
    );
  }

  Container content() {
    return Container(
      padding: const EdgeInsets.all(12),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: AppColors.blackColor,
            blurRadius: 20,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          const SizedBox(height: 10),
          Row(
            children: [
              const CircleAvatar(
                radius: 25,
                backgroundColor: AppColors.pinkColor,
                child: Icon(
                  Icons.calendar_today_rounded,
                  color: AppColors.whiteColor,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Book a constultation",
                      style: AppText.text18.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.blackColor,
                      ),
                    ),
                    Text(
                      "Short message without queuing..",
                      style: AppText.text14.copyWith(
                        color: AppColors.greyColor500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          DefaultTextField(
            hintText: 'Cari dokter, spesialisasi, dan Tab',
            suffixWidget: Icon(
              Icons.search,
              color: AppColors.greyColor500,
            ),
            inputType: TextInputType.text,
          ),
          const SizedBox(height: 10),
          const PatientDashboardTabbarWidget(),
        ],
      ),
    );
  }

  AppBar appbar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: Text(
        'MEDISYNC',
        style: AppText.text24.copyWith(
          color: AppColors.whiteColor,
        ),
      ),
      actions: const [
        Padding(
          padding: EdgeInsets.all(12.0),
          child: Badge(
            label: Text('3'),
            child: Icon(
              Icons.email_outlined,
              size: 28,
            ),
          ),
        ),
        CircleAvatar(
          radius: 15,
          backgroundImage: AssetImage(
            UrlAsset.doctor,
          ),
        ),
        SizedBox(width: 16),
      ],
    );
  }
}
