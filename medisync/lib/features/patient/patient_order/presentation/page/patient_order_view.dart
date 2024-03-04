import 'package:flutter/material.dart';
import 'package:medisync/common/constant/app_colors.dart';
import 'package:medisync/features/patient/patient_order/presentation/page/section/patient_order_detail_view.dart';
import 'package:medisync/features/patient/patient_order/presentation/page/section/patient_order_patient_data.dart';
import 'package:medisync/features/patient/patient_order/presentation/page/section/patient_order_payment.dart';

import '../../../../../widgets/step_navigaion/step_navigation.dart';

class PatientOrderView extends StatelessWidget {
  const PatientOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StepNavigationWidget(
        initialIndex: 1,
        navigations: const [
          'Select Doctor',
          'Order Detail',
          'Patient Data',
          'Payment',
        ],
        children: [
          Container(
            color: AppColors.infoColor,
          ),
          const PatientOrderDetailView(),
          const PatientOrderPatientData(),
          const PatientOrderPayment(),
        ],
      ),
    );
  }
}
