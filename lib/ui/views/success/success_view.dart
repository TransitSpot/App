import 'package:flutter/material.dart';
import 'package:transitspot/ui/layout/has_login_view.dart';
import 'package:transitspot/ui/views/success/success_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:transitspot/utils/app_color.dart';
import 'package:transitspot/app/app.router.dart';

class SuccessView extends StatelessWidget {
  final bool isOnDemand;

  const SuccessView({Key? key, required this.isOnDemand}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SuccessViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        floatingActionButton: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 20.0),
          child: SizedBox(
            height: 50.0,
            width: 50.0,
            child: FittedBox(
              child: FloatingActionButton(
                onPressed: () {
                  isOnDemand
                      ? model.navigatePage(
                          Routes.homeView) // TODO: implement page on demand
                      : model.navigatePage(Routes.bookView);
                },
                child: const Icon(Icons.arrow_back_ios_new,
                    color: Colors.black, size: 35.0),
                backgroundColor: AppColors.primaryBackground,
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
        body: HasLoginView(
          childWidget: SingleChildScrollView(
            child: SafeArea(
              child: Center(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 80.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'Yeay! ${isOnDemand ? "Pemesanan" : "Transaksi"} berhasil diproses',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 24.0,
                          color: AppColors.content,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Image.asset(
                      'lib/assets/shared/success-icon.png',
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          isOnDemand
                              ? null // TODO: navigate to on share live loc page
                              : model.navigatePage(Routes.homeView);
                        },
                        child: Text(
                          isOnDemand ? 'Share Live Location' : 'Back to Home',
                          style: TextStyle(
                            color: AppColors.content,
                            fontSize: 17.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        style: ButtonStyle(
                          fixedSize: MaterialStateProperty.all<Size>(
                            Size.fromWidth(
                              MediaQuery.of(context).size.width * 0.8,
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              AppColors.secondaryBackground),
                          elevation: MaterialStateProperty.all<double>(4.0),
                        ),
                      ),
                    ),
                    isOnDemand
                        ? GestureDetector(
                            onTap: () {
                              model.navigatePage(Routes.homeView);
                            },
                            child: Text('or back to home'),
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      viewModelBuilder: () => SuccessViewModel(),
    );
  }
}
