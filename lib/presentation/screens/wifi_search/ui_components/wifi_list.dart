import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/material.dart';
import 'package:wifi_list/presentation/screens/wifi_search/cubit/wifi_cubit.dart';
import 'package:wifi_list/presentation/screens/wifi_search/ui_components/wifi_tile.dart';

class WiFiList extends StatelessWidget {
  const WiFiList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WiFiCubit, WiFiState>(
      bloc: context.read<WiFiCubit>(),
        builder: (context, state) {
          return switch (state) {
            WiFiLoadingState() => Center(
              child: CircularProgressIndicator.adaptive(),
            ),
            WiFiErrorState() => Center(
              child: Icon(Icons.error_outline_rounded, size: 40,),
            ),
            WiFiLoadedState() => ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 12),
              itemCount: state.wifiList.length,
              itemBuilder: (_, index) => WifiTile(state.wifiList[index])
            ),
          };
        }
    );
  }
}
