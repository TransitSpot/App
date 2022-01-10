import 'package:flutter/material.dart';

class HasLoginView extends StatelessWidget {
  final Widget childWidget;

  const HasLoginView({Key? key, required this.childWidget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
              'lib/assets/shared/bg_layout.png'), // must constant image path
          fit: BoxFit.scaleDown,
          alignment: Alignment.bottomCenter,
        ),
      ),
      child: childWidget,
    );
  }
}
