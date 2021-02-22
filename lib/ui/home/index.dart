import 'package:flutter/material.dart';
import 'package:mycare_archive/ui/shared/base_app_bar.dart';
import 'package:mycare_archive/ui/home/categories.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key key,
    this.color = const Color(0xFF2DBD3A),
    this.child,
  }) : super(key: key);

  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: Text("CATEGORIES"),
      ),
      body: Categories(),
    );
  }
}
