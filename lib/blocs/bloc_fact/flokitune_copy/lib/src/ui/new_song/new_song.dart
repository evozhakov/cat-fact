import 'package:flokitune/src/ui/app_bars/back_button_widget.dart';
import 'package:flokitune/src/ui/app_bars/custom_app_bar.dart';
import 'package:flokitune/src/ui/new_song/new_song_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/bloc_service/service_bloc.dart';

class NewSong extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController genreController;
  const NewSong({
    super.key,
    required this.nameController,
    required this.genreController,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ServiceBloc, ServiceState>(
      builder: (context, state) {
        return CustomScrollView(
          physics: const ClampingScrollPhysics(),
          slivers: [
            SliverPersistentHeader(
              pinned: true,
              delegate: CustomAppBar(
                widget: AppBarBackButtonWidget(
                  title: state.localizations.newSong,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: NewSongBody(
                state: state,
                genreController: genreController,
                nameController: nameController,
              ),
            ),
          ],
        );
      },
    );
  }
}
