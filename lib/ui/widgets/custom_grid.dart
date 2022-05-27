import 'package:flutter/material.dart';
import 'package:mautus_flutter/ui/widgets/custom_row.dart';

class CustomGrid extends StatefulWidget {
  final String mystring;
  const CustomGrid({Key? key, required this.mystring}) : super(key: key);

  @override
  State<CustomGrid> createState() => _CustomGridState();
}

class _CustomGridState extends State<CustomGrid> {
  @override
  Widget build(BuildContext context) {

    List<Widget> grid = [];

    for (int i = 0; i < 5; i++) {
      grid.add(
        CustomRow(mystring: widget.mystring, rowPos: i)
      );
    }

    return Column(
      children: grid,
    );
  }
}
