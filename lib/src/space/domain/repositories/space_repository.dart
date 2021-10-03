import 'package:space_trash/src/space/domain/entities/space_object.dart';

abstract class SpaceRepository {
  List<SpaceObject> getAllSpaceObjects();
}
