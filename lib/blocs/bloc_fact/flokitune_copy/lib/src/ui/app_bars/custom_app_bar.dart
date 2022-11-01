import 'package:flokitune/src/blocs/bloc_navigation/navigation_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends SliverPersistentHeaderDelegate {
  final Widget widget;
  final bool showGradient;

  CustomAppBar({
    required this.widget,
    this.showGradient = true,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: (context, state) {
        return Stack(
          alignment: AlignmentDirectional.center,
          clipBehavior: Clip.none,
          fit: StackFit.expand,
          children: [
            if (showGradient)
              const DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromRGBO(5, 11, 23, 1),
                      Color.fromRGBO(5, 11, 23, 0)
                    ],
                  ),
                ),
              ),
            Positioned(
              top: 111.h / 2.2 - shrinkOffset,
              child: Opacity(
                opacity: (1 - shrinkOffset / 111.h),
                child: SizedBox(width: 327.w, child: widget),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  double get maxExtent => 111.h;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
