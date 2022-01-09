import 'package:flutter/material.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:transitspot/ui/views/register/register_view.form.dart';
import 'package:transitspot/ui/views/register/register_viewmodel.dart';
import 'package:transitspot/utils/app_color.dart';
import 'package:transitspot/utils/app_text.dart';
import 'package:stacked/stacked.dart';

@FormView(fields: [
  FormTextField(name: "name"),
  FormTextField(name: "email"),
  FormTextField(name: "password", isPassword: true),
])
class RegisterView extends StatelessWidget with $RegisterView {
  RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RegisterViewModel>.reactive(
      onModelReady: (viewModel) => listenToFormUpdated(viewModel),
      builder: (context, model, child) => Scaffold(
        backgroundColor: AppColors.primaryBackground,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        drawer: Drawer(),
        body: Container(
          child: AppText(
            text: model.title,
            color: AppColors.content,
            size: 20,
          ),
        ),
      ),
      viewModelBuilder: () => RegisterViewModel(),
    );
  }
}
