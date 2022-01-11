import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:transitspot/ui/views/order/order_view.form.dart';
import 'package:transitspot/ui/views/order/order_viewmodel.dart';
import 'package:transitspot/datamodels/search_result_data/search_result_data.dart';

@FormView(fields: [
  FormTextField(name: 'amount', isPassword: false),
  FormTextField(name: 'method', isPassword: false),
])
class OrderView extends StatelessWidget with $OrderView {
  final SearchResultData data;

  OrderView({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OrderViewModel>.reactive(
      viewModelBuilder: () => OrderViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text('Order'),
        ),
        body: Center(),
      ),
    );
  }
}
