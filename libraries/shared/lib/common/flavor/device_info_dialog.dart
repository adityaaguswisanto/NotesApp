import 'dart:io';

import 'package:flutter/material.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:shared/common/flavor/device_utils.dart';
import 'package:shared/common/flavor/flavor_config.dart';
import 'package:shared/common/styles/custom_color.dart';
import 'package:shared/common/utils/utils.dart';

class DeviceInfoDialog extends StatelessWidget {
  const DeviceInfoDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.only(
        bottom: Sizes.dp10(context),
      ),
      title: Container(
        padding: EdgeInsets.all(
          Sizes.dp15(context),
        ),
        color: FlavorConfig.instance!.color,
        child: Text(
          'Device Info',
          style: TextStyle(
            fontFamily: "CustomRegular",
            package: "shared",
            color: CustomColor.white,
          ),
        ),
      ),
      titlePadding: EdgeInsets.all(
        Sizes.dp4(context) - Sizes.dp4(context),
      ),
      content: getContent(),
    );
  }

  Widget getContent() {
    if (Platform.isAndroid) {
      return androidContent();
    }

    if (Platform.isIOS) {
      return iOSContent();
    }

    return Text(
      "You're not on Android neither iOS",
      style: TextStyle(
        fontFamily: "CustomRegular",
        package: "shared",
        color: CustomColor.font,
      ),
    );

  }

  Widget iOSContent() {
    return FutureBuilder(
      future: DeviceUtils.iosDeviceInfo(),
      builder: (context, AsyncSnapshot<IosDeviceInfo> snapshot) {
        if (!snapshot.hasData) return Container();
        IosDeviceInfo? device = snapshot.data;
        return SingleChildScrollView(
          child: Column(
            children: [
              _buildTile('Flavor :', FlavorConfig.instance!.name, context),
              _buildTile(
                  'Build mode : ',
                  StringUtils.enumName(
                      DeviceUtils.currentBuildMode().toString()),
                  context),
              _buildTile(
                  'Physical device : ', '${device?.isPhysicalDevice}', context),
              _buildTile('Device : ', '${device?.name}', context),
              _buildTile('Model : ', '${device?.model}', context),
              _buildTile('System name : ', '${device?.systemName}', context),
              _buildTile(
                  'System version : ', '${device?.systemVersion}', context),
            ],
          ),
        );
      },
    );
  }

  Widget androidContent() {
    return FutureBuilder(
      future: DeviceUtils.androidDeviceInfo(),
      builder: (context, AsyncSnapshot<AndroidDeviceInfo> snapshot) {
        if (!snapshot.hasData) return Container();

        AndroidDeviceInfo? device = snapshot.data;
        return SingleChildScrollView(
          child: Column(
            children: [
              _buildTile('Flavor : ', FlavorConfig.instance!.name, context),
              _buildTile(
                  'Build mode : ',
                  StringUtils.enumName(
                      DeviceUtils.currentBuildMode().toString()),
                  context),
              _buildTile(
                  'Physical device : ', '${device?.isPhysicalDevice}', context),
              _buildTile('Manufacturer : ', '${device?.manufacturer}', context),
              _buildTile('Model : ', '${device?.model}', context),
              _buildTile(
                  'Android version : ', '${device?.version.release}', context),
              _buildTile(
                  'Android SDK : ', '${device?.version.sdkInt}', context),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTile(
    String key,
    String value,
    BuildContext context,
  ) {
    return Padding(
      padding: EdgeInsets.all(
        Sizes.dp5(context),
      ),
      child: Row(
        children: [
          Text(
            key,
            style: TextStyle(
              fontFamily: "CustomBold",
              package: "shared",
              color: CustomColor.font,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontFamily: "CustomRegular",
              package: "shared",
              color: CustomColor.font,
            ),
          ),
        ],
      ),
    );
  }
}
