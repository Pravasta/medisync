import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medisync/common/constant/app_colors.dart';
import 'package:medisync/common/constant/app_text.dart';
import 'package:medisync/common/constant/url_asset.dart';
import 'package:medisync/config/routes/route_name.dart';
import 'package:medisync/features/auth/presentation/bloc/credential/credential_bloc.dart';
import 'package:medisync/features/auth/presentation/widget/button_icon_widget.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CredentialBloc, CredentialState>(
      listener: (context, state) {
        if (state is CredentialSucces) {
          Navigator.of(context).pushNamedAndRemoveUntil(
              Routes.patientMainNavigation, (route) => false);
        }
      },
      child: BlocBuilder<CredentialBloc, CredentialState>(
        builder: (context, state) {
          final bloc = context.read<CredentialBloc>();
          return buildView(context, bloc, state);
        },
      ),
    );
  }

  Scaffold buildView(
      BuildContext context, CredentialBloc bloc, CredentialState state) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.primaryColor,
              AppColors.secondaryColor,
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Expanded(
                  child: Image.asset(
                    UrlAsset.logo,
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
                const Spacer(),
                Image.asset(
                  UrlAsset.doctor,
                  width: MediaQuery.of(context).size.width * 0.8,
                  fit: BoxFit.cover,
                ),
                ButtonIconWidget(
                  backgroundColor: AppColors.whiteColor,
                  foregroundColor: AppColors.primaryColor,
                  icon: const Icon(Icons.phone_android_outlined),
                  label: 'Masuk dengan Nomor Ponsel',
                  onpressed: () {},
                ),
                ButtonIconWidget(
                  backgroundColor: AppColors.infoColor,
                  foregroundColor: AppColors.whiteColor,
                  icon: const Icon(Icons.facebook_rounded),
                  label: 'Masuk dengan Facebook',
                  fontColor: AppColors.whiteColor,
                  onpressed: () {},
                ),
                ButtonIconWidget(
                  backgroundColor: AppColors.redColor,
                  foregroundColor: AppColors.whiteColor,
                  icon: Image.asset(
                    UrlAsset.google,
                    color: AppColors.whiteColor,
                    width: 18,
                  ),
                  fontColor: AppColors.whiteColor,
                  label: 'Masuk dengan Google',
                  onpressed: () {
                    bloc.add(OnGoogleAuthCredential());
                  },
                ),
                const SizedBox(height: 8),
                Text(
                  'Masuk menggunakan Email',
                  textAlign: TextAlign.center,
                  style: AppText.text16.copyWith(
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
