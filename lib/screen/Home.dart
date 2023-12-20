import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../controller/UserController.dart';
import '../model/user.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List<User>> usersFuture;

  @override
  void initState() {
    super.initState();
    // Move the fetchUsers call to initState to fetch data when the widget is initialized
    usersFuture = UserController.fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text('Random API call')),
      ),
      body: FutureBuilder<List<User>>(
        future: usersFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Text('No data available');
          } else {
            List<User> users = snapshot.data!;
            return ListView.builder(
              itemBuilder: (context, index) {
                final user = users[index];
                return ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.network(user.picture.large.toString()),
                  ),
                  title: Text(
                    user.location.coordinates.fullLocation.toString(),
                    style: TextStyle(fontSize: 20, color: Colors.red),
                  ),
                  subtitle: Text(
                    user.gender.toString(),
                  ),
                );
              },
              itemCount: users.length,
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            usersFuture = UserController.fetchUsers();
          });
        },
        child: const Icon(
          Icons.play_arrow,
          size: 35,
        ),
      ),
    );
  }
}
