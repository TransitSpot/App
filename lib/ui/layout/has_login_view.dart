import 'package:flutter/material.dart';

class HasLoginView extends StatelessWidget {
  final Widget childWidget;

  const HasLoginView({Key? key, required this.childWidget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      child: Stack(children: [
        Positioned(
          bottom: 0,
          child: Image.asset(
            'lib/assets/shared/bg_layout.png',
          ),
        ),
        childWidget,
      ]),
    );
  }
}
