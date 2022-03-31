import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  String text;

  CustomAppbar({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      automaticallyImplyLeading: false,
      title: Text(text),
    );
  }
}
