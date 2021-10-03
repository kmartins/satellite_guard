import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:space_trash/src/space/presentation/overview/store/overview_store.dart';

class SpaceObjectDetail extends StatelessWidget {
  final store = Modular.get<OverviewStore>();
  final String title;
  SpaceObjectDetail({
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: const Text('View'),
        icon: const Icon(FeatherIcons.map),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: const <Widget>[
            _Information(
              title: 'Norad',
              description: '33757',
              secondTitle: 'Int. Designator.',
              secondDescription: '1993-036E',
            ),
            SizedBox(
              height: 24,
            ),
            _Information(
              title: 'Period(min)',
              description: '100,55',
              secondTitle: 'Inclination(degrees)',
              secondDescription: '74,04',
            ),
            SizedBox(
              height: 24,
            ),
            _Information(
              title: 'Apogee Height(km)',
              description: '796',
              secondTitle: 'Perigee(km)',
              secondDescription: '773',
            ),
            SizedBox(
              height: 24,
            ),
            _Information(
              title: 'Exxentricity',
              description: '0,00016150',
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
