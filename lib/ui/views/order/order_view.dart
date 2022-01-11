import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:transitspot/ui/views/order/order_viewmodel.dart';
import 'package:transitspot/ui/views/order/order_view.form.dart';
import 'package:transitspot/datamodels/search_result_data/search_result_data.dart';
import 'package:transitspot/utils/app_color.dart';
import 'package:transitspot/ui/layout/has_login_view.dart';
import 'package:transitspot/utils/text_input.dart';
import 'package:transitspot/app/app.router.dart';
import 'package:transitspot/ui/views/search_result/components/card_result.dart';

@FormView(
  fields: [
    FormTextField(name: 'amount', isPassword: false),
    FormDropdownField(
      name: 'paymentMethod',
      items: [
        StaticDropdownItem(
          title: 'Credit Card',
          value: 'credit_card',
        ),
        StaticDropdownItem(
          title: 'Paypal',
          value: 'paypal',
        ),
      ],
    ),
  ],
)
class OrderView extends StatelessWidget with $OrderView {
  final SearchResultData data;

  OrderView({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OrderViewModel>.reactive(
      viewModelBuilder: () => OrderViewModel(),
      builder: (context, model, child) => Scaffold(
        floatingActionButton: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 20.0),
          child: SizedBox(
            height: 50.0,
            width: 50.0,
            child: FittedBox(
              child: FloatingActionButton(
                onPressed: () {
                  model.navigatePage(Routes.bookView);
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 20.0),
                      child: Container(
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
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(height: 20.0),
                            const Text(
                              'Booking \nRequirements',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Divider(
                              color: AppColors.secondaryBackground,
                              thickness: 5.0,
                              height: 20.0,
                              indent: MediaQuery.of(context).size.width * 0.35,
                              endIndent:
                                  MediaQuery.of(context).size.width * 0.35,
                            ),
                            const Divider(
                              color: Colors.grey,
                              thickness: 1.0,
                              height: 20.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8.0,
                                vertical: 0,
                              ),
                              child: CardResult(data: data, hasButton: false),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 8.0,
                                      horizontal: 0.0,
                                    ),
                                    child: Text(
                                      'Jumlah Pemesanan',
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.content,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      GestureDetector(
                                        child: const Icon(Icons.remove),
                                        onTap: () {
                                          model.decrementAmountBook();
                                        },
                                      ),
                                      const VerticalDivider(),
                                      Text(
                                        '${model.amountBook}',
                                        style: TextStyle(
                                          color: AppColors.content,
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const VerticalDivider(),
                                      GestureDetector(
                                        child: const Icon(Icons.add),
                                        onTap: () {
                                          model.incrementAmountBook();
                                        },
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 24.0,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 8.0,
                                      horizontal: 0.0,
                                    ),
                                    child: Text(
                                      'Metode Pembayaran',
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.content,
                                      ),
                                    ),
                                  ),
                                  Material(
                                    elevation: 5,
                                    color: AppColors.secondaryBackground,
                                    borderRadius: BorderRadius.circular(10),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton(
                                        alignment: AlignmentDirectional.center,
                                        items:
                                            PaymentMethodValueToTitleMap.entries
                                                .map(
                                                  (entry) => DropdownMenuItem(
                                                    value: entry.key,
                                                    child: Center(
                                                      child: Text(
                                                        entry.value,
                                                        style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                                .toList(),
                                        value: model.paymentMethodValue,
                                        hint: const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                            "Pilih metode pembayaran",
                                          ),
                                        ),
                                        dropdownColor:
                                            AppColors.secondaryBackground,
                                        isExpanded: true,
                                        onChanged: (picked) =>
                                            model.setPaymentMethod(
                                          picked.toString(),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                              0.8 -
                                          16.0,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 0.0,
                                          vertical: 16.0,
                                        ),
                                        child: ElevatedButton(
                                            onPressed: () {
                                              print("book");
                                              print(data);
                                              print(model.amountBook);
                                              print(model.paymentMethodValue);
                                            },
                                            child: Text('Book Now',
                                                style: TextStyle(
                                                    color: AppColors
                                                        .primaryBackground,
                                                    fontSize: 17.0,
                                                    fontWeight:
                                                        FontWeight.w700)),
                                            style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all<
                                                      Color>(
                                                AppColors
                                                    .darkSecondaryBackground,
                                              ),
                                              elevation: MaterialStateProperty
                                                  .all<double>(4.0),
                                            )),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
