import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mindpeers/common/themes/colors.dart';
import 'package:mindpeers/utils/common/store_helper.dart';
import 'package:mindpeers/widget_extends/sf_widget.dart';
import 'package:mindpeers/widgets/nice%20button/nice_button.dart';
import 'package:mobx/mobx.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TestScreenState();
}

class _TestScreenState extends SfWidget {
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

  @override
  void dispose() {
    disposeStore(_disposers);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // bottom image
          Align(
            alignment: Alignment.bottomCenter,
            child: SvgPicture.asset(
              'assets/images/mountain-withball.svg',
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          Positioned(
            top: 24 + MediaQuery.of(context).padding.top,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: const LinearProgressIndicator(),
            ),
          ),

          // Content
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 84 + MediaQuery.of(context).padding.top,
                ),
                Text(
                  'Which statements best correspond to your career goals:',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 21,
                    fontWeight: FontWeight.w800,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 48,
                ),
                // Elevated button
                NiceButton(
                  height: 60,
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
                    'Begin journey',
                    style: TextStyle(
                      color: AppColors.black,
                      fontWeight: FontWeight.w900,
                      fontSize: 15,
                    ),
                  ),
                ),
                SizedBox(
                  height: 24 + MediaQuery.of(context).padding.bottom,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
