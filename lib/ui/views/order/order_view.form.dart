// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String AmountValueKey = 'amount';
const String PaymentMethodValueKey = 'paymentMethod';

const Map<String, String> PaymentMethodValueToTitleMap = {
  'credit_card': 'Credit Card',
  'paypal': 'Paypal',
};

mixin $OrderView on StatelessWidget {
  final TextEditingController amountController = TextEditingController();
  final FocusNode amountFocusNode = FocusNode();

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void listenToFormUpdated(FormViewModel model) {
    amountController.addListener(() => _updateFormData(model));
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormViewModel model) => model.setData(
        model.formValueMap
          ..addAll({
            AmountValueKey: amountController.text,
          }),
      );

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    amountController.dispose();
    amountFocusNode.dispose();
  }
}

extension ValueProperties on FormViewModel {
  String? get amountValue => this.formValueMap[AmountValueKey];
  String? get paymentMethodValue => this.formValueMap[PaymentMethodValueKey];

  bool get hasAmount => this.formValueMap.containsKey(AmountValueKey);
  bool get hasPaymentMethod =>
      this.formValueMap.containsKey(PaymentMethodValueKey);
}

extension Methods on FormViewModel {
  void setPaymentMethod(String paymentMethod) {
    this.setData(
        this.formValueMap..addAll({PaymentMethodValueKey: paymentMethod}));
  }
}
