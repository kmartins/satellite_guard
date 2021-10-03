import 'package:space_trash/src/space/domain/entities/space_entity.dart';
import 'package:space_trash/src/space/domain/repositories/space_repository.dart';

mixin GetAllSpaceEntities {
  Future<List<SpaceEntity>> call({Type? byType});
}

class GetAllSpaceEntitiesImpl implements GetAllSpaceEntities {
  final SpaceRepository spaceRepository;

  GetAllSpaceEntitiesImpl(
    this.spaceRepository,
  );

  @override
  Future<List<SpaceEntity>> call({Type? byType}) =>
      spaceRepository.getAllSpaceEntities(byType: byType);
}
