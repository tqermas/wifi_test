import 'dart:async';
import 'package:cubit_form/cubit_form.dart';
import 'package:wifi_list/presentation/screens/wifi_search/cubit/wifi_cubit.dart';

class WiFiPasswordForm extends FormCubit {
  WiFiPasswordForm() {
    password = FieldCubit(
      initalValue: '',
      validations: [
        RequiredStringValidation('Empty password'),
        MinLengthValidation(8, 'Password too short')

      ],
    );

    super.addFields([password]);
  }

  void init(WiFiCubit wifiCubit, String wifiName) {
    this.wifiCubit = wifiCubit;
    this.wifiName = wifiName;
    subscription = wifiCubit.stream.listen(signInCubitListener);
  }

  late StreamSubscription<WiFiState> subscription;

  @override
  Future<void> close() async {
    subscription.cancel();
    super.close();
  }

  void signInCubitListener(WiFiState wifiState) {
    if (wifiState is WiFiErrorState) {
      setShowErrorOnAllFields();
      emit(state.copyWith(
          isErrorShown: true, isFormValid: false, isSubmitting: false));
    }
  }

  @override
  FutureOr<void> onSubmit() async {
    await wifiCubit.connect(wifiName, password.state.value);
  }

  late final WiFiCubit wifiCubit;
  late FieldCubit<String> password;
  late String wifiName;
}