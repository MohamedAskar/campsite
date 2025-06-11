import 'package:campsite/core/constants/campsite_assets.dart';
import 'package:campsite/core/extensions/context.dart';
import 'package:campsite/core/extensions/text_style.dart';
import 'package:campsite/presentation/pages/home/widgets/filters_app_bar_button.dart';
import 'package:campsite/presentation/pages/home/widgets/layouts/home_desktop_layout.dart';
import 'package:campsite/presentation/pages/home/widgets/layouts/home_mobile_layout.dart';
import 'package:campsite/presentation/widgets/common/theme_switcher_button.dart';
import 'package:flutter/material.dart';

import 'widgets/home_floating_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final viewPadding = MediaQuery.viewPaddingOf(context);

    return Scaffold(
      extendBodyBehindAppBar: context.isMobile,
      appBar: AppBar(
        centerTitle: false,
        toolbarHeight: 72,
        notificationPredicate: (_) => false,
        title: Row(
          spacing: 4,
          children: [
            SizedBox.square(
              dimension: 64,
              child: Image.asset(CampsiteAssets.campsite),
            ),
            Text(
              context.l10n.campsites,
              style: context.textTheme.titleLarge?.bold,
            ),
          ],
        ),
        actions: const [
          ThemeSwitcherButton(),
          SizedBox(width: 8),
          FiltersAppBarButton(),
        ],
      ),
      body: Builder(
        builder: (context) {
          if (context.isDesktop) {
            return HomeDesktopLayout();
          } else {
            return HomeMobileLayout(viewPadding: viewPadding);
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: context.isMobile
          ? const HomeFloatingButton()
          : null,
    );
  }
}
