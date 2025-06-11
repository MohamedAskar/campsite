import 'package:campsite/core/constants/breakpoints.dart';
import 'package:campsite/core/extensions/context.dart';
import 'package:campsite/presentation/widgets/common/skeleton_loader.dart';
import 'package:flutter/material.dart';

import 'home_sheet_skeleton.dart';

class HomePageSkeleton extends StatelessWidget {
  const HomePageSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SkeletonLoader(),
        Container(
          padding: context.isMobile
              ? EdgeInsets.zero
              : EdgeInsets.symmetric(horizontal: 16),
          constraints: const BoxConstraints(
            maxWidth: Breakpoints.mobileBreakpoint,
          ),
          child: HomeSheetSkeleton(),
        ),
      ],
    );
  }
}
