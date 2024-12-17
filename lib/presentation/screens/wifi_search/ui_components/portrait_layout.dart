import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wifi_list/presentation/screens/wifi_search/cubit/wifi_cubit.dart';
import 'package:wifi_list/presentation/screens/wifi_search/ui_components/logo.dart';
import 'package:wifi_list/presentation/screens/wifi_search/ui_components/reload_button.dart';
import 'package:wifi_list/presentation/screens/wifi_search/ui_components/welcome_text.dart';
import 'package:wifi_list/presentation/screens/wifi_search/ui_components/wifi_list.dart';
import 'package:wifi_list/presentation/ui_components/colors.dart';

class WiFiPortraitLayout extends StatelessWidget {
  const WiFiPortraitLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Logo(width: MediaQuery.of(context).size.width * 0.7,),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 32),
          child: Divider(color: AppColors.grayDark,),
        ),
        Row(
          children: [
            Expanded(child: WelcomeText()),
          ],
        ),
        Expanded(
            child: WiFiList()
        ),
        ReloadButton(
            onTap: () => context.read<WiFiCubit>().reload()
        )
      ],
    );
  }
}
