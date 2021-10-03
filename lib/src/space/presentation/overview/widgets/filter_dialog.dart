import 'package:flutter/material.dart';

enum Filter {
  debris,
  rocketBody,
  dead,
}

class FilterDialog extends StatefulWidget {
  const FilterDialog({Key? key}) : super(key: key);

  @override
  _FilterDialogState createState() => _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog> {
  List<Filter> filter = [
    Filter.debris,
    Filter.rocketBody,
    Filter.dead,
  ];

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Filter"),
      actions: [
        TextButton(
          child: Text("OK"),
          onPressed: () => Navigator.pop(context),
        ),
      ],
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CheckboxListTile(
            title: Text('Debris'),
            value: filter.contains(Filter.debris),
            onChanged: (newValue) {
              setState(
                () => newValue!
                    ? filter.add(Filter.debris)
                    : filter.remove(Filter.debris),
              );
            },
          ),
          CheckboxListTile(
            title: Text('Rocket Body'),
            value: filter.contains(Filter.rocketBody),
            onChanged: (newValue) {
              setState(
                () => newValue!
                    ? filter.add(Filter.rocketBody)
                    : filter.remove(Filter.rocketBody),
              );
            },
          ),
          CheckboxListTile(
            title: Text('Dead'),
            value: filter.contains(Filter.dead),
            onChanged: (newValue) {
              setState(
                () => newValue!
                    ? filter.add(Filter.dead)
                    : filter.remove(Filter.dead),
              );
            },
          ),
        ],
      ),
    );
  }
}
