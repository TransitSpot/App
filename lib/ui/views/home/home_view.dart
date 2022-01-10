import 'package:flutter/material.dart';
import 'package:transitspot/ui/views/home/home_viewmodel.dart';
import 'package:transitspot/utils/app_color.dart';
import 'package:transitspot/ui/views/home/component/user_card.dart';
import 'package:transitspot/ui/views/home/component/service_card.dart';
import 'package:transitspot/ui/layout/has_login_view.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        backgroundColor: AppColors.primaryBackground,
        drawer: const Drawer(),
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            height: 40.0,
            width: 40.0,
            child: FittedBox(
              child: FloatingActionButton(
                onPressed: () {},
                child:
                    const Icon(Icons.settings, color: Colors.black, size: 35.0),
                backgroundColor: AppColors.primaryBackground,
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
        body: HasLoginView(
          childWidget: SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(30.0, 50.0, 30.0, 0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.title1,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: AppColors.content,
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(height: 5),
                  UserCard(
                    uname: model.uname,
                    role: model.role,
                    // TODO: add image
                  ),
                  const SizedBox(height: 20),
                  Text(
                    model.title2,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: AppColors.content,
                      fontSize: 24,
                    ),
                  ),
                  Column(
                    children: model.srvs.map((srv) {
                      return ServiceCard(
                        title: srv['title']!,
                        iconSrv: srv['img']!,
                        destination: srv['destination']!,
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}
