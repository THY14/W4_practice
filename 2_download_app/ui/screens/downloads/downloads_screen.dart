import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/theme_color_provider.dart';
import '../../theme/theme.dart';
import 'widgets/download_controler.dart';
import 'widgets/download_tile.dart';

class DownloadsScreen extends StatelessWidget {
  const DownloadsScreen({super.key});

  // Fake resources
  static final List<Ressource> ressources = [
    Ressource(name: "image1.png", size: 120),
    Ressource(name: "image2.png", size: 500),
    Ressource(name: "image3.png", size: 12000),
  ];

  // Controllers list
  static final List<DownloadController> controllers =
      ressources.map((r) => DownloadController(r)).toList();

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeColorProvider>();
    final theme = themeProvider.currentThemeColor;

    return Container(
      color: theme.backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 16),

          Text(
            "Downloads",
            style: AppTextStyles.heading.copyWith(
              color: theme.color,
            ),
          ),

          const SizedBox(height: 50),

          Expanded(
            child: ListView.builder(
              itemCount: controllers.length,
              itemBuilder: (context, index) {
                return DownloadTile(
                  controller: controllers[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}