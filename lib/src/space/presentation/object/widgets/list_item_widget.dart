import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:space_trash/src/space/presentation/object_detail/space_object_detail.dart';

class ListItemWidget extends StatefulWidget {
  const ListItemWidget({Key? key}) : super(key: key);

  @override
  _ListItemWidgetState createState() => _ListItemWidgetState();
}

class _ListItemWidgetState extends State<ListItemWidget> {
  Color? favoriteColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('Starlink - 61'),
      subtitle: Text('Norad: 33652'),
      trailing: IconButton(
        onPressed: () {
          setState(() =>
              favoriteColor = favoriteColor == null ? Colors.yellow : null);
        },
        icon: Icon(
          FeatherIcons.star,
          color: favoriteColor,
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => SpaceObjectDetail(
              title: 'Starlink - 61',
            ),
          ),
        );
      },
    );
  }
}
