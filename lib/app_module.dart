import 'package:flutter_modular/flutter_modular.dart';
import 'package:space_trash/src/space/domain/usescases/get_all_space_entities.dart';
import 'package:space_trash/src/space/external/datasource/celestek_datasource.dart';
import 'package:space_trash/src/space/infra/repositories/space_repository_impl.dart';
import 'package:space_trash/src/space/presentation/overview/store/overview_store.dart';

import 'src/space/presentation/overview/overview_page.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton((i) => CelestekDataSource()),
        Bind.lazySingleton(
            (i) => SpaceRepositoryImpl(i.get<CelestekDataSource>())),
        Bind.lazySingleton((i) => GetAllSpaceEntitiesImpl(i.get())),
        Bind.lazySingleton((i) => OverviewStore(i.get())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const OverviewPage(),
        ),
      ];
}
