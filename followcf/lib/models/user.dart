class User {
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

  User(
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

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
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
}
