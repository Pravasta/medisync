import 'dart:async';

import 'package:flutter/material.dart';
import 'package:medisync/common/constant/app_colors.dart';
import 'package:medisync/common/constant/url_asset.dart';
import 'package:medisync/config/routes/route_name.dart';

import '../../../../common/constant/app_text.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key, required this.status});

  final bool status;

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      if (mounted && widget.status == true) {
        Navigator.of(context).pushNamedAndRemoveUntil(
          Routes.patientMainNavigation,
          (route) => false,
        );
      }
      if (mounted && widget.status == false) {
        Navigator.of(context).pushNamedAndRemoveUntil(
          Routes.login,
          (route) => false,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.primaryColor,
              AppColors.secondaryColor,
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(),
            Image.asset(
              UrlAsset.logo,
              width: MediaQuery.of(context).size.width * 2 / 3,
            ),
            Text(
              'Version 9.0 - 12',
              style: AppText.text12.copyWith(
                color: AppColors.greyColor500,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
