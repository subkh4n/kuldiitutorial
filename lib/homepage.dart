import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        actions: const [],
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: const [
            ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                  "https://i.ibb.co/PGv8ZzG/me.jpg",
                ),
              ),
              title: Text("John doe"),
              subtitle: Text("john.doe@gmail.com"),
              trailing: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.add,
                  size: 24.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
