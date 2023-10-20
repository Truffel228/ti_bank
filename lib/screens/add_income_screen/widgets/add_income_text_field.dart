import 'package:ti_bank/custom_theme.dart';
import 'package:ti_bank/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddIncomeTextField extends StatelessWidget {
  const AddIncomeTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.keyboardType,
    this.inputFormatters,
    this.focusNode,
    this.autofocus,
  });

  final TextEditingController controller;
  final String hintText;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focusNode;
  final bool? autofocus;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: CustomTheme.darkGreyColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        autofocus: autofocus ?? false,
        focusNode: focusNode,
        onEditingComplete: () => focusNode?.nextFocus(),
        controller: controller,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        style: context.textTheme.titleLarge?.copyWith(
          color: CustomTheme.whiteColor,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: context.textTheme.titleLarge,
          border: InputBorder.none,
          errorBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
        ),
      ),
    );
  }
}
