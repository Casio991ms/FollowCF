import 'package:flutter/material.dart';

class Submission {
  int submissionId;
  String author;
  String authorRank;
  int creationTimeSeconds;
  int? contestId;
  String problemIndex;
  String problemName;
  int? problemRating;
  String? verdict;

  Submission(
      {required this.submissionId,
      required this.author,
      required this.authorRank,
      required this.creationTimeSeconds,
      this.contestId,
      required this.problemIndex,
      required this.problemName,
      this.problemRating,
      this.verdict});

  factory Submission.fromJson(
      Map<String, dynamic> json, String author, String authorRank) {
    return Submission(
      submissionId: json["id"],
      author: author,
      authorRank: authorRank,
      creationTimeSeconds: json["creationTimeSeconds"],
      contestId: json["problem"]["contestId"],
      problemIndex: json["problem"]["index"],
      problemName: json["problem"]["name"],
      problemRating: json["problem"]["rating"],
      verdict: json["verdict"],
    );
  }

  Color getColor(String rank) {
    switch (rank) {
      case "newbie":
        return const Color(0xFF808080);
      case "pupil":
        return const Color(0xFF008000);
      case "specialist":
        return const Color(0xFF03A89E);
      case "expert":
        return const Color(0xFF0000FE);
      case "candidate master":
        return const Color(0xFFAA00BB);
      case "master":
        return const Color(0xFFFF8C00);
      case "international master":
        return const Color(0xFFFF8C00);
      case "grandmaster":
        return const Color(0xFFFF0000);
      case "international grandmaster":
        return const Color(0xFFFF0000);
      case "legendary grandmaster":
        return const Color(0xFFFF0000);
      default:
        return const Color(0xFFFFFFFF);
    }
  }
}
