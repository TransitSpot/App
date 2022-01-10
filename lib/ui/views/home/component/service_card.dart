import 'package:flutter/material.dart';
import 'package:transitspot/utils/app_color.dart';
import 'package:transitspot/app/app.locator.dart';
import 'package:transitspot/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

class ServiceCard extends StatelessWidget {
  final String title;
  final String iconSrv;
  final _navigationService = locator<NavigationService>();

  ServiceCard({Key? key, required this.title, required this.iconSrv})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 5,
        ),
        GestureDetector(
          onTap: () {
            _navigationService.navigateTo(Routes.bookView);
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            elevation: 5,
            child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        'lib/assets/home/card-bg.png'), // must constant image path
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                  ),
                ),
                child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ListTile(
                        leading: ConstrainedBox(
                          constraints: const BoxConstraints(
                            minWidth: 44,
                            minHeight: 44,
                            maxWidth: 64,
                            maxHeight: 64,
                          ),
                          child: Image.asset(iconSrv, fit: BoxFit.cover),
                        ),
                        title: Text(title,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                              color: AppColors.content,
                            ))))),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
      ],
    );
  }
}
