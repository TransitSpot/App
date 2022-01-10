// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String TempatAwalValueKey = 'tempatAwal';
const String TujuanValueKey = 'tujuan';

mixin $BookView on StatelessWidget {
  final TextEditingController tempatAwalController = TextEditingController();
  final TextEditingController tujuanController = TextEditingController();
  final FocusNode tempatAwalFocusNode = FocusNode();
  final FocusNode tujuanFocusNode = FocusNode();

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void listenToFormUpdated(FormViewModel model) {
    tempatAwalController.addListener(() => _updateFormData(model));
    tujuanController.addListener(() => _updateFormData(model));
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormViewModel model) => model.setData(
        model.formValueMap
          ..addAll({
            TempatAwalValueKey: tempatAwalController.text,
            TujuanValueKey: tujuanController.text,
          }),
      );

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    tempatAwalController.dispose();
    tempatAwalFocusNode.dispose();
    tujuanController.dispose();
    tujuanFocusNode.dispose();
  }
}

extension ValueProperties on FormViewModel {
  String? get tempatAwalValue => this.formValueMap[TempatAwalValueKey];
  String? get tujuanValue => this.formValueMap[TujuanValueKey];

  bool get hasTempatAwal => this.formValueMap.containsKey(TempatAwalValueKey);
  bool get hasTujuan => this.formValueMap.containsKey(TujuanValueKey);
}

extension Methods on FormViewModel {}
