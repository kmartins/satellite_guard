import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:space_trash/src/space/domain/entities/space_entity.dart';
import 'package:space_trash/src/space/domain/entities/space_object.dart';
import 'package:space_trash/src/space/presentation/overview/store/overview_store.dart';

import 'widgets/custom_search_delegate copy.dart';
import 'widgets/list_item_widget.dart';

class SpaceObjectPage extends StatelessWidget {
  final store = Modular.get<OverviewStore>();
  final String title;
  SpaceObjectPage({
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: Text(title),
            bottom: const TabBar(
              tabs: [
                Tab(text: 'All'),
                Tab(text: 'Favorites'),
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
            ],
          ),
          body: ScopedBuilder<OverviewStore, Exception, List<SpaceEntity>>(
            onState: (context, state) {
              final listObj = store.entityFromName(title).spaceObjects;
              return TabBarView(
                children: [
                  ListView.separated(
                    itemBuilder: (_, index) => ListItemWidget(
                      obj: listObj[index],
                    ),
                    separatorBuilder: (_, __) => const Divider(),
                    itemCount: listObj.length,
                  ),
                  Icon(Icons.directions_transit),
                ],
              );
            },
          )),
    );
  }
}
