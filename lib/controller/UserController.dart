import 'dart:convert' show jsonDecode;

import '../model/user.dart';
import 'package:http/http.dart' as http;

class UserController {
  static Future<List<User>> fetchUsers() async {
    List<User> users = [];

    print("fetchUsers called");
    const url = 'https://randomuser.me/api/?results=5';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List<dynamic> jsonResults = jsonDecode(response.body)['results'];
      // print(jsonResults);
      users = jsonResults.map((e) => User.fromJson(e)).toList();

      print('fetchUsers Complete');
      return users;
    } else {
      print('Failed to fetch users: ${response.statusCode}');
      return users;
    }
  }
}
