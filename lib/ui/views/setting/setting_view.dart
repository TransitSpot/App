import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:transitspot/utils/app_color.dart';
import 'package:transitspot/ui/views/setting/setting_viewmodel.dart';
import 'package:transitspot/app/app.router.dart';

class SettingView extends StatelessWidget {
  const SettingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SettingViewModel>.reactive(
      onModelReady: (model) => {model.getUserData()},
      builder: (context, model, child) => Scaffold(
        backgroundColor: AppColors.primaryBackground,
        floatingActionButton: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 20.0),
          child: SizedBox(
            height: 50.0,
            width: 50.0,
            child: FittedBox(
              child: FloatingActionButton(
                onPressed: () {
                  model.navigatePage(Routes.homeView);
                },
                child: const Icon(Icons.arrow_back_ios_new,
                    color: Colors.black, size: 35.0),
                backgroundColor: AppColors.primaryBackground,
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 100.0,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black38,
                          blurRadius: 5.0,
                          spreadRadius: 1.0,
                          offset: Offset(
                              5.0, 8.0), // shadow direction: bottom right
                        )
                      ],
                    ),
                    width: MediaQuery.of(context).size.width * 0.85,
                    height: MediaQuery.of(context).size.height * 0.6,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20.0),
                        ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(model.photoURL),
                            radius: 30.0,
                          ),
                          title: Text(
                            model.uname,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                              color: AppColors.content,
                            ),
                          ),
                          subtitle: Text(
                            '${model.role} Account',
                            style: TextStyle(
                              fontSize: 15,
                              color: AppColors.content,
                            ),
                          ),
                        ),
                        const Divider(
                          color: Colors.grey,
                          thickness: 1.0,
                          height: 20.0,
                        ),
                        Column(
                          children: [
                            {
                              'icon': Icons.person,
                              'text': 'Profile Settings',
                            },
                            {
                              'icon': Icons.notifications,
                              'text': 'Notification',
                            },
                            {
                              'icon': Icons.call,
                              'text': 'Support',
                            },
                          ].map(
                            (Map x) {
                              return SizedBox(
                                width: double.infinity,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0,
                                            ),
                                            child: Icon(x['icon']),
                                          ),
                                          Text(
                                            x['text'],
                                            style: TextStyle(
                                              color: AppColors.content,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 0, 16.0, 0),
                                        child: Icon(
                                            Icons.arrow_forward_ios_rounded),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ).toList(),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 24.0,
                              ),
                              Center(
                                child: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.8 -
                                          16.0,
                                  child: ElevatedButton(
                                      onPressed: () {
                                        model.logout();
                                      },
                                      child: Text('Logout',
                                          style: TextStyle(
                                              color:
                                                  AppColors.primaryBackground,
                                              fontSize: 17.0,
                                              fontWeight: FontWeight.w700)),
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                AppColors
                                                    .darkSecondaryBackground),
                                        elevation:
                                            MaterialStateProperty.all<double>(
                                                4.0),
                                      )),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      viewModelBuilder: () => SettingViewModel(),
    );
  }
}
