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
  List<Submission> submissions = [];
  int start = 1;

  @override
  void initState() {
    super.initState();

    func().then((data) {
      setState(() {
        submissions = data;
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
          submissions.length,
          (i) => Container(
            margin: const EdgeInsets.fromLTRB(10, 3, 10, 3),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              color: Color(0xFFDDDDDD),
            ),
            child: ListTile(
              key: UniqueKey(),
              leading: Text(submissions[i].problemRating.toString()),
              title: Text(submissions[i].contestId.toString() +
                  submissions[i].problemIndex +
                  ": " +
                  submissions[i].problemName),
              subtitle: RichText(
                  text: TextSpan(children: <TextSpan>[
                TextSpan(
                    text: submissions[i].author,
                    style:
                        TextStyle(color: getColor(submissions[i].authorRank))),
                TextSpan(
                    text:
                        ", " + convertTime(submissions[i].creationTimeSeconds),
                    style: const TextStyle(color: Colors.black))
              ])),
              isThreeLine: true,
              trailing: Text(
                submissions[i].verdict!,
                style: TextStyle(
                    color: submissions[i].verdict! == "OK"
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
