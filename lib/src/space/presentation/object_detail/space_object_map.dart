import 'package:flutter/material.dart';

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
      body: Center(
        child: Image(
          image: title.toLowerCase().contains('cosmos')
              ? const AssetImage('assets/mockcosmos.png')
              : const AssetImage('assets/mockstarlink.png'),
        ),
      ),
    );
  }
}
