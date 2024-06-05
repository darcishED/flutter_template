import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  double get deviceRatio => MediaQuery.of(this).devicePixelRatio;
}

extension ResizeIntExtension on int {
  double resize(BuildContext context) =>
      kIsWeb ? this / context.deviceRatio : toDouble();
}

extension ResizeDoubleExtension on double {
  double resize(BuildContext context) =>
      kIsWeb ? this / context.deviceRatio : this;
}
