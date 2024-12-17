import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/material.dart';
import 'package:wifi_list/domain/models/wifi_model.dart';
import 'package:wifi_list/gen/assets.gen.dart';
import 'package:wifi_list/presentation/screens/wifi_search/cubit/wifi_cubit.dart';
import 'package:wifi_list/presentation/screens/wifi_search/ui_components/password_dialog.dart';
import 'package:wifi_list/presentation/ui_components/colors.dart';
import 'package:wifi_list/presentation/ui_components/text_styles.dart';

class WifiTile extends StatelessWidget {
  const WifiTile(this.wifi, {super.key});

  final WiFiModel wifi;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      key: ValueKey(wifi.name),
      onTap: () => _openConnectDialog(context, wifi.name),
      contentPadding: EdgeInsets.zero,
      leading: _getWiFiIcon(),
      title: Text(wifi.name, style: AppStyles.body, maxLines: 2,),
    );
  }

  Widget _getWiFiIcon() {
    final colorFilter = ColorFilter.mode(AppColors.grayWiFi, BlendMode.srcIn);
    return switch (wifi.protected) {
      true => switch (wifi.strength) {
        1 => Assets.images.wifi1Lock.svg(width:  30, colorFilter: colorFilter),
        2 => Assets.images.wifi2Lock.svg(width:  30, colorFilter: colorFilter),
        3 => Assets.images.wifi3Lock.svg(width:  30, colorFilter: colorFilter),
        _ => Assets.images.wifi4Lock.svg(width:  30, colorFilter: colorFilter),
      },
      false => switch (wifi.strength) {
        1 => Assets.images.wifi1.svg(width:  30, colorFilter: colorFilter),
        2 => Assets.images.wifi2.svg(width:  30, colorFilter: colorFilter),
        3 => Assets.images.wifi3.svg(width:  30, colorFilter: colorFilter),
        _ => Assets.images.wifi4.svg(width:  30, colorFilter: colorFilter),
      },
    };
  }

  void _openConnectDialog(BuildContext context, String wifiName) {
      showDialog(
          context: context,
          builder: (_) => PasswordDialog(wifiName, context.read<WiFiCubit>())
      );
  }

}
