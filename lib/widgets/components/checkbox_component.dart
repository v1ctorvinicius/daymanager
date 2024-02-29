import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

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
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: (_) {},
              icon: Icons.delete,
              backgroundColor: Colors.red.shade300,
              borderRadius: BorderRadius.circular(12),
            )
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: CheckboxListTile(

                // fillColor: MaterialStateProperty.all(Colors.black),
                value: widget.value,
                title: Text(widget.title, style: changeTitleStyle()),
                activeColor: Colors.green,
                onChanged: (value) {
                  setState(() {
                    widget.value = value!;
                  });
                }),
          ),
        ),
      ),
    );
  }

  TextStyle changeTitleStyle() {
    return TextStyle(
        fontSize: 20,
        decoration:
            widget.value ? TextDecoration.lineThrough : TextDecoration.none);
  }
}
