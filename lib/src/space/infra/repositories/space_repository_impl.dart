import 'package:space_trash/src/space/domain/entities/space_entity.dart';
import 'package:space_trash/src/space/domain/entities/space_object.dart';
import 'package:space_trash/src/space/domain/repositories/space_repository.dart';
import 'package:space_trash/src/space/infra/datasources/space_datasource.dart';

class SpaceRepositoryImpl implements SpaceRepository {
  final SpaceDataSource _dataSource;

  SpaceRepositoryImpl(this._dataSource);

  @override
  Future<List<SpaceEntity>> getAllSpaceEntities() {
    return _dataSource.showSpaceEntity();
  }

  @override
  Future<List<SpaceObject>> getAllSpaceObjects(final String name) {
    return _dataSource.showSpaceObjects(name);
  }
}
