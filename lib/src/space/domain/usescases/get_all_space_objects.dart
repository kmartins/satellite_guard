import 'package:space_trash/src/space/domain/entities/space_object.dart';
import 'package:space_trash/src/space/domain/repositories/space_repository.dart';

class GetAllSpaceObjects {
  final SpaceRepository spaceRepository;
  final String name;

  GetAllSpaceObjects({
    required this.spaceRepository,
    required this.name,
  });

  Future<List<SpaceObject>> call() => spaceRepository.getAllSpaceObjects(name);
}
