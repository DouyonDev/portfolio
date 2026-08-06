import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const DrawerItem(this.text, this.onTap);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
      onTap: () {
        Navigator.pop(context);
        onTap();
      },
    );
  }
}