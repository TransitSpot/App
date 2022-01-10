import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:transitspot/ui/views/startup/startup_viewmodel.dart';
import 'package:transitspot/utils/app_color.dart';

class StartupView extends StatelessWidget {
  const StartupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartupViewModel>.reactive(
      onModelReady: (viewModel) => {
        Future.delayed(const Duration(milliseconds: 3000), () {
          viewModel.initialise();
        })
      },
      builder: (context, model, child) => Scaffold(
        backgroundColor: AppColors.secondaryBackground,
        body: Center(
          child: Image.asset(
            'lib/assets/shared/logo.png',
          ),
        ),
      ),
      viewModelBuilder: () => StartupViewModel(),
    );
  }
}
