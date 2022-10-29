import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vibration/vibration.dart';

enum GradientOrientation {
  vertical,
  horizontal,
}

class NiceButton extends StatefulWidget {
  final Color startColor;
  final Color endColor;
  final Color borderColor;
  final Color progressColor;
  final double progressSize;
  final GradientOrientation gradientOrientation;
  final double borderThickness;
  final double height;
  final double borderRadius;
  final bool stretch;
  final double width;
  final bool progress;
  final bool disabled;
  final Function onTap;
  final Widget child;
  final BorderRadius br;
  final double calculatedWidth;
  final Border border;

  NiceButton({
    super.key,
    required this.onTap,
    required this.child,
    this.startColor = const Color(0xFF2ec8ff),
    this.endColor = const Color(0xFF529fff),
    this.borderColor = const Color(0xFF3489e9),
    this.progressColor = Colors.white,
    this.progressSize = 20,
    this.borderRadius = 20,
    this.borderThickness = 5,
    this.height = 60,
    this.width = 200,
    this.gradientOrientation = GradientOrientation.vertical,
    this.stretch = true,
    this.progress = false,
    this.disabled = false,
    this.border = const Border(),
  })  : br = BorderRadius.all(
          Radius.circular(
            (borderRadius),
          ),
        ),
        calculatedWidth = stretch ? double.infinity : width;

  @override
  _NiceButtonState createState() => _NiceButtonState(borderThickness);
}

class _NiceButtonState extends State<NiceButton> with TickerProviderStateMixin {
  double _borderThickness = 5;
  double _moveMargin = 0.0;
  double _progressWidth = 0.0;
  bool _showProgress = false;
  bool _tapped = false;
  bool _processing = false;
  int _progressBarMillis = 2500;

  _NiceButtonState(double borderThickness) {
    _borderThickness = borderThickness;
  }

  Widget _buildBackLayout() {
    return Container(
      padding: EdgeInsets.only(top: _borderThickness),
      width: double.infinity,
      height: double.infinity,
      child: DecoratedBox(
        position: DecorationPosition.background,
        decoration: BoxDecoration(
          borderRadius: widget.br,
          color: widget.borderColor,
        ),
        child: ConstrainedBox(
          constraints: const BoxConstraints.expand(
              width: double.infinity, height: double.infinity),
        ),
      ),
    );
  }

  Widget _buildFrontLayout() {
    return AnimatedContainer(
      onEnd: () {
        setState(() {
          _moveMargin = 0;
          if (widget.progress && !_showProgress && _tapped) {
            _showProgress = true;
            _progressWidth = double.infinity;
            _processing = true;
            _progressBarMillis = 2500;
          }
          _tapped = false;
        });
      },
      margin: EdgeInsets.only(top: _moveMargin),
      duration: const Duration(milliseconds: 150),
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
        border: widget.border,
        borderRadius: widget.br,
        gradient: LinearGradient(
          begin: widget.gradientOrientation == GradientOrientation.vertical
              ? Alignment.topCenter
              : Alignment.centerLeft,
          end: widget.gradientOrientation == GradientOrientation.vertical
              ? Alignment.bottomCenter
              : Alignment.centerRight,
          colors: [
            widget.startColor,
            widget.endColor,
          ],
        ),
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints.expand(
            width: double.infinity, height: widget.height - _borderThickness),
        child: ClipRRect(
          borderRadius: widget.br,
          child: Stack(
            children: <Widget>[
              _buildProgressBar(),
              if (_showProgress) _buildProgressCircle(),
              if (!_showProgress) _buildUserChild(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProgressBar() {
    return AnimatedSize(
      duration: Duration(milliseconds: _progressBarMillis),
      curve: Curves.fastOutSlowIn,
      child: Container(
        width: _progressWidth,
        height: double.infinity,
        color: const Color.fromARGB(60, 255, 255, 255),
      ),
    );
  }

  Widget _buildProgressCircle() {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Align(
        alignment: Alignment.center,
        child: SizedBox(
          width: widget.progressSize,
          height: widget.progressSize,
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(
              widget.progressColor,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildUserChild() {
    return Align(
      alignment: Alignment.center,
      child: widget.child,
    );
  }

  Future<void> _onTap() async {
    setState(() {
      _moveMargin = _borderThickness;
      _tapped = true;
    });

    final hasVibrationMotor = await Vibration.hasVibrator() ?? false;

    if (Platform.isIOS) {
      HapticFeedback.mediumImpact();
    } else if (Platform.isAndroid && hasVibrationMotor) {
      Vibration.vibrate(
        duration: 30,
      );
    }
    await Future.delayed(const Duration(milliseconds: 100));
    widget.onTap(_finish);
  }

  void _finish() {
    setState(() {
      _showProgress = false;
      _progressWidth = 0;
      _processing = false;
      _progressBarMillis = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.disabled || _processing ? null : _onTap,
      child: ConstrainedBox(
        constraints: BoxConstraints.expand(
            width: widget.calculatedWidth, height: widget.height),
        child: Stack(
          children: <Widget>[
            _buildBackLayout(),
            _buildFrontLayout(),
          ],
        ),
      ),
    );
  }
}
