import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/size.dart';

class EmptyNotes extends StatelessWidget {
  const EmptyNotes({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "No notes now",
          style: TextStyle(fontSize: AppFonts.t20),
        )
      ],
    );
  }
}
