import 'package:flutter/foundation.dart';

@immutable
class SpaceObject {
  final String name;
  final String norad;
  final String designator;
  final String period;
  final String inclination;
  final String apogee;
  final String perigee;
  final String exentricity;

  const SpaceObject({
    required this.name,
    required this.norad,
    required this.designator,
    required this.period,
    required this.inclination,
    required this.apogee,
    required this.perigee,
    required this.exentricity,
  });
}
