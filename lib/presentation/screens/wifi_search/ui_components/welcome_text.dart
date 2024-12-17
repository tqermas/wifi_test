import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:wifi_list/presentation/ui_components/text_styles.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppLocalizations.of(context).welcome, style: AppStyles.title),
        Text(AppLocalizations.of(context).letStart, style: AppStyles.body,)
      ],
    );
  }
}
