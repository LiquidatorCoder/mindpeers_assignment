import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mindpeers/common/themes/colors.dart';
import 'package:mindpeers/utils/common/store_helper.dart';
import 'package:mindpeers/widget_extends/sf_widget.dart';
import 'package:mindpeers/widgets/nice%20button/nice_button.dart';
import 'package:mobx/mobx.dart';

class HomeScreen extends StatefulWidget {
  final String? dummyValue;

  const HomeScreen({Key? key, this.dummyValue}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends SfWidget {
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
          // top image
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top +
                  MediaQuery.of(context).size.height * 0.1,
            ),
            child: SvgPicture.asset(
              'assets/images/mountain-withball.svg',
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
            ),
          ),

          // Content
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                Text(
                  'MindPeers Signature Mental Strength Test',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  'Discover your strengths and identify growth areas in under four minutes.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.openSans(
                    color: AppColors.white.withOpacity(0.8),
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const SizedBox(
                  height: 56,
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
