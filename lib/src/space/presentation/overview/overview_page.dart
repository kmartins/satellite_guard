import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:space_trash/src/space/presentation/object/space_object_page.dart';

import 'widgets/custom_search_delegate.dart';
import 'widgets/filter_dialog.dart';

class OverviewPage extends StatelessWidget {
  const OverviewPage({Key? key}) : super(key: key);

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
        body: TabBarView(
          children: [
            ListView.separated(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Expanded(child: Text('Starlink')),
                      Text(
                        '451 debris',
                        style: Theme.of(context).textTheme.caption,
                      )
                    ],
                  ),
                  subtitle: Text('Satellite'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => SpaceObjectPage(
                          title: 'Starlink',
                        ),
                      ),
                    );
                  },
                );
              },
              separatorBuilder: (_, __) => const Divider(),
              itemCount: 10,
            ),
            Icon(Icons.directions_transit),
          ],
        ),
      ),
    );
  }
}
