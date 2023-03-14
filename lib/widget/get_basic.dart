// ignore_for_file: unnecessary_const

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GetBasic extends StatefulWidget {
  const GetBasic({super.key});

  @override
  State<GetBasic> createState() => _GetBasicState();
}

class _GetBasicState extends State<GetBasic> {
  // late String body; /// komen dlu karena ini mengambil data body nya
  late String id;
  late String email;
  late String name;

  @override
  void initState() {
    /// body = "belum ada data";
    id = "";
    email = "";
    name = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Get API Basic"),
        actions: const [],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "ID = $id",
              style: const TextStyle(
                fontSize: 14.0,
              ),
            ),
            Text(
              "Email = $email",
              style: const TextStyle(
                fontSize: 14.0,
              ),
            ),
            Text(
              "Nama = $name",
              style: const TextStyle(
                fontSize: 14.0,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              child: const Text(
                "GET DATA",
                style: TextStyle(
                  fontSize: 14.0,
                ),
              ),
              onPressed: () async {
                // ignore: unused_local_variable
                var myrespone =
                    await http.get(Uri.parse("https://reqres.in/api/users/2"));
                if (myrespone.statusCode == 200) {
                  //berhasil get data
                  print("berhasil");
                  Map<String, dynamic> data = json.decode(myrespone.body);
                  print(data["data"]);
                  setState(() {
                    // body = myrespone.body;
                    // body = data["data"]["email"].toString();
                    id = data["data"]["id"].toString();
                    email = data["data"]["subkh4n"].toString();
                    name =
                        "${data["data"]["first_name"]} ${data["data"]["last_name"]}";
                  });
                } else {
                  print("error ${myrespone.statusCode}");
                  // setState(() {
                  //   body = "error ${myrespone.statusCode}";
                  // });
                }

                // print(myrespone.statusCode); //ini berupa object
                // print("-------------------------"); //ini berupa object
                // print(myrespone.body); //ini berupa object
              },
            ),
          ],
        ),
      ),
    );
  }
}
