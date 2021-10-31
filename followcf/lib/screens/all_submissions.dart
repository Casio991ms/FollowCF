import 'package:followcf/globals.dart';

import 'package:flutter/material.dart';
import 'package:followcf/models/submission.dart';
import 'package:followcf/models/color.dart';
import 'package:followcf/utils/dio_client.dart';
import 'package:followcf/widgets/drawer.dart';
import 'package:intl/intl.dart';

class AllSubmissions extends StatefulWidget {
  const AllSubmissions({Key? key}) : super(key: key);

  @override
  State<AllSubmissions> createState() => _AllSubmissions();
}

class _AllSubmissions extends State<AllSubmissions> {
  final DioClient _dioClient = DioClient();
  int start = 1;

  @override
  void initState() {
    super.initState();

    func().then((data) {
      setState(() {
        allSubmissions = data;
      });
    });
  }

  Future func() async {
    return _dioClient.getAllUsersSubmissions(users: users);
  }

  String convertTime(int creationTimeSeconds) {
    DateTime dt =
        DateTime.fromMillisecondsSinceEpoch(creationTimeSeconds * 1000);
    return DateFormat('MMM/dd/yyyy H:m').format(dt);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Submissions"),
      ),
      drawer: const MyDrawer(),
      body: ListView(
        children: List.generate(
          allSubmissions.length,
          (i) => Container(
            margin: const EdgeInsets.fromLTRB(10, 3, 10, 3),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              color: Color(0xFFDDDDDD),
            ),
            child: ListTile(
              key: UniqueKey(),
              leading: Text(allSubmissions[i].problemRating.toString()),
              title: Text(allSubmissions[i].contestId.toString() +
                  allSubmissions[i].problemIndex +
                  ": " +
                  allSubmissions[i].problemName),
              subtitle: RichText(
                  text: TextSpan(children: <TextSpan>[
                TextSpan(
                    text: allSubmissions[i].author,
                    style: TextStyle(
                        color: getColor(allSubmissions[i].authorRank))),
                TextSpan(
                    text: ", " +
                        convertTime(allSubmissions[i].creationTimeSeconds),
                    style: const TextStyle(color: Colors.black))
              ])),
              isThreeLine: true,
              trailing: Text(
                allSubmissions[i].verdict!,
                style: TextStyle(
                    color: allSubmissions[i].verdict! == "OK"
                        ? const Color(0xFF00AA00)
                        : const Color(0xFFFE0000)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
