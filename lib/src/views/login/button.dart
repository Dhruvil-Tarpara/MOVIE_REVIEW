import 'package:flutter/material.dart';
import 'package:movie_review/src/constant/colors.dart';
import 'package:movie_review/src/constant/widgets/text.dart';

class FxButton extends StatelessWidget {
  final String buttonText;
  final void Function()? onPressed;
  const FxButton({
    super.key,
    required this.buttonText,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(ConstColor.primary1),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: BorderSide(color: ConstColor.primary2, width: 2)),
        ),
      ),
      child: FxText(
        text: buttonText,
        size: 16,
        color: ConstColor.white,
      ),
    );
  }
}
