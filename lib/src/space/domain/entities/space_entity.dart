import 'package:flutter/foundation.dart';

import 'space_object.dart';

enum Type { debris, spaceBody, dead, active }

@immutable
class SpaceEntity {
  final String name;
  final Type type;
  final List<SpaceObject> spaceObjects;
  final int quant;

  const SpaceEntity({
    required this.name,
    required this.type,
    required this.spaceObjects,
  }) : quant = spaceObjects.length;
}
