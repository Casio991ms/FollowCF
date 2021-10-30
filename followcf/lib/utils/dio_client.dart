import 'package:dio/dio.dart';
import 'package:followcf/models/user.dart';
import 'package:followcf/models/submission.dart';

class DioClient {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://codeforces.cc/api/',
      connectTimeout: 5000,
      receiveTimeout: 3000,
    ),
  );

  Future<List<User>> getUsers({required List<String> handles}) async {
    List<User> retrievedUsers = [];

    for (String h in handles) {
      try {
        Response response = await _dio.get("user.info?handles=$h");

        if (response.data["status"] != "OK") {
          continue;
        }

        List<dynamic> responseUsers = response.data["result"];

        for (Map<String, dynamic> responseUser in responseUsers) {
          retrievedUsers.add(User.fromJson(responseUser));
        }
      } on DioError catch (e) {
        if (e.response != null) {
          print('Dio error!');
          print('STATUS: ${e.response?.statusCode}');
          print('DATA: ${e.response?.data}');
          print('HEADERS: ${e.response?.headers}');
        } else {
          print('Error sending request!');
          print(e.message);
        }
      }
    }

    return retrievedUsers;
  }

  Future<List<Submission>> getSingleUserSubmissions(
      {required User user, required int start}) async {
    List<Submission> retrievedSubmissions = [];

    try {
      Response response = await _dio
          .get("user.status?handle=${user.handle}&from=$start&count=10");

      if (response.data["status"] != "OK") {
        return retrievedSubmissions;
      }

      List<dynamic> responseSubmissions = response.data["result"];

      for (Map<String, dynamic> responseSubmission in responseSubmissions) {
        retrievedSubmissions.add(
            Submission.fromJson(responseSubmission, user.handle, user.rank));
      }
    } on DioError catch (e) {
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        print('Error sending request!');
        print(e.message);
      }
    }

    return retrievedSubmissions;
  }

  Future<List<Submission>> getAllUsersSubmissions(
      {required List<User> users}) async {
    List<Submission> retrievedSubmissions = [];

    for (User u in users) {
      try {
        Response response =
            await _dio.get("user.status?handle=${u.handle}&from=1&count=10");

        if (response.data["status"] != "OK") {
          return retrievedSubmissions;
        }

        List<dynamic> responseSubmissions = response.data["result"];

        for (Map<String, dynamic> responseSubmission in responseSubmissions) {
          retrievedSubmissions
              .add(Submission.fromJson(responseSubmission, u.handle, u.rank));
        }
      } on DioError catch (e) {
        if (e.response != null) {
          print('Dio error!');
          print('STATUS: ${e.response?.statusCode}');
          print('DATA: ${e.response?.data}');
          print('HEADERS: ${e.response?.headers}');
        } else {
          print('Error sending request!');
          print(e.message);
        }
      }
    }
    retrievedSubmissions
        .sort((a, b) => b.creationTimeSeconds.compareTo(a.creationTimeSeconds));

    return retrievedSubmissions;
  }
}
