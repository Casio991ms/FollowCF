import 'package:flutter/material.dart';

class user {
  String handle;
  String? email;
  String? firstName;
  String? lastName;
  String? country;
  String? city;
  String? organization;
  int contribution;
  String rank;
  int rating;
  String maxRank;
  int maxRating;
  int lastOnlineTimeSeconds;
  int registrationTimeSeconds;
  int friendOfCount;
  String avatar;
  String titlePhoto;

  user(
      {required this.handle,
      this.email,
      this.firstName,
      this.lastName,
      this.country,
      this.city,
      this.organization,
      required this.contribution,
      required this.rank,
      required this.rating,
      required this.maxRank,
      required this.maxRating,
      required this.lastOnlineTimeSeconds,
      required this.registrationTimeSeconds,
      required this.friendOfCount,
      required this.avatar,
      required this.titlePhoto});

  factory user.fromJson(Map<String, dynamic> json) {
    return user(
      handle: json['handle'],
      email: json['email'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      country: json['country'],
      city: json['city'],
      organization: json['organization'],
      contribution: json['contribution'],
      rank: json['rank'],
      rating: json['rating'],
      maxRating: json['maxRating'],
      maxRank: json['maxRank'],
      lastOnlineTimeSeconds: json['lastOnlineTimeSeconds'],
      registrationTimeSeconds: json['registrationTimeSeconds'],
      friendOfCount: json['friendOfCount'],
      avatar: json['avatar'],
      titlePhoto: json['titlePhoto'],
    );
  }

  Color getColor() {
    switch (rank) {
      case "newbie":
        return const Color(0xFF808080);
      case "pupil":
        return const Color(0xFF008000);
      case "specialist":
        return const Color(0xFF03A89E);
      case "expert":
        return const Color(0xFF0000FE);
      case "candidate Master":
        return const Color(0xFFAA00BB);
      case "master":
        return const Color(0xFFFF8C00);
      case "international Master":
        return const Color(0xFFFF8C00);
      case "grandmaster":
        return const Color(0xFFFF0000);
      case "international Grandmaster":
        return const Color(0xFFFF0000);
      case "legendary Grandmaster":
        return const Color(0xFFFF0000);
      default:
        return const Color(0xFFFFFFFF);
    }
  }
}
