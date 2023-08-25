import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movie_review/src/constant/colors.dart';
import 'package:movie_review/src/constant/global.dart';
import 'package:movie_review/src/constant/strings.dart';
import 'package:movie_review/src/constant/widgets/text.dart';
import 'package:movie_review/src/constant/widgets/text_form_field.dart';
import 'package:movie_review/src/provider/bloc/data/movie_data_bloc.dart';
import 'package:movie_review/src/provider/bloc/operation/operation_bloc.dart';
import 'package:movie_review/src/provider/firebase/firestore/movie_model.dart';
import 'package:movie_review/src/utils/extension/capitalize.dart';
import 'package:movie_review/src/utils/extension/uuid.dart';
import 'package:movie_review/src/utils/media_query.dart';

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
    if (widget.movie.rating?.containsKey(Global.users.id.toString()) ?? false) {
      rating = widget.movie.rating![Global.users.id][ConstString.rating]
          .toString()
          .todouble();
    }
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
      body: BlocBuilder<OperationBloc, OperationState>(
        builder: (context, state) => state.when(
          initial: () => const SizedBox.shrink(),
          success: (isSuccess) {
            List data = isSuccess.rating!.values.toList();
            double average = calculateAverageRating(data);
            return SingleChildScrollView(
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
                        image: NetworkImage(isSuccess.image!),
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
                    text: isSuccess.movieName!,
                    size: 22,
                    color: ConstColor.black,
                    fontWeight: FontWeight.w600,
                  ),
                  FxText(
                    text: isSuccess.category!,
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
                      RatingBar.builder(
                        initialRating: average,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        tapOnlyMode: true,
                        glow: false,
                        updateOnDrag: false,
                        ignoreGestures: true,
                        itemCount: 5,
                        itemSize: 20,
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: ConstColor.primary2,
                          size: 18,
                        ),
                        onRatingUpdate: (value) {
                          rating = value;
                        },
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      FxText(
                        text: average.toStringAsFixed(1),
                        size: 14,
                        color: ConstColor.primary1,
                        fontWeight: FontWeight.w500,
                      ),
                      const Spacer(),
                      FxText(
                        text:
                            "${isSuccess.rating!.length} ${ConstString.reviews}",
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
                        addReview(isSuccess);
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
                    text: isSuccess.prodaction!,
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
                    text: isSuccess.description!,
                    size: 14,
                    color: ConstColor.black,
                    fontWeight: FontWeight.w400,
                  ),
                  SizedBox(
                    height: height(context: context) * 0.02,
                  ),
                  FxText(
                    text: "All Review and Rating",
                    size: 18,
                    color: ConstColor.black,
                    fontWeight: FontWeight.w500,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: data.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RatingBar.builder(
                            initialRating: data[index][ConstString.rating],
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            tapOnlyMode: true,
                            glow: false,
                            updateOnDrag: false,
                            ignoreGestures: true,
                            itemCount: 5,
                            itemSize: 20,
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: ConstColor.primary2,
                              size: 18,
                            ),
                            onRatingUpdate: (value) {
                              rating = value;
                            },
                          ),
                          FxText(text: "${data[index][ConstString.riview]}"),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height(context: context) * 0.04,
                  ),
                ],
              ),
            );
          },
          fialed: (isfialed) => const Center(
            child: FxText(text: ConstString.errorMassage),
          ),
        ),
      ),
    );
  }

  addReview(Movie movie) {
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
                RatingBar.builder(
                  initialRating: rating,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: 20,
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: ConstColor.primary2,
                    size: 18,
                  ),
                  onRatingUpdate: (value) {
                    rating = value;
                  },
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
                Map<String, dynamic>? data = (movie.rating);
                if (data?.containsKey(Global.users.id.toString()) ?? false) {
                  data![Global.users.id.toString()] = User(
                    rating: rating,
                    riview: _reviewController.text,
                  ).toJson();
                } else {
                  data![Global.users.id.toString()] = User(
                    rating: rating,
                    riview: _reviewController.text,
                  ).toJson();
                }
                context.read<OperationBloc>().add(
                      OperationEvent.upDate(
                          Movie(
                            userId: movie.userId,
                            movieId: movie.movieId,
                            movieName: movie.movieName,
                            category: movie.category,
                            releaseDate: movie.releaseDate,
                            releaseTime: movie.releaseTime,
                            prodaction: movie.prodaction,
                            description: movie.description,
                            image: movie.image,
                            rating: data,
                          ),
                          movie.movieId.toString()),
                    );
                Navigator.pop(context);
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
