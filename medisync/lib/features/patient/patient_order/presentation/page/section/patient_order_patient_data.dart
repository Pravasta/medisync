import 'package:flutter/material.dart';
import 'package:medisync/common/constant/app_colors.dart';
import 'package:medisync/common/constant/app_text.dart';
import 'package:medisync/widgets/button/custom_select_button.dart';
import 'package:medisync/widgets/button/default_button_widget.dart';
import 'package:medisync/widgets/container/container_widget.dart';
import 'package:medisync/widgets/field/default_text_field.dart';

class PatientOrderPatientData extends StatelessWidget {
  const PatientOrderPatientData({super.key});

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
    return SingleChildScrollView(
      child: Column(
        children: [
          ContainerWidget(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Complete Patient Data',
                  style: AppText.text16.copyWith(
                    color: AppColors.blackColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'Please complete patient details to booking :',
                  style: AppText.text14.copyWith(
                    color: AppColors.greyColor500,
                  ),
                ),
                const SizedBox(height: 10),
                const DefaultTextField(
                  hintText: 'Name according to ID Card',
                  labelText: 'Name according to ID Card',
                  initialText: 'Pravasta Rama',
                ),
                const SizedBox(height: 18),
                const DefaultTextField(
                  suffixWidget: Icon(Icons.calendar_month),
                  inputType: TextInputType.datetime,
                  hintText: 'Date/Place of birth Patient',
                  labelText: 'Date/Place of birth Patient',
                  initialText: '20-07-2023',
                ),
                const SizedBox(height: 18),
                Text(
                  'Patient Gender',
                  style: AppText.text14.copyWith(
                    color: AppColors.greyColor500,
                  ),
                ),
                const SizedBox(height: 10),
                const CustomSelectButtonWidget(
                  data: [
                    {
                      'gender': 'Male',
                      'value': 1,
                    },
                    {
                      'gender': 'Female',
                      'value': 2,
                    },
                  ],
                ),
                const SizedBox(height: 18),
                const DefaultTextField(
                  inputType: TextInputType.number,
                  hintText: 'ID Card Number',
                  labelText: 'ID Card Number',
                  initialText: '3520060801000001',
                ),
                const SizedBox(height: 18),
                const DefaultTextField(
                  maxLines: 4,
                  inputType: TextInputType.text,
                  hintText: 'Address according to ID Card',
                  labelText: 'Address according to ID Card',
                  initialText:
                      'JL Bima Sakti 4, Jebres, Surakarta, Jawa Tengah, Indonesia',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
