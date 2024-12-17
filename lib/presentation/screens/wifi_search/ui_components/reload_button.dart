import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/material.dart';
import 'package:wifi_list/gen/assets.gen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:wifi_list/presentation/screens/wifi_search/cubit/wifi_cubit.dart';
import 'package:wifi_list/presentation/ui_components/colors.dart';

class ReloadButton extends StatelessWidget {
  const ReloadButton({required this.onTap, super.key});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WiFiCubit, WiFiState>(
      bloc: context.read<WiFiCubit>(),
      builder: (context, state) {
        return TextButton(
            style: TextButton.styleFrom(
              backgroundColor: state is WiFiLoadingState
                  ? AppColors.grayLight
                  : AppColors.grayMedium,
              foregroundColor: Colors.white,
              disabledForegroundColor: Colors.white,
            ),
            onPressed: state is WiFiLoadingState ? null : onTap,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: Assets.images.reload.svg(width: 20),
                  ),
                  Text(AppLocalizations.of(context).reload)
                ],
              ),
            )
        );
      }
    );
  }
}
