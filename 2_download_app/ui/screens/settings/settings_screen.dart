import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/theme_color_provider.dart';
import '../../theme/theme.dart';
import 'widget/theme_color_button.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final themeProvider = context.watch<ThemeColorProvider>();
    final currentTheme = themeProvider.currentThemeColor;

    return Container(
      color: currentTheme.backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 16),

          Text(
            "Settings",
            style: AppTextStyles.heading.copyWith(
              color: currentTheme.color,
            ),
          ),

          const SizedBox(height: 50),

          Text(
            "Theme",
            style: AppTextStyles.label.copyWith(
              color: AppColors.textLight,
            ),
          ),

          const SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: ThemeColor.values.map(
              (theme) {
                return ThemeColorButton(
                  themeColor: theme,
                  isSelected: theme == currentTheme,
                  onTap: (value) {
                    context
                        .read<ThemeColorProvider>()
                        .changeTheme(value);
                  },
                );
              },
            ).toList(),
          ),
        ],
      ),
    );
  }
}