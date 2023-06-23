import 'package:flutter/material.dart';

import '../utilities/utilities.dart';

class OnboardingCurve1 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Rect gradientRect =
        Rect.fromLTWH(0, 0, size.width, size.height * 0.55);
    Gradient gradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [AppColors.primary, AppColors.primary.withOpacity(0)],
    );

    Paint paint = Paint();

    paint.shader = gradient.createShader(gradientRect);

    Path path = Path();
    path.moveTo(0, size.height * 0.4);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.5,
        size.width * 0.6, size.height * 0.45);
    path.quadraticBezierTo(
        size.width * 0.7, size.height * 0.425, size.width, size.height * 0.4);
    path.lineTo(size.width, size.height * 0.4);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class OnboardingCurve2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Rect gradientRect =
        Rect.fromLTWH(0, 0, size.width, size.height * 0.55);
    Gradient gradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [AppColors.primary, AppColors.primary.withOpacity(0)],
    );

    Paint paint = Paint();

    paint.shader = gradient.createShader(gradientRect);

    Path path = Path();
    path.moveTo(0, size.height * 0.4);
    path.quadraticBezierTo(size.width * 0.2, size.height * 0.375,
        size.width * 0.6, size.height * 0.45);
    path.quadraticBezierTo(
        size.width * 0.8, size.height * 0.5, size.width, size.height * 0.45);
    path.lineTo(size.width, size.height * 0.4);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class OnboardingCurve3 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Rect gradientRect =
        Rect.fromLTWH(0, 0, size.width, size.height * 0.55);
    Gradient gradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [AppColors.primary, AppColors.primary.withOpacity(0)],
    );

    Paint paint = Paint();

    paint.shader = gradient.createShader(gradientRect);

    Path path = Path();
    path.moveTo(0, size.height * 0.45);
    path.quadraticBezierTo(size.width * 0.3, size.height * 0.4,
        size.width * 0.45, size.height * 0.37);
    path.quadraticBezierTo(
        size.width * 0.7, size.height * 0.33, size.width, size.height * 0.4);
    path.lineTo(size.width, size.height * 0.4);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class OnboardingCurve4 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Rect gradientRect =
        Rect.fromLTWH(0, 0, size.width, size.height * 0.55);
    Gradient gradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [AppColors.primary, AppColors.primary.withOpacity(0)],
    );

    Paint paint = Paint();

    paint.shader = gradient.createShader(gradientRect);

    Path path = Path();
    path.moveTo(0, size.height * 0.5);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.5,
        size.width * 0.6, size.height * 0.45);
    path.quadraticBezierTo(
        size.width * 0.7, size.height * 0.425, size.width, size.height * 0.4);
    path.lineTo(size.width, size.height * 0.4);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
