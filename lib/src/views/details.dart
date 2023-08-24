import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_review/src/constant/colors.dart';
import 'package:movie_review/src/constant/global.dart';
import 'package:movie_review/src/constant/strings.dart';
import 'package:movie_review/src/constant/widgets/text.dart';
import 'package:movie_review/src/constant/widgets/text_form_field.dart';
import 'package:movie_review/src/provider/bloc/data/movie_data_bloc.dart';
import 'package:movie_review/src/provider/firebase/firestore/firebase_cloud.dart';
import 'package:movie_review/src/provider/firebase/firestore/movie_model.dart';
import 'package:movie_review/src/utils/extension/capitalize.dart';
import 'package:movie_review/src/utils/media_query.dart';
import 'package:velocity_x/velocity_x.dart';

class DetailScreen extends StatefulWidget {
  final Movie movie;

  const DetailScreen({super.key, required this.movie});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final GlobalKey<FormState> _reviewKey = GlobalKey<FormState>();
  final TextEditingController _reviewController = TextEditingController();
  double rating = 0;
  @override
  void initState() {
    super.initState();
    _reviewController.text =
        widget.movie.rating![Global.users.id][ConstString.riview] ?? "";
    rating = widget.movie.rating![Global.users.id][ConstString.rating]
        .toString()
        .todouble();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstColor.white,
      appBar: AppBar(
        backgroundColor: ConstColor.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            context
                .read<MovieDataBloc>()
                .add(const MovieDataEvent.refreshData());
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: ConstColor.primary1,
          ),
        ),
        title: FxText(
          text: widget.movie.movieName!,
          color: ConstColor.black,
          fontWeight: FontWeight.w600,
        ),
        actions: [
          (Global.users.url != null)
              ? CircleAvatar(
                  backgroundImage: NetworkImage(Global.users.url ?? ""),
                )
              : CircleAvatar(
                  backgroundColor: ConstColor.primary3,
                  backgroundImage: const AssetImage(
                    Global.userImage,
                  ),
                ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 4,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image(
                  image: NetworkImage(widget.movie.image!),
                  height: height(context: context) * 0.24,
                  width: width(context: context),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: height(context: context) * 0.02,
            ),
            FxText(
              text: widget.movie.movieName!,
              size: 22,
              color: ConstColor.black,
              fontWeight: FontWeight.w600,
            ),
            FxText(
              text: widget.movie.category!,
              size: 14,
              color: ConstColor.black,
              fontWeight: FontWeight.w400,
            ),
            SizedBox(
              height: height(context: context) * 0.01,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                VxRating(
                  onRatingUpdate: (value) {
                    rating = value.todouble();
                  },
                  selectionColor: ConstColor.primary2,
                  size: 22,
                  value: rating,
                  maxRating: 5,
                  stepInt: true,
                ),
                const SizedBox(
                  width: 8,
                ),
                FxText(
                  text: widget
                      .movie.rating![Global.users.id][ConstString.rating]
                      .toString(),
                  size: 14,
                  color: ConstColor.primary1,
                  fontWeight: FontWeight.w500,
                ),
                const Spacer(),
                FxText(
                  text: "${widget.movie.rating!.length} ${ConstString.reviews}",
                  size: 14,
                  color: ConstColor.black,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  addReview();
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: FxText(
                  text: ConstString.writeReview,
                  size: 14,
                  color: ConstColor.primary2,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            FxText(
              text: ConstString.prodaction,
              size: 18,
              color: ConstColor.black,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(
              height: height(context: context) * 0.01,
            ),
            FxText(
              text: widget.movie.prodaction!,
              size: 14,
              color: ConstColor.black,
              fontWeight: FontWeight.w400,
            ),
            SizedBox(
              height: height(context: context) * 0.04,
            ),
            FxText(
              text: ConstString.description,
              size: 18,
              color: ConstColor.black,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(
              height: height(context: context) * 0.01,
            ),
            FxText(
              text: widget.movie.description!,
              size: 14,
              color: ConstColor.black,
              fontWeight: FontWeight.w400,
            ),
          ],
        ),
      ),
    );
  }

  addReview() {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog.adaptive(
        title: Center(
          child: FxText(
            text: ConstString.writeReview,
            color: ConstColor.black,
            fontWeight: FontWeight.w500,
          ),
        ),
        content: SizedBox(
          height: height(context: context) * 0.2,
          child: Form(
            key: _reviewKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                VxRating(
                  onRatingUpdate: (value) {
                    rating = value.todouble();
                  },
                  selectionColor: ConstColor.primary2,
                  size: 26,
                  value: rating,
                  maxRating: 5,
                  stepInt: true,
                ),
                FxTextFormField(
                  controller: _reviewController,
                  textInputType: TextInputType.text,
                  hintText: ConstString.review,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return ConstString.reviewError;
                    } else {
                      return null;
                    }
                  },
                ),
              ],
            ),
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const FxText(text: ConstString.cancel),
          ),
          TextButton(
            onPressed: () async {
              if (_reviewKey.currentState!.validate()) {
                await FirebaseCloudHelper.firebaseCloudHelper.upDateData(
                  doc: widget.movie.movieId!,
                  data: {
                    ConstString.ratingKey: {
                      widget.movie.userId: User(
                        rating: rating,
                        riview: _reviewController.text,
                      ).toJson()
                    },
                  },
                ).then((value) => Navigator.pop(context));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: FxText(
                      text: ConstString.errorMassage,
                      color: Colors.red,
                    ),
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: Colors.white,
                  ),
                );
              }
            },
            child: const FxText(text: ConstString.ok),
          ),
        ],
      ),
    );
  }
}
