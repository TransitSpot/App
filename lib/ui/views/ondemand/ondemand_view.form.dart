// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String TargetValueKey = 'target';

mixin $OnDemandView on StatelessWidget {
  final TextEditingController targetController = TextEditingController();
  final FocusNode targetFocusNode = FocusNode();

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void listenToFormUpdated(FormViewModel model) {
    targetController.addListener(() => _updateFormData(model));
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormViewModel model) => model.setData(
        model.formValueMap
          ..addAll({
            TargetValueKey: targetController.text,
          }),
      );

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    targetController.dispose();
    targetFocusNode.dispose();
  }
}

extension ValueProperties on FormViewModel {
  String? get targetValue => this.formValueMap[TargetValueKey];

  bool get hasTarget => this.formValueMap.containsKey(TargetValueKey);
}

extension Methods on FormViewModel {}
