import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

Movie movieFromJson(String str) => Movie.fromJson(json.decode(str));

String movieToJson(Movie data) => json.encode(data.toJson());

class Movie {
  final String? userId;

  final String? movieId;
  final String? movieName;
  final String? category;
  final String? releaseDate;
  final String? releaseTime;
  final String? prodaction;
  final String? description;
  final String? image;
  final Map<String, dynamic>? rating;

  Movie({
    this.userId,
    this.movieId,
    this.movieName,
    this.category,
    this.releaseDate,
    this.releaseTime,
    this.prodaction,
    this.description,
    this.image,
    this.rating,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        userId: json["userId"],
        movieId: json["movieId"],
        movieName: json["movieName"],
        category: json["category"],
        releaseDate: json["releaseDate"],
        releaseTime: json["releaseTime"],
        prodaction: json["prodaction"],
        description: json["description"],
        image: json["image"],
        rating: json["rating"],
      );

  factory Movie.stream(QueryDocumentSnapshot<Object?> json) => Movie(
        userId: json["userId"],
        movieId: json["movieId"],
        movieName: json["movieName"],
        category: json["category"],
        releaseDate: json["releaseDate"],
        releaseTime: json["releaseTime"],
        prodaction: json["prodaction"],
        description: json["description"],
        image: json["image"],
        rating: json["rating"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "movieId": movieId,
        "movieName": movieName,
        "category": category,
        "releaseDate": releaseDate,
        "releaseTime": releaseTime,
        "prodaction": prodaction,
        "description": description,
        "image": image,
        "rating": rating,
      };
}

class User {
  final double? rating;
  final String? riview;

  User({
    this.rating,
    this.riview,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        rating: json["Rating"],
        riview: json["riview"],
      );

  Map<String, dynamic> toJson() => {
        "Rating": rating,
        "riview": riview,
      };
}
