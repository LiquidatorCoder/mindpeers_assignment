import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mindpeers/common/di/di.dart';
import 'package:mindpeers/common/themes/colors.dart';
import 'package:mindpeers/features/login/data/models/post_login_request_model.dart';
import 'package:mindpeers/features/login/ui/store/login_store.dart';
import 'package:mindpeers/utils/common/store_helper.dart';
import 'package:mindpeers/widget_extends/sf_widget.dart';
import 'package:mindpeers/widgets/nice%20button/nice_button.dart';
import 'package:mobx/mobx.dart';
// import 'package:cached_network_image/cached_network_image.dart';
import 'package:pixel_perfect/pixel_perfect.dart';

class OnboardingScreen extends StatefulWidget {
  final PageRouteInfo? redirectOnLogin;

  const OnboardingScreen({
    Key? key,
    required this.redirectOnLogin,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends SfWidget<OnboardingScreen> {
  PageRouteInfo? get _redirectOnLogin => widget.redirectOnLogin;
  LoginStore get _loginStore => getIt<LoginStore>();

  late final List<ReactionDisposer> _disposers;

  @override
  void initState() {
    _disposers = [];

    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  void doLogin(PostLoginRequestModel param) {
    _loginStore.doLogin(context, param, redirectOnLogin: _redirectOnLogin);
  }

  @override
  void dispose() {
    disposeStore(_disposers);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PixelPerfect(
      assetPath: 'assets/images/onboarding.jpeg',
      scale: 1.59,
      offset: Offset.zero,
      child: Scaffold(
        body: Stack(
          children: [
            // background image
            // CachedNetworkImage(
            //   imageUrl: 'https://picsum.photos/800/600',
            //   fit: BoxFit.cover,
            //   width: MediaQuery.of(context).size.width,
            //   height: MediaQuery.of(context).size.height,
            // ),

            // Content
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  Text(
                    'Hi, Welcome',
                    style: TextStyle(
                      fontFamily: 'Gilroy',
                      color: AppColors.white,
                      fontSize: 21,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Begin your journey with mental strength through this portal',
                    style: GoogleFonts.openSans(
                      color: AppColors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  // Elevated button
                  NiceButton(
                    height: 60,
                    stretch: false,
                    width: MediaQuery.of(context).size.width - 80,
                    gradientOrientation: GradientOrientation.horizontal,
                    onTap: (_) {
                      return;
                    },
                    startColor: AppColors.white,
                    endColor: AppColors.white,
                    borderColor: AppColors.primaryColor,
                    borderRadius: 8,
                    borderThickness: 3,
                    child: Text(
                      'Create an account',
                      style: TextStyle(
                        fontFamily: 'Gilroy',
                        color: AppColors.black,
                        fontWeight: FontWeight.w900,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Already have an account?  ',
                            style: TextStyle(
                              fontFamily: 'Gilroy',
                              color: AppColors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 14.5,
                            ),
                          ),
                          TextSpan(
                            text: 'Log In',
                            style: TextStyle(
                              fontFamily: 'Gilroy',
                              color: AppColors.primaryColor,
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.w700,
                              fontSize: 14.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 56,
                  ),
                  // Outline button
                  NiceButton(
                    height: 60,
                    stretch: false,
                    width: MediaQuery.of(context).size.width - 80,
                    gradientOrientation: GradientOrientation.horizontal,
                    onTap: (_) {
                      return;
                    },
                    startColor: AppColors.scaffoldBackgroundColor,
                    endColor: AppColors.scaffoldBackgroundColor,
                    borderColor: AppColors.white.withOpacity(0.8),
                    borderRadius: 8,
                    borderThickness: 3,
                    border: Border.all(
                      width: 1,
                      color: AppColors.white,
                    ),
                    child: Text(
                      'Access Organization account',
                      style: TextStyle(
                        fontFamily: 'Gilroy',
                        color: AppColors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
