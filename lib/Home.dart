import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<dynamic> users = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: const Text('API')),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(users[index]['name']['first']),
            );
          },
          itemCount: users.length,
        ),
        // body: ListView.builder(
        //   itemCount: users.length,
        //   itemBuilder: (context, index) {
        //     final user = users[index];
        //     final email = user['email'];
        //     return ListTile(
        //       title: Text(email),
        //     );
        //   },
        // ),
        floatingActionButton: FloatingActionButton(
          onPressed: fetchUsers,
        ));
  }

  void fetchUsers() async {
    print("fetchUsers called");
    const url = 'https://randomuser.me/api/?results=100';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    setState(() {
      users = json["results"];
    });
    print('fetchUsers Complete');
  }
}
