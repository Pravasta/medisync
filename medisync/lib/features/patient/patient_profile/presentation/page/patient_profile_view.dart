import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medisync/common/constant/app_colors.dart';
import 'package:medisync/common/constant/app_text.dart';
import 'package:medisync/common/constant/url_asset.dart';
import 'package:medisync/config/routes/route_name.dart';
import '../../../../auth/presentation/bloc/auth/auth_bloc.dart';
import '../widgets/patient_profile_list_widget.dart';
import 'package:medisync/widgets/container/container_widget.dart';

class PatientProfileView extends StatefulWidget {
  const PatientProfileView({super.key});

  @override
  State<PatientProfileView> createState() => _PatientProfileViewState();
}

class _PatientProfileViewState extends State<PatientProfileView> {
  final User? data = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is Unauthenticated) {
          Navigator.of(context).pushNamedAndRemoveUntil(
            Routes.login,
            (route) => false,
          );
        }
      },
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          final bloc = context.read<AuthBloc>();
          return buildView(bloc, state);
        },
      ),
    );
  }

  Scaffold buildView(AuthBloc bloc, AuthState state) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Profile'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          headerProfile(),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                account(),
                const SizedBox(height: 12),
                helpCentre(),
                const SizedBox(height: 12),
                logOut(bloc),
              ],
            ),
          ),
          Center(
            child: Text(
              'Version 9.0 - 12',
              style: AppText.text12.copyWith(
                color: AppColors.greyColor400,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget headerProfile() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: AppColors.greyColor200!,
          ),
        ),
      ),
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(
              data?.photoURL ?? UrlAsset.noImage,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  data?.displayName ?? "-",
                  style: AppText.text18.copyWith(
                    color: AppColors.blackColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  data?.email ?? '-',
                  style: AppText.text14.copyWith(
                    color: AppColors.greyColor400,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget account() {
    return ContainerWidget(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Account',
            style: AppText.text16.copyWith(
              color: AppColors.blackColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          Divider(color: AppColors.greyColor200),
          Builder(builder: (context) {
            List listPage = [
              {
                'label': 'My Profile',
                'page': Routes.login,
              },
              {
                'label': 'Medical Record',
                'page': Routes.login,
              },
              {
                'label': 'Change Password',
                'page': Routes.login,
              },
              {
                'label': 'Change Pin',
                'page': Routes.login,
              }
            ];
            return ListView.builder(
              itemCount: listPage.length,
              shrinkWrap: true,
              padding: const EdgeInsets.all(0),
              clipBehavior: Clip.none,
              itemBuilder: (context, index) {
                var item = listPage[index];
                return PatientProfileListWidget(
                  icon: Icons.chevron_right_outlined,
                  label: '${item['label']}',
                  onTap: () {
                    Navigator.of(context).pushNamed('${item['page']}');
                  },
                );
              },
            );
          })
        ],
      ),
    );
  }

  Widget helpCentre() {
    return ContainerWidget(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Help Centre',
            style: AppText.text16.copyWith(
              color: AppColors.blackColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          Divider(color: AppColors.greyColor200),
          Builder(builder: (context) {
            List listPage = [
              {
                'label': 'About Us',
                'page': Routes.login,
              },
              {
                'label': 'Privacy Policy',
                'page': Routes.login,
              },
              {
                'label': 'Terms and Conditions',
                'page': Routes.login,
              },
              {
                'label': 'Contact Us',
                'page': Routes.login,
              }
            ];
            return ListView.builder(
              itemCount: listPage.length,
              shrinkWrap: true,
              padding: const EdgeInsets.all(0),
              clipBehavior: Clip.none,
              itemBuilder: (context, index) {
                var item = listPage[index];
                return PatientProfileListWidget(
                  label: '${item['label']}',
                  onTap: () {
                    Navigator.of(context).pushNamed('${item['page']}');
                  },
                  icon: Icons.chevron_right_outlined,
                );
              },
            );
          })
        ],
      ),
    );
  }

  Widget logOut(AuthBloc bloc) {
    return ContainerWidget(
      child: PatientProfileListWidget(
        label: 'Logout',
        onTap: () => bloc.add(OnUnAuthenticatedEvent()),
        icon: Icons.logout_outlined,
      ),
    );
  }
}
