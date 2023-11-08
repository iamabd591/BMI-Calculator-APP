import 'package:flutter/material.dart';

class RoundedWidget extends StatelessWidget {
  final String btnName;
  final Icon? icon;
  final Color? color;
  final TextStyle? text;
  final VoidCallback? callback;

  const RoundedWidget(
      {super.key,
      required this.btnName,
      this.icon,
      this.color = Colors.blue,
      this.text,
      this.callback});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        callback!();
      },
      child: icon != null
          ? Row(
              children: [
                icon!,
                Text(btnName),
              ],
            )
          : Text(btnName),
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blueGrey,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            topRight: Radius.circular(12),
            bottomLeft: Radius.circular(12),
          ))),
    );
  }
}
