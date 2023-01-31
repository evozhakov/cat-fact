import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cats_fact/blocs/bloc_service/service_bloc.dart';

GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final turns = context
        .select((ServiceBloc bloc) => bloc.state.drawerIsOpen ? 0.0 : 0.5);
    return AppBar(
      title: const FaIcon(
        FontAwesomeIcons.cat,
      ),
      actions: [
        IconButton(
          onPressed: () => scaffoldKey.currentState?.openEndDrawer(),
          icon: AnimatedRotation(
            turns: turns,
            duration: const Duration(milliseconds: 200),
            child: const Icon(
              Icons.keyboard_arrow_left,
              size: 35,
            ),
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}
