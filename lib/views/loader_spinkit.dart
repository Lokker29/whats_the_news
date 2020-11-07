import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoaderSpinkit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SpinKitRotatingCircle(
      color: Theme.of(context).primaryColor,
      size: 50.0,
    );
  }
}
