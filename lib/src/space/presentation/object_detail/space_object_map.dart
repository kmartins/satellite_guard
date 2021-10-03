import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class SpaceObjectMap extends StatelessWidget {
  final String title;
  const SpaceObjectMap({
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: const Center(
        child: Image(
          image: AssetImage('assets/mockcosmos.png'),
        ),
      ),
    );
  }
}
