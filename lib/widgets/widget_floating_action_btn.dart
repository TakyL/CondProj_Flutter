import 'package:flutter/material.dart';

class MyFloatingActionButton extends StatelessWidget {
  final IconData icon;
  final Key? key;
  final VoidCallback onPressed;

  const MyFloatingActionButton({
    required this.icon,
    this.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      key: key,
      onPressed: onPressed,
      child: Icon(icon),
    );
  }
}