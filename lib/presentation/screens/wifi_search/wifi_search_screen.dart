import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/material.dart';
import 'package:wifi_list/config/get_it/get_it.dart';
import 'package:wifi_list/presentation/screens/wifi_search/cubit/wifi_cubit.dart';
import 'package:wifi_list/presentation/screens/wifi_search/ui_components/landscape_layout.dart';
import 'package:wifi_list/presentation/screens/wifi_search/ui_components/portrait_layout.dart';
import 'package:wifi_list/presentation/ui_components/flushbar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WifiSearchScreen extends StatelessWidget {
  const WifiSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WiFiCubit>(
      create: (_) => getIt.get<WiFiCubit>()..scanWiFi(),
      child: OrientationBuilder(
          builder: (context, orientation) {
            return BlocListener<WiFiCubit, WiFiState>(
              listener: _listener,
              child: Scaffold(
                body: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Center(
                          child: orientation == Orientation.portrait
                              ? WiFiPortraitLayout()
                              : WiFiLandscapeLayout()
                      ),
                    )
                ),
              ),
            );
          }
      ),
    );
  }

  void _listener(BuildContext context, WiFiState state) {
    if (state is WiFiLoadedState && state.connectedWiFi.isNotEmpty) {
      FlushBarApp.show(
          context,
          '${AppLocalizations.of(context).successfulConnection} ${state.connectedWiFi}'
      );
    }
  }
}
