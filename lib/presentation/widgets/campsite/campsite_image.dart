import 'package:cached_network_image/cached_network_image.dart';
import 'package:campsite/core/constants/campsite_assets.dart';
import 'package:campsite/core/extensions/context.dart';
import 'package:flutter/material.dart';

class CampsiteImage extends StatelessWidget {
  final String imageUrl;
  final double? height;

  const CampsiteImage({super.key, required this.imageUrl, this.height});

  @override
  Widget build(BuildContext context) {
    final placeholderColor = context.colorScheme.primaryContainer.withValues(
      alpha: 0.5,
    );
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: BoxFit.cover,
      height: height,
      placeholder: (_, __) => Container(color: placeholderColor),
      errorWidget: (_, __, ___) => Container(
        alignment: Alignment.center,
        color: placeholderColor,
        padding: const EdgeInsets.all(16),
        child: SafeArea(
          bottom: false,
          child: Image.asset(CampsiteAssets.campsite, fit: BoxFit.scaleDown),
        ),
      ),
    );
  }
}
