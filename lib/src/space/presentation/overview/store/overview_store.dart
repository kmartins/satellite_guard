import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:space_trash/src/space/domain/entities/space_entity.dart';
import 'package:space_trash/src/space/domain/repositories/space_repository.dart';
import 'package:space_trash/src/space/domain/usescases/get_all_space_entities.dart';

class OverviewStore extends StreamStore<Exception, List<SpaceEntity>> {
  final repo = Modular.get<SpaceRepository>();
  final GetAllSpaceEntities getEntitiesUseCase;
  OverviewStore(this.getEntitiesUseCase) : super([]);

  void getAllEntities() async {
    setLoading(true);
    final listEntity = await getEntitiesUseCase.call();
    update(listEntity);
    setLoading(false);
  }

  SpaceEntity entityFromName(String name) {
    return state.firstWhere((element) => element.name.contains(name));
  }
}
