import 'package:flutter/material.dart';
import 'package:movie_review/src/constant/colors.dart';
import 'package:movie_review/src/constant/strings.dart';
import 'package:movie_review/src/utils/media_query.dart';
import 'text.dart';

class FxBottomSheet extends StatelessWidget {
 final void Function()? onPressedCamera;
 final void Function()? onPressedGallery;
  const FxBottomSheet({super.key, this.onPressedCamera, this.onPressedGallery});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height(context: context) * 0.14,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: width(context: context) * 0.4,
                height: 4,
                decoration: BoxDecoration(
                  color: ConstColor.grey,
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(10),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FxText(
                  text: ConstString.movieImage,
                  color: ConstColor.black,
                  size: 16,
                  fontWeight: FontWeight.w500,
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.close,
                    color: ConstColor.grey,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                TextButton(
                  onPressed: onPressedCamera,
                  child: Column(
                    children: [
                      Icon(
                        Icons.camera_alt_rounded,
                        color: ConstColor.primary2,
                      ),
                      FxText(
                        text: ConstString.camera,
                        color: ConstColor.primary1,
                      ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: onPressedGallery,
                  child: Column(
                    children: [
                      Icon(
                        Icons.image_rounded,
                        color: ConstColor.primary2,
                      ),
                      FxText(
                        text: ConstString.gallery,
                        color: ConstColor.primary1,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
