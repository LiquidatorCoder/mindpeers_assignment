import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mindpeers/common/di/di.dart';
import 'package:mindpeers/common/enums/state_status.dart';
import 'package:mindpeers/common/themes/colors.dart';
import 'package:mindpeers/features/test/ui/store/test_store.dart';
import 'package:mindpeers/utils/common/store_helper.dart';
import 'package:mindpeers/widget_extends/sf_widget.dart';
import 'package:mindpeers/widgets/nice%20button/nice_button.dart';
import 'package:mobx/mobx.dart';
import 'package:sprung/sprung.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TestScreenState();
}

class _TestScreenState extends SfWidget {
  TestStore get _testStore => getIt<TestStore>();
  late final List<ReactionDisposer> _disposers;
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _disposers = [
      reaction(
        (_) => _testStore.currentQuestionIndex,
        (currentQuestionIndex) {
          _pageController.animateToPage(
            currentQuestionIndex,
            duration: const Duration(milliseconds: 1000),
            curve: Sprung.overDamped,
          );
        },
      ),
    ];
  }

  @override
  void dispose() {
    disposeStore(_disposers);

    super.dispose();
  }

  @override
  onInitApp() async {
    await _testStore.getQuestionBank();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (context) {
          final loading =
              _testStore.getQuestionBankStatus == StateStatus.loading;
          return Stack(
            children: [
              // bottom image
              Positioned(
                bottom: -50,
                child: AnimatedSlide(
                  duration: const Duration(milliseconds: 1000),
                  curve: Curves.easeInOut,
                  offset: Offset(
                    0 - _testStore.progress * 0.05,
                    0 + _testStore.progress * 0.05,
                  ),
                  child: AnimatedScale(
                    curve: Curves.easeInOut,
                    scale: 1 + _testStore.progress * 0.1,
                    duration: const Duration(milliseconds: 1000),
                    child: Hero(
                      tag: 'mountain',
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
                            bottom: _testStore.ballPosition,
                            left: _testStore.ballPosition,
                            child: SvgPicture.asset(
                              'assets/images/ball.svg',
                              fit: BoxFit.cover,
                              width: MediaQuery.of(context).size.width,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              if (!loading)
                Positioned(
                  top: 24 + MediaQuery.of(context).padding.top,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: TweenAnimationBuilder<double>(
                      duration: const Duration(milliseconds: 2000),
                      curve: Sprung.overDamped,
                      tween: Tween<double>(
                        begin: 0,
                        end: _testStore.progress,
                      ),
                      builder: (context, value, _) => LinearProgressIndicator(
                        value: value,
                        backgroundColor: AppColors.white,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          AppColors.secondaryColor,
                        ),
                      ),
                    ),
                  ),
                ),

              // Content
              if (!loading)
                PageView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: _pageController,
                  itemCount: (_testStore.questionBank?.length ?? 0) + 1,
                  itemBuilder: (context, index) {
                    if (index == _testStore.questionBank?.length) {
                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 48.0),
                          child: SvgPicture.asset(
                            'assets/images/check.svg',
                            width: 100,
                          ),
                        ),
                      );
                    }
                    if (_testStore.questionBank == null) {
                      return const SizedBox.shrink();
                    }

                    final currentQuestion = _testStore.questionBank![index];

                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 64 + MediaQuery.of(context).padding.top,
                          ),
                          Text(
                            currentQuestion.question,
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 48,
                          ),
                          for (final ans in currentQuestion.answers)
                            Padding(
                              padding: const EdgeInsets.only(bottom: 24),
                              child: NiceButton(
                                height: 100,
                                stretch: false,
                                width: MediaQuery.of(context).size.width - 80,
                                onTap: (_) {
                                  _testStore.nextQuestion();
                                  return;
                                },
                                startColor: AppColors.secondaryColor,
                                endColor: AppColors.secondaryColor,
                                borderColor: AppColors.secondaryDarkColor,
                                borderRadius: 8,
                                borderThickness: 3,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                  ),
                                  child: Text(
                                    ans,
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.openSans(
                                      color: AppColors.black,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    );
                  },
                )
              else
                const Center(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 48.0),
                    child: CircularProgressIndicator(),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
