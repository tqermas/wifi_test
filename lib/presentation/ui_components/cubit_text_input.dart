import 'dart:async';
import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wifi_list/presentation/ui_components/colors.dart';
import 'package:wifi_list/presentation/ui_components/text_styles.dart';

enum IconType { search, obscure, none }

class TextInputCubit extends StatefulWidget {
  const TextInputCubit({
    super.key,
    required this.fieldCubit,
    this.hintText,
    this.obscured,
    this.iconType = IconType.none,
    this.iconAction,
    this.autofocus = false,
    this.errorShownCheck = false,
    this.keyboardType,
    this.textInputAction = TextInputAction.done,
    this.textAlign = TextAlign.start,
    this.borderRadius = 12,
    this.inputFormatters,
  });

  final FieldCubit<String> fieldCubit;
  final String? hintText;
  final bool? obscured;
  final IconType iconType;
  final VoidCallback? iconAction;
  final bool autofocus;
  final bool errorShownCheck;
  final TextInputType? keyboardType;
  final TextInputAction textInputAction;
  final TextAlign textAlign;
  final double borderRadius;
  final List<TextInputFormatter>? inputFormatters;

  @override
  State<TextInputCubit> createState() => _TextInputCubitState();
}

class _TextInputCubitState extends State<TextInputCubit> {
  FocusNode focusNode = FocusNode();
  String? hintText;
  late bool obscured;

  @override
  void initState() {
    obscured = widget.obscured ?? false;
    super.initState();
    hintText = widget.hintText;
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _CubitFormCustomTextField(
      errorShownCheck: widget.errorShownCheck,
      autofocus: widget.autofocus,
      textAlign: widget.textAlign,
      textInputAction: widget.textInputAction,
      formFieldCubit: widget.fieldCubit,
      keyboardType: widget.keyboardType ??
          (obscured == true ? TextInputType.text : TextInputType.emailAddress),
      focusNode: focusNode,
      obscureText: obscured,
      style: AppStyles.body,
      borderRadius: widget.borderRadius,
      inputFormatters: widget.inputFormatters,
      decoration: InputDecoration(
        suffixIcon: _icon,
        filled: true,
        fillColor: AppColors.grayInput,
        hintText: hintText,
        hintStyle: AppStyles.body.copyWith(color: AppColors.grayHint),
        contentPadding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.01,
            horizontal: 16),
      ),
    );
  }

  Widget? get _icon {
    switch (widget.iconType) {
      case IconType.search:
        return IconButton(
            padding: EdgeInsets.zero,
            iconSize: 18,
            icon: Icon(
              Icons.search,
              color: AppColors.grayDark,
            ),
            onPressed: widget.iconAction);
      case IconType.obscure:
        return GestureDetector(
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.grayLight,
                borderRadius: BorderRadius.circular(16)
              ),
              child: Icon(
                obscured ? Icons.visibility : Icons.visibility_off,
                color: AppColors.grayDark,
              ),
            ),
            onTap: () {
              setState(() {
                obscured = !obscured;
              });
            });
      case IconType.none:
        return null;
    }
  }
}

class _CubitFormCustomTextField extends StatefulWidget {
  const _CubitFormCustomTextField({
    required this.formFieldCubit,
    this.keyboardType,
    this.decoration = const InputDecoration(),
    this.obscureText = false,
    this.style,
    this.focusNode,
    this.autofocus = false,
    this.errorShownCheck = false,
    this.textAlign = TextAlign.start,
    required this.textInputAction,
    this.borderRadius = 12,
    this.inputFormatters,
  });

  final FieldCubit<String> formFieldCubit;
  final InputDecoration decoration;
  final bool obscureText;
  final bool autofocus;
  final TextInputType? keyboardType;
  final TextStyle? style;
  final FocusNode? focusNode;
  final bool errorShownCheck;
  final TextAlign textAlign;
  final TextInputAction textInputAction;
  final double borderRadius;
  final List<TextInputFormatter>? inputFormatters;

  @override
  CubitFormCustomTextFieldState createState() =>
      CubitFormCustomTextFieldState();
}

class CubitFormCustomTextFieldState extends State<_CubitFormCustomTextField> {
  late TextEditingController controller;
  late StreamSubscription subscription;

  @override
  void initState() {
    controller = TextEditingController(text: widget.formFieldCubit.state.value)
      ..addListener(() {
        widget.formFieldCubit.setValue(controller.text);
      });
    subscription = widget.formFieldCubit.stream.listen(_cubitListener);
    super.initState();
  }

  void _cubitListener(FieldCubitState<String> state) {
    if (state is InitialFieldCubitState) {
      controller.clear();
      _setText(state.initialValue);
      _unFocus();
    }
    if (state is ExternalChangeFieldCubitState) {
      _unFocus();
      _setText(state.value);
      controller.selection = TextSelection.fromPosition(
          TextPosition(offset: controller.text.length));
    }
  }

  void _setText(String value) {
    controller.text = value;
  }

  void _unFocus() {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.focusedChild?.unfocus();
    }
  }

  @override
  void dispose() {
    subscription.cancel();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FieldCubit, FieldCubitState>(
        bloc: widget.formFieldCubit,
        builder: (context, state) {
          return TextField(
            textInputAction: widget.textInputAction,
            autocorrect: false,
            autofocus: widget.autofocus,
            maxLines: 1,
            focusNode: widget.focusNode,
            textAlign: widget.textAlign,
            textAlignVertical: TextAlignVertical.center,
            style: widget.style,
            keyboardType: widget.keyboardType,
            controller: controller,
            obscureText: widget.obscureText,
            inputFormatters: widget.inputFormatters,
            decoration: widget.decoration.copyWith(
                contentPadding: const EdgeInsets.symmetric(horizontal: 24),
                enabledBorder: OutlineInputBorder(
                    borderRadius:
                    BorderRadius.all(Radius.circular(widget.borderRadius)),
                    borderSide: BorderSide(color: Colors.transparent)
                ),
                border: OutlineInputBorder(
                    borderRadius:
                    BorderRadius.all(Radius.circular(widget.borderRadius)),
                    borderSide: BorderSide(color: Colors.transparent)
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius:
                    BorderRadius.all(Radius.circular(widget.borderRadius)),
                    borderSide: BorderSide(color: Colors.transparent)
                ),
                hintText: null,
                errorText: state.isErrorShown ? state.error : null),
            scrollPadding: const EdgeInsets.all(12.0),
          );
        });
  }
}
