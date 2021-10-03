import 'package:space_trash/src/space/domain/entities/space_object.dart';
import 'package:space_trash/src/space/domain/repositories/space_repository.dart';

class GetAllSpaceObjects {
  final SpaceRepository spaceRepository;

  GetAllSpaceObjects({
    required this.spaceRepository,
  });

  List<SpaceObject> call() => spaceRepository.getAllSpaceObjects();
}
