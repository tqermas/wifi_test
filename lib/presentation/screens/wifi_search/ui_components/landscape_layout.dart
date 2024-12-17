import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/material.dart';
import 'package:wifi_list/presentation/screens/wifi_search/cubit/wifi_cubit.dart';
import 'package:wifi_list/presentation/screens/wifi_search/ui_components/logo.dart';
import 'package:wifi_list/presentation/screens/wifi_search/ui_components/reload_button.dart';
import 'package:wifi_list/presentation/screens/wifi_search/ui_components/welcome_text.dart';
import 'package:wifi_list/presentation/screens/wifi_search/ui_components/wifi_list.dart';
import 'package:wifi_list/presentation/ui_components/colors.dart';

class WiFiLandscapeLayout extends StatelessWidget {
  const WiFiLandscapeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Logo(width: MediaQuery.of(context).size.width * 0.3,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: VerticalDivider(color: AppColors.grayDark,),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WelcomeText(),
              Expanded(
                  child: WiFiList()
              ),
              ReloadButton(
                  onTap: () => context.read<WiFiCubit>().reload()
              )
            ],
          ),
        )
      ],
    );
  }
}
