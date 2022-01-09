import 'package:flutter/material.dart';
import 'package:transitspot/ui/views/home/home_viewmodel.dart';
import 'package:transitspot/utils/app_color.dart';
import 'package:transitspot/utils/app_text.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RegisterViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        backgroundColor: AppColors.bg,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        drawer: Drawer(),
        body: Container(
          child: AppText(
            text: model.title,
            color: AppColors.fontPrimary,
            size: 20,
          ),
        ),
      ),
      viewModelBuilder: () => RegisterViewModel(),
    );
  }
}
