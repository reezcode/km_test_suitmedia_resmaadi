import 'package:flutter/material.dart';

extension GapX on int {
  Widget get gH => SizedBox(height: toDouble());
  Widget get gW => SizedBox(width: toDouble());
}

extension GapX2 on double {
  Widget get gH => SizedBox(height: toDouble());
  Widget get gW => SizedBox(width: toDouble());
}
