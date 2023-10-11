import 'package:arch_image/core/helper/extensions/assetss_widgets.dart';
import 'package:flutter/material.dart';

import 'main_appbar.dart';
import 'main_nav_bar.dart';

class MainPage extends StatelessWidget {
  const MainPage({
    super.key,
    this.body,
    this.subAppBar,
    this.isAppBar = true,
    this.isPure = false,
    this.title = '',
    this.actionWidgets,
    this.onRefresh,
    this.bottomNavigationBarIndex,
  });

  final Widget? body;
  final Widget? subAppBar;
  final bool isAppBar;
  final bool isPure;
  final String title;
  final List<Widget>? actionWidgets;
  final Future<void> Function()? onRefresh;
  final int? bottomNavigationBarIndex;

  @override
  Widget build(BuildContext context) {
    return isPure
        ? Scaffold(body: body)
        : RefreshIndicator(
            onRefresh: onRefresh ?? (() => Future.delayed(Duration.zero)),
            edgeOffset: onRefresh != null ? 0 : -300,
            child: Scaffold(
              body: SafeArea(
                child: Column(
                  children: [
                    isAppBar
                        ? MainAppBar(title: title, actionWidgets: actionWidgets)
                        : 0.hSize,
                    subAppBar ?? 0.hSize,
                    Expanded(child: body ?? 0.hSize),
                  ],
                ),
              ),
              bottomNavigationBar: bottomNavigationBarIndex != null
                  ? MainNavBar(index: bottomNavigationBarIndex)
                  : null,
            ),
          );
  }
}
