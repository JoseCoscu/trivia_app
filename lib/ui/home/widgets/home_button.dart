

import 'package:flutter/material.dart';

class HomeButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onPressed;

  const HomeButton({
    super.key,
    required this.text,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: FloatingActionButton.extended(
        onPressed: onPressed,
        backgroundColor: const Color.fromARGB(255, 22, 28, 122),
        icon: Icon(
          icon,
          color: Colors.white,
        ),
        label: Text(text, style: const TextStyle(color: Colors.white)),
      ),
    );
  }
}