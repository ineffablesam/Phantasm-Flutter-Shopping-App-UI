import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SideDrawer extends StatelessWidget {
  final Widget content;
  const SideDrawer({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.light,
      child: ListTileTheme(
        textColor: Colors.white,
        iconColor: Colors.white,
        child: content,
      ),
    );
  }
}
