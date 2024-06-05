import 'package:flutter/widgets.dart';

class CustomTransitions {
  const CustomTransitions._();

  static Widget fadeZoom(
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) =>
      FadeTransition(
        opacity: Tween<double>(begin: 0, end: 1).animate(animation),
        child: child,
      );

  static Widget slide(
    Animation<double> animation,
    Animation<double>? secondaryAnimation,
    Widget child,
  ) =>
      SlideTransition(
        position: animation.drive(
          Tween(begin: const Offset(0, 1), end: Offset.zero)
              .chain(CurveTween(curve: Curves.easeInOut)),
        ),
        child: child,
      );

  static Widget scale(
    Animation<double> animation,
    Animation<double>? secondaryAnimation,
    Widget child,
  ) =>
      ScaleTransition(
        scale: animation.drive(
          Tween<double>(begin: 0.5, end: 1.0).chain(
            CurveTween(curve: Curves.fastOutSlowIn),
          ),
        ),
        child: FadeTransition(
          opacity: animation.drive(Tween<double>(begin: 0.0, end: 1.0).chain(
            CurveTween(
              curve: Curves.fastOutSlowIn,
            ),
          )),
          child: secondaryAnimation != null
              ? scaleSecondary(secondaryAnimation, child)
              : child,
        ),
      );

  static Widget scaleSecondary(
    Animation<double> secondaryAnimation,
    Widget child,
  ) =>
      ScaleTransition(
        scale:
            secondaryAnimation.drive(Tween<double>(begin: 1.0, end: 0.5).chain(
          CurveTween(
            curve: Curves.fastOutSlowIn,
          ),
        )),
        child: FadeTransition(
          opacity:
              secondaryAnimation.drive(Tween<double>(begin: 1.0, end: 0).chain(
            CurveTween(
              curve: Curves.fastOutSlowIn,
            ),
          )),
          child: child,
        ),
      );
}
