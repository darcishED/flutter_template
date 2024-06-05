import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  double get deviceRatio => MediaQuery.of(this).devicePixelRatio;
}

// these are used to avoid the UI breaking when the user zooms in and out
extension ResizeIntExtension on int {
  double resize(BuildContext context) =>
      kIsWeb ? this / context.deviceRatio : toDouble();
}

extension ResizeDoubleExtension on double {
  /// resize the UI elements to remain constant during zooming in/out
  double resize(BuildContext context) =>
      kIsWeb ? this / context.deviceRatio : this;
}
