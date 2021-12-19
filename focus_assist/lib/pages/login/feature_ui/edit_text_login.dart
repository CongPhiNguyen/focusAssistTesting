import 'package:flutter/material.dart';
import 'edit_text.dart';
import 'package:focus_assist/pages/login/feature_ui/color.dart';

class edit_text_login extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;

  const edit_text_login({
    Key? key,
    required this.hintText,
    this.icon = Icons.person,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return edit_text(
      key: Key(''),
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: Colors.amber[900],
          ),
          border: InputBorder.none,
          hintText: hintText,
        ),
      ),
    );
  }
}
