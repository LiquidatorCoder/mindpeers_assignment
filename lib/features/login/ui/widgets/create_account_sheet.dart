import 'package:flutter/material.dart';
import 'package:mindpeers/common/themes/colors.dart';
import 'package:mindpeers/widgets/nice%20button/nice_button.dart';

class CreateAccountSheet extends StatelessWidget {
  const CreateAccountSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: AppColors.scaffoldLightBackgroundColor,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 4,
              width: 40,
              margin: const EdgeInsets.only(top: 16),
              decoration: BoxDecoration(
                color: AppColors.grey,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              'Create your account',
              style: TextStyle(
                color: AppColors.black,
                fontSize: 21,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            NiceButton(
              height: 48,
              stretch: false,
              width: MediaQuery.of(context).size.width - 80,
              onTap: (_) {
                return;
              },
              startColor: AppColors.white,
              endColor: AppColors.white,
              borderColor: AppColors.primaryColor,
              borderRadius: 8,
              borderThickness: 3,
              child: Text(
                'Sign up with Google',
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            NiceButton(
              height: 48,
              stretch: false,
              width: MediaQuery.of(context).size.width - 80,
              onTap: (_) {
                return;
              },
              startColor: AppColors.black,
              endColor: AppColors.black,
              borderColor: AppColors.primaryColor,
              borderRadius: 8,
              borderThickness: 3,
              child: Text(
                'Sign up with Apple id',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            NiceButton(
              height: 48,
              stretch: false,
              width: MediaQuery.of(context).size.width - 80,
              onTap: (_) {
                return;
              },
              startColor: AppColors.primaryColor,
              endColor: AppColors.primaryColor,
              borderColor: AppColors.black,
              borderRadius: 8,
              borderThickness: 3,
              child: Text(
                'Sign up with email',
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            SizedBox(
              height: 24 + MediaQuery.of(context).padding.bottom,
            ),
          ],
        ),
      ),
    );
  }
}
