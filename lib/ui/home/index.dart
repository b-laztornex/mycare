import 'package:flutter/material.dart';
import 'package:care_archives/ui/shared/base_app_bar.dart';
import 'package:care_archives/ui/home/categories.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
    this.color = const Color(0xFF2DBD3A),
    //required this.child,
  }) : super(key: key);

  final Color color;
  //final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: const Text('CATEGORIES'),
      ),
      body: Categories(),
    );
  }
}
