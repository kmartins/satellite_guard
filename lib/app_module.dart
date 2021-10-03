import 'package:flutter_modular/flutter_modular.dart';

import 'src/space/presentation/overview/overview_page.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const OverviewPage(),
        ),
      ];
}
