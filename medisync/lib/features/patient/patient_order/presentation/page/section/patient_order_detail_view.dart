import 'package:flutter/material.dart';
import 'package:medisync/common/constant/app_colors.dart';
import 'package:medisync/common/constant/app_text.dart';
import 'package:medisync/common/constant/dummy_text.dart';
import 'package:medisync/common/constant/url_asset.dart';
import 'package:medisync/widgets/button/default_button_widget.dart';
import 'package:medisync/widgets/container/container_widget.dart';

class PatientOrderDetailView extends StatelessWidget {
  const PatientOrderDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: content(),
      ),
      bottomNavigationBar: Material(
        elevation: 4,
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: AppColors.whiteColor,
          padding: const EdgeInsets.all(12),
          child: DefaultButtonWidget(
            title: 'Continue to Patient Data',
            onTap: () {},
          ),
        ),
      ),
    );
  }

  Widget content() {
    return Column(
      children: [
        ContainerWidget(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Selected Doctor',
                style: AppText.text16.copyWith(
                  color: AppColors.blackColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 24,
                    backgroundImage: AssetImage(
                      UrlAsset.doctor1,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Dr. Pravasta Rama F',
                          style: AppText.text16.copyWith(
                            color: AppColors.blackColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          'Doctor Robotika',
                          style: AppText.text14.copyWith(
                              color: AppColors.greyColor500,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Divider(color: AppColors.greyColor300),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Address',
                    style: AppText.text16.copyWith(
                      color: AppColors.blackColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 47,
                        height: 47,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: const DecorationImage(
                            image: NetworkImage(
                              'https://images.unsplash.com/photo-1586773860418-d37222d8fce3?q=80&w=1173&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Medical Dramaga Miami',
                              style: AppText.text16.copyWith(
                                color: AppColors.blackColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Monday, October 16th, 2023',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: AppText.text12.copyWith(
                                color: AppColors.greyColor500,
                              ),
                            ),
                            Text(
                              '4:30 pm - 6:30 pm',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: AppText.text12.copyWith(
                                color: AppColors.greyColor500,
                              ),
                            ),
                            Text(
                              'Fee Rp100.000-',
                              style: AppText.text12.copyWith(
                                color: AppColors.warningColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        ContainerWidget(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Order Detail',
                style: AppText.text16.copyWith(
                  color: AppColors.blackColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                DummyText.textLorem10,
                style: AppText.text14.copyWith(
                  color: AppColors.greyColor500,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'Your Number Phone',
                style: AppText.text14.copyWith(
                  color: AppColors.greyColor500,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                '082244047278',
                style: AppText.text16.copyWith(
                  color: AppColors.blackColor,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'Your Email',
                style: AppText.text14.copyWith(
                  color: AppColors.greyColor500,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'fitrayanaf15@gmail.com',
                style: AppText.text16.copyWith(
                  color: AppColors.blackColor,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'Your Name',
                style: AppText.text14.copyWith(
                  color: AppColors.greyColor500,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'Pravasta Rama Fitrayana',
                style: AppText.text16.copyWith(
                  color: AppColors.blackColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
