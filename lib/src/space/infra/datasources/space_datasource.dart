import 'package:space_trash/src/space/domain/entities/space_entity.dart';
import 'package:space_trash/src/space/domain/entities/space_object.dart';

abstract class SpaceDataSource {
  Future<List<SpaceEntity>> showSpaceEntity();
  Future<List<SpaceObject>> showSpaceObjects(final String name);
}
