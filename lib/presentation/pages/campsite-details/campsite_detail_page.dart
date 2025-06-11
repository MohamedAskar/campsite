import 'package:campsite/core/extensions/context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'layouts/campsite_details_mobile_layout.dart';
import 'layouts/campsite_details_tablet_layout.dart';

class CampsiteDetailPage extends ConsumerWidget {
  final String campsiteId;

  const CampsiteDetailPage({super.key, required this.campsiteId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (context.isMobile) {
      return CampsiteDetailsMobileLayout(campsiteId: campsiteId);
    } else {
      return CampsiteDetailsTabletLayout(campsiteId: campsiteId);
    }
  }
}
