import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {
  final String name;
  final String value;
  final VoidCallback onTap;

  const CategoryTile(
      {Key? key, required this.name, required this.value, required this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: this.onTap,
      child: Card(
        child: Container(
          child: Text("$name"),
          padding: EdgeInsets.all(10),
        ),
      ),
    );
  }
}
