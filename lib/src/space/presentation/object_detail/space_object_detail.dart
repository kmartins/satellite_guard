import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:space_trash/src/space/domain/entities/space_object.dart';
import 'package:space_trash/src/space/presentation/object_detail/space_object_map.dart';
import 'package:space_trash/src/space/presentation/overview/store/overview_store.dart';

class SpaceObjectDetail extends StatelessWidget {
  final store = Modular.get<OverviewStore>();
  final SpaceObject obj;
  final String title;
  SpaceObjectDetail({
    required this.title,
    Key? key,
    required this.obj,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => SpaceObjectMap(
                title: title,
              ),
            ),
          );
        },
        label: const Text('View'),
        icon: const Icon(FeatherIcons.map),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            _Information(
              title: 'Norad',
              description: obj.norad,
              secondTitle: 'Int. Designator.',
              secondDescription: obj.designator,
            ),
            const SizedBox(
              height: 24,
            ),
            _Information(
              title: 'Period(min)',
              description: obj.period,
              secondTitle: 'Inclination(degrees)',
              secondDescription: obj.inclination,
            ),
            const SizedBox(
              height: 24,
            ),
            _Information(
              title: 'Apogee Height(km)',
              description: obj.apogee,
              secondTitle: 'Perigee(km)',
              secondDescription: obj.perigee,
            ),
            const SizedBox(
              height: 24,
            ),
            _Information(
              title: 'Exentricity',
              description: obj.exentricity,
            ),
          ],
        ),
      ),
    );
  }
}

class _Information extends StatelessWidget {
  final String title;
  final String description;
  final String? secondTitle;
  final String? secondDescription;
  const _Information({
    required this.title,
    required this.description,
    this.secondTitle,
    this.secondDescription,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.subtitle1?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Text(
                description,
                style: Theme.of(context).textTheme.caption,
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (secondTitle != null) ...[
                Text(
                  secondTitle!,
                  style: Theme.of(context).textTheme.subtitle1?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Text(
                  secondDescription!,
                  style: Theme.of(context).textTheme.caption,
                ),
              ]
            ],
          ),
        ),
      ],
    );
  }
}
