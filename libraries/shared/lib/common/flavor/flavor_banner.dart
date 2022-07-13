import 'package:flutter/material.dart';
import 'package:shared/common/flavor/flavor.dart';
import 'package:shared/common/utils/utils.dart';

class FlavorBanner extends StatelessWidget {
  final Widget child;
  BannerConfig? bannerConfig;

  FlavorBanner({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (FlavorConfig.isProduction()) return child;

    bannerConfig ??= _getDefaultBanner();

    return Stack(
      children: [child, buildBanner(context)],
    );
  }

  BannerConfig _getDefaultBanner() {
    return BannerConfig(
      bannerName: FlavorConfig.instance!.name,
      bannerColor: FlavorConfig.instance!.color,
    );
  }

  Widget buildBanner(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      child: SizedBox(
        width: Sizes.dp25(context) * 2,
        height: Sizes.dp25(context) * 2,
        child: CustomPaint(
          painter: BannerPainter(
            message: bannerConfig!.bannerName,
            textDirection: Directionality.of(context),
            layoutDirection: Directionality.of(context),
            location: BannerLocation.topStart,
            color: bannerConfig!.bannerColor,
          ),
        ),
      ),
      onLongPress: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return const DeviceInfoDialog();
          },
        );
      },
    );
  }
}

class BannerConfig {
  final String bannerName;
  final Color bannerColor;

  BannerConfig({
    required this.bannerName,
    required this.bannerColor,
  });
}
