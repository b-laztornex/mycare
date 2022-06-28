import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:care_archives/ui/shared/popup_menu.dart';

enum WhyFarther { harder, smarter, selfStarter, tradingCharter }

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Text title;
  BaseAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      actions: <Widget>[
        PopupMenu(),
        IconButton(
          icon: const Icon(Icons.settings),
          tooltip: 'Show Snackbar',
          onPressed: () {
            Navigator.pushNamed(context, '/settings');
          },
        ),

        // overflow menu
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
