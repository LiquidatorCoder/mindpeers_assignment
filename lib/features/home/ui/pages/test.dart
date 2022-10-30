import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mindpeers/common/themes/colors.dart';
import 'package:mindpeers/utils/common/store_helper.dart';
import 'package:mindpeers/widget_extends/sf_widget.dart';
import 'package:mobx/mobx.dart';
import 'package:sprung/sprung.dart';

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
          Positioned(
            bottom: -50,
            child: Stack(
              children: [
                SvgPicture.asset(
                  'assets/images/mountain.svg',
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                ),
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 2000),
                  curve: Sprung.overDamped,
                  bottom: 0,
                  left: 0,
                  child: SvgPicture.asset(
                    'assets/images/ball.svg',
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 24 + MediaQuery.of(context).padding.top,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: LinearProgressIndicator(
                value: 0.1,
                backgroundColor: AppColors.white,
                valueColor:
                    AlwaysStoppedAnimation<Color>(AppColors.secondaryColor),
              ),
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
                Container(
                  width: MediaQuery.of(context).size.width - 80,
                  decoration: BoxDecoration(
                    color: AppColors.secondaryColor,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 32,
                    horizontal: 20,
                  ),
                  child: Text(
                    'I know what my goals are and I am actively working towards them',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.openSans(
                      color: AppColors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 80,
                  decoration: BoxDecoration(
                    color: AppColors.secondaryColor,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 32,
                    horizontal: 20,
                  ),
                  child: Text(
                    'Its getting slightly difficult to have a consistent version of what goals I want to achieve',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.openSans(
                      color: AppColors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 80,
                  decoration: BoxDecoration(
                    color: AppColors.secondaryColor,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 32,
                    horizontal: 20,
                  ),
                  child: Text(
                    'I struggle alot with what I want to do and how I want to achieve it',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.openSans(
                      color: AppColors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 16,
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
