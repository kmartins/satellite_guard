import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:space_trash/src/space/domain/entities/space_entity.dart';
import 'package:space_trash/src/space/presentation/object/space_object_page.dart';
import 'package:space_trash/src/space/presentation/overview/store/overview_store.dart';

import 'widgets/custom_search_delegate.dart';
import 'widgets/filter_dialog.dart';

class OverviewPage extends StatefulWidget {
  const OverviewPage({Key? key}) : super(key: key);

  @override
  _OverviewPageState createState() => _OverviewPageState();
}

class _OverviewPageState extends State<OverviewPage> {
  final store = Modular.get<OverviewStore>();

  @override
  void initState() {
    store.getAllEntities();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Space Trash'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Space Trash'),
              Tab(text: 'Satellite'),
            ],
          ),
          actions: [
            IconButton(
              icon: const Icon(FeatherIcons.search),
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: CustomSearchDelegate(),
                );
              },
            ),
            IconButton(
              icon: const Icon(FeatherIcons.filter),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) => FilterDialog(),
                );
              },
            ),
          ],
        ),
        body: ScopedBuilder<OverviewStore, Exception, List<SpaceEntity>>(
          store: store,
          onLoading: (context) => const Center(
            child: CircularProgressIndicator.adaptive(),
          ),
          onState: (context, state) {
            return TabBarView(
              children: [
                ListView.separated(
                  itemBuilder: (context, index) {
                    final entity = state[index];
                    return ListTile(
                      title: Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Expanded(child: Text(entity.name)),
                          Text(
                            '${entity.spaceObjects.length} debris',
                            style: Theme.of(context).textTheme.caption,
                          )
                        ],
                      ),
                      subtitle: Text(typeToString(entity.type)),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => SpaceObjectPage(
                              title: entity.name,
                            ),
                          ),
                        );
                      },
                    );
                  },
                  separatorBuilder: (_, __) => const Divider(),
                  itemCount: state.length,
                ),
                const Icon(Icons.directions_transit),
              ],
            );
          },
        ),
      ),
    );
  }

  String typeToString(Type type) {
    switch (type) {
      case Type.active:
        return 'Satellite';
      case Type.dead:
        return 'Dead';
      case Type.debris:
        return 'Debris';
      case Type.spaceBody:
        return 'Space Body';
      default:
        return 'Satellite';
    }
  }
}
