import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import 'widgets/custom_search_delegate copy.dart';
import 'widgets/list_item_widget.dart';

class SpaceObjectPage extends StatelessWidget {
  final String title;
  const SpaceObjectPage({
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
        body: TabBarView(
          children: [
            ListView.separated(
              itemBuilder: (_, index) => ListItemWidget(),
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
