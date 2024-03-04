import 'package:flutter/material.dart';
import 'package:medisync/common/constant/app_colors.dart';
import 'package:medisync/common/constant/app_text.dart';

class DoctorCard extends StatelessWidget {
  const DoctorCard({
    super.key,
    required this.imageAsset,
    required this.name,
    required this.specialization,
    required this.locationInKm,
    required this.rate,
    required this.reviewCount,
    required this.onTap,
  });

  final String imageAsset;
  final String name;
  final String specialization;
  final String locationInKm;
  final String rate;
  final String reviewCount;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
      decoration: BoxDecoration(
        border: Border.all(
          width: 0.1,
          color: Colors.grey.withOpacity(0.3),
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 32,
                backgroundImage: AssetImage(
                  imageAsset,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: AppText.text16.copyWith(
                        color: AppColors.blackColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    rowData('Doctor $specialization',
                        Icons.mic_external_on_outlined),
                    const SizedBox(height: 5),
                    rowData('$locationInKm km from you', Icons.directions),
                    const SizedBox(height: 5),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              border: Border.all(
                width: 0.1,
                color: Colors.grey.withOpacity(0.3),
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            padding: const EdgeInsets.all(6),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Doctor review',
                      style: AppText.text12.copyWith(
                        color: AppColors.greyColor500,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      '$rate% ($reviewCount)',
                      overflow: TextOverflow.ellipsis,
                      style: AppText.text14.copyWith(
                        color: AppColors.infoColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: ElevatedButton(
                    onPressed: onTap,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber[800],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'Create Approintment',
                      style: AppText.text14.copyWith(
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget rowData(String title, IconData icons) {
    return Row(
      children: [
        Icon(
          icons,
          size: 18,
          color: Colors.grey[400],
        ),
        const SizedBox(width: 5),
        Expanded(
          child: Text(
            title,
            style: AppText.text14.copyWith(
              color: Colors.grey[400],
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
