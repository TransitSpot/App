// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String AmountValueKey = 'amount';
const String MethodValueKey = 'method';

mixin $OrderView on StatelessWidget {
  final TextEditingController amountController = TextEditingController();
  final TextEditingController methodController = TextEditingController();
  final FocusNode amountFocusNode = FocusNode();
  final FocusNode methodFocusNode = FocusNode();

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void listenToFormUpdated(FormViewModel model) {
    amountController.addListener(() => _updateFormData(model));
    methodController.addListener(() => _updateFormData(model));
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormViewModel model) => model.setData(
        model.formValueMap
          ..addAll({
            AmountValueKey: amountController.text,
            MethodValueKey: methodController.text,
          }),
      );

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    amountController.dispose();
    amountFocusNode.dispose();
    methodController.dispose();
    methodFocusNode.dispose();
  }
}

extension ValueProperties on FormViewModel {
  String? get amountValue => this.formValueMap[AmountValueKey];
  String? get methodValue => this.formValueMap[MethodValueKey];

  bool get hasAmount => this.formValueMap.containsKey(AmountValueKey);
  bool get hasMethod => this.formValueMap.containsKey(MethodValueKey);
}

extension Methods on FormViewModel {}
