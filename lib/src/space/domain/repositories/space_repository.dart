import 'package:space_trash/src/space/domain/entities/space_entity.dart';
import 'package:space_trash/src/space/domain/entities/space_object.dart';

abstract class SpaceRepository {
  Future<List<SpaceEntity>> getAllSpaceEntities();
  Future<List<SpaceObject>> getAllSpaceObjects(final String name);
}
