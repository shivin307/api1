import 'dart:convert';

import 'package:api1/model/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<User> users = [];

  @override
  void initState() {
    // Move the fetchUsers call to initState to fetch data when the widget is initialized
    fetchUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text('Random API call')),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final user = users[index];
          return ListTile(
            leading: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.network(user.url)),
            title: Text(
              user.id.toString(),
              style: TextStyle(fontSize: 20, color: Colors.red),
            ),
            subtitle: Text(
              user.url.toString(),
            ),
          );
        },
        itemCount: users.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: fetchUsers,
        child: const Icon(
          Icons.play_arrow,
          size: 35,
        ),
      ),
    );
  }

  Future<List<User>> fetchUsers() async {
    print("fetchUsers called");
    const url = 'https://jsonplaceholder.typicode.com/photos';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List<dynamic> jsonResults = jsonDecode(response.body);

      setState(() {
        users = jsonResults.map((e) => User.fromJson(e)).toList();
      });

      print('fetchUsers Complete');
      return users;
    } else {
      print('Failed to fetch users: ${response.statusCode}');
      return users;
    }
  }
}
