import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:wifi_list/config/get_it/get_it.dart';
import 'package:wifi_list/presentation/screens/wifi_search/cubit/password_form.dart';
import 'package:wifi_list/presentation/screens/wifi_search/cubit/wifi_cubit.dart';
import 'package:wifi_list/presentation/ui_components/colors.dart';
import 'package:wifi_list/presentation/ui_components/cubit_text_input.dart';
import 'package:wifi_list/presentation/ui_components/text_styles.dart';

class PasswordDialog extends StatelessWidget {
  const PasswordDialog(this.wifiName, this.wifiCubit, {super.key});

  final String wifiName;
  final WiFiCubit wifiCubit;

  @override
  Widget build(BuildContext context) {
    final form = getIt.get<WiFiPasswordForm>()..init(wifiCubit, wifiName);
    return Dialog(
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                AppLocalizations.of(context).connectToWlan,
                style: AppStyles.title,
              ),
              Text(
                '${AppLocalizations.of(context).tryToConnectTo} $wifiName',
                style: AppStyles.body,
              ),
              Text(
                AppLocalizations.of(context).enterPassword,
                style: AppStyles.body,
              ),
              Text(
                AppLocalizations.of(context).password,
                style: AppStyles.title,
              ),
              TextInputCubit(
                iconType: IconType.obscure,
                obscured: true,
                hintText: '${AppLocalizations.of(context).password}...',
                fieldCubit: form.password,
              ),
              BlocBuilder<FormCubit, FormCubitState>(
                bloc: form,
                  builder: (_, state) {
                  return TextButton(
                      onPressed: state.isFormDataValid
                          ? () {
                        form.trySubmit();
                        Navigator.of(context).pop();
                      }
                          : null,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            AppLocalizations.of(context).join,
                            style: AppStyles.body.copyWith(
                                fontSize: 18,
                                color: state.isFormDataValid
                                    ? AppColors.grayMedium
                                    : AppColors.grayLight
                            ),
                          ),
                        ],
                      )
                  );
                  }
              )
            ],
          ),
        ),
      ),
    );
  }
}
