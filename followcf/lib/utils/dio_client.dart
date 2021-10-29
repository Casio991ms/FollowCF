import 'package:dio/dio.dart';
import 'package:followcf/models/user.dart';

class DioClient {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://codeforces.cc/api/user.info?handles=',
      connectTimeout: 5000,
      receiveTimeout: 3000,
    ),
  );

  Future<List<user?>> getUsers({required List<String> handles}) async {
    List<user?> retrievedUsers = [];

    // print("https://codeforces.cc/api/user.info?handles=" + restUrl);

    for (String h in handles) {
      try {
        Response response = await _dio.get(h);

        if (response.data["status"] != "OK") {
          continue;
        }

        List<dynamic> responseUsers = response.data["result"];

        for (Map<String, dynamic> responseUser in responseUsers) {
          retrievedUsers.add(user.fromJson(responseUser));
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
}
