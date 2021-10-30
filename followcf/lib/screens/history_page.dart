import 'package:flutter/material.dart';
import 'package:followcf/models/submission.dart';
import 'package:followcf/models/user.dart';
import 'package:followcf/models/color.dart';
import 'package:followcf/utils/dio_client.dart';
import 'package:intl/intl.dart';

class UserHistory extends StatefulWidget {
  const UserHistory({Key? key, required this.u}) : super(key: key);

  final User u;

  @override
  _UserHistoryState createState() => _UserHistoryState();
}

class _UserHistoryState extends State<UserHistory> {
  final DioClient _dioClient = DioClient();
  List<Submission> submissions = [];
  int start = 1;

  @override
  void initState() {
    super.initState();

    func(start).then((data) {
      setState(() {
        submissions = data;
      });
    });
  }

  Future func(int start) async {
    return _dioClient.getSingleUserSubmissions(user: widget.u, start: start);
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
        title: Text(widget.u.handle),
      ),
      body: Column(
        children: [
          Expanded(
            child: Scrollbar(
              isAlwaysShown: true,
              child: ListView(
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
                            leading:
                                Text(submissions[i].problemRating.toString()),
                            title: Text(submissions[i].contestId.toString() +
                                submissions[i].problemIndex +
                                ": " +
                                submissions[i].problemName),
                            subtitle: RichText(
                                text: TextSpan(children: <TextSpan>[
                              TextSpan(
                                  text: submissions[i].author,
                                  style: TextStyle(
                                      color:
                                          getColor(submissions[i].authorRank))),
                              TextSpan(
                                  text: ", " +
                                      convertTime(
                                          submissions[i].creationTimeSeconds),
                                  style: TextStyle(color: Colors.black))
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
                        )),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(10, 3, 10, 3),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: start == 1
                        ? null
                        : () {
                            start -= 10;
                            func(start).then((data) {
                              setState(() {
                                submissions = data;
                              });
                            });
                          },
                    icon: Icon(Icons.arrow_back)),
                Text(((start + 9) ~/ 10).toString()),
                IconButton(
                    onPressed: () {
                      start += 10;
                      func(start).then((data) {
                        setState(() {
                          submissions = data;
                        });
                      });
                    },
                    icon: Icon(Icons.arrow_forward)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
