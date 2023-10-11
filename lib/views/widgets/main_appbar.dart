import 'package:arch_image/core/helper/extensions/assetss_widgets.dart';
import 'package:arch_image/core/helper/extensions/context_size.dart';
import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_routes.dart';
import 'main_text.dart';

class MainAppBar extends StatelessWidget {
  const MainAppBar({
    super.key,
    required this.title,
    required this.actionWidgets,
  });

  final String title;
  final List<Widget>? actionWidgets;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: context.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                if (Navigator.canPop(context)) {
                  AppRoutes.pop(context);
                }
              },
              borderRadius: BorderRadius.circular(12),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Navigator.canPop(context)
                    ? const Icon(
                        Icons.arrow_back_ios,
                        color: AppColors.yBlackColor,
                      )
                    : 16.wSize,
              ),
            ),
            MainText(
              title,
              color: AppColors.yBlackColor,
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
            Row(
              children: actionWidgets ?? [32.wSize],
            ),
          ],
        ),
      ),
    );
  }
}
