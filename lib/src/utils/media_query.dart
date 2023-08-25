import 'package:flutter/material.dart';

double height({required BuildContext context}) {
  return MediaQuery.sizeOf(context).height;
}

double width({required BuildContext context}) {
  return MediaQuery.sizeOf(context).width;
}

extension Mediaheight on double {
  double rheight({required BuildContext context}) {
    return MediaQuery.of(context).size.height * this;
  }
}

extension Mediawidth on double {
  double rwidth({required BuildContext context}) {
    return MediaQuery.of(context).size.width * this;
  }
}
