import 'package:flutter/material.dart';


///Widget Bouton qui prend en paramètre
///un icon => Icone propre à flutter
///une key => Optionnel qui sert d'id pour des tests d'intégrations
///VoidCallBack => Action du bouton
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