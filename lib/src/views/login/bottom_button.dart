import 'package:flutter/material.dart';
import 'package:movie_review/src/constant/colors.dart';
import 'package:movie_review/src/constant/widgets/text.dart';
import 'package:movie_review/src/utils/media_query.dart';

class BottomButton extends StatelessWidget {
  final String buttonText;
  final String buttonPage;
  final void Function()? onPressed;
  const BottomButton({
    super.key,
    required this.buttonText,
    required this.buttonPage,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FxText(
            text: buttonText,
            size: 14,
            color: ConstColor.grey,
            fontWeight: FontWeight.w400,
          ),
          SizedBox(
            width: width(context: context) * 0.02,
          ),
          FxText(
            text: buttonPage,
            size: 14,
            color: ConstColor.primary2,
            fontWeight: FontWeight.w500,
          ),
        ],
      ),
    );
  }
}
