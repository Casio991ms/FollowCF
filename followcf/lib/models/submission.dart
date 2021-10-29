class Submission {
  int submissionId;
  String author;
  int creationTimeSeconds;
  int? contestId;
  String problemIndex;
  String problemName;
  int? problemRating;
  String? verdict;

  Submission(
      {required this.submissionId,
      required this.author,
      required this.creationTimeSeconds,
      this.contestId,
      required this.problemIndex,
      required this.problemName,
      this.problemRating,
      this.verdict});

  factory Submission.fromJson(Map<String, dynamic> json, String handle) {
    return Submission(
      submissionId: json["id"],
      author: handle,
      creationTimeSeconds: json["creationTimeSeconds"],
      contestId: json["problem"]["contestId"],
      problemIndex: json["problem"]["index"],
      problemName: json["problem"]["name"],
      problemRating: json["problem"]["rating"],
      verdict: json["verdict"],
    );
  }
}
