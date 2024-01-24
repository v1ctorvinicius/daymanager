import 'package:flutter/material.dart';

class CheckboxComponent extends StatefulWidget {
  final String title;
  bool value;
  CheckboxComponent({super.key, required this.title, required this.value});

  @override
  State<CheckboxComponent> createState() => _MyAppState();
}

class _MyAppState extends State<CheckboxComponent> {
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
        value: widget.value,
        title: Text(widget.title, style: _getTitleStyle()),
        activeColor: Colors.green,
        onChanged: (value) {
          setState(() {
            widget.value = value!;
          });
        });
  }

  TextStyle _getTitleStyle() {
    return TextStyle(
        fontSize: 20,
        decoration:
            widget.value ? TextDecoration.lineThrough : TextDecoration.none);
  }
}
