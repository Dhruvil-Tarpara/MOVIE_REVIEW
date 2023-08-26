import 'package:flutter/material.dart';
import 'package:movie_review/src/utils/media_query.dart';

class Dialogs {
  static Future<void> showLoadingDialog(BuildContext context) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          child: SizedBox(
            height: height(context: context) * 0.08,
            child: const Center(child: CircularProgressIndicator.adaptive()),
          ),
        );
      },
    );
  }
}
