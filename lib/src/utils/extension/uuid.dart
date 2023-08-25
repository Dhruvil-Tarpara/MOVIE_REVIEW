import 'package:movie_review/src/constant/strings.dart';

String idGenerator() {
  final now = DateTime.now();
  return now.microsecondsSinceEpoch.toString();
}

double calculateAverageRating(List ratings) {
    double sumOfRatings = 0;
    int numberOfRatings = ratings.length;

    if (numberOfRatings == 0) {
      return 0;
    }

    for (var rating in ratings) {
      sumOfRatings += rating[ConstString.rating]!;
    }

    return sumOfRatings / numberOfRatings;
  }