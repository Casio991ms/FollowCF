library globals;

import 'package:followcf/models/submission.dart';
import 'package:followcf/models/user.dart';
import 'package:flutter/material.dart';

List<User> users = [];
List<String> handles = [];
List<Submission> allSubmissions = [];

void removeUser(User u, BuildContext context) {
  ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text('Removed ${u.handle}')));
  handles.remove(u.handle);
  users.remove(u);
}

void addUser(User u, BuildContext context) {
  ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text('Added ${u.handle}')));
  users.add(u);
  handles.add(u.handle);
}
