import 'package:flutter/material.dart';
import 'package:kulditutor/widget/get_advance.dart';
import 'package:kulditutor/widget/get_basic.dart';
import 'package:kulditutor/widget/get_tengah.dart';
import 'package:kulditutor/widget/tutor_delete.dart';
import 'package:kulditutor/widget/tutor_faker.dart';
import 'package:kulditutor/widget/tutor_futurebuilder.dart';
import 'package:kulditutor/widget/tutor_model.dart';
import 'package:kulditutor/widget/tutor_post.dart';
import 'package:kulditutor/widget/tutor_put.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> menu = [
    {
      "label": "Get Basic",
      "page": const GetBasic(),
    },
    {
      "label": "Get Menengah",
      "page": const GetTengah(),
    },
    {
      "label": "Get Advanced",
      "page": const GetAdvance(),
    },
    {
      "label": "Tutorial Delete",
      "page": const TutorDelete(),
    },
    {
      "label": "Tutorial Post",
      "page": const TutorPost(),
    },
    {
      "label": "Tutorial Future",
      "page": const TutorFutureBuilder(),
    },
    {
      "label": "Tutorial Put",
      "page": const TutorPut(),
    },
    {
      "label": "Tutorial ModelHttp",
      "page": const TutorModelHttp(),
    },
    {
      "label": "Tutorial Faker",
      "page": const TutorFaker(),
    },
    {
      "label": "Tutorial FutureBuilder",
      "page": const TutorFutureBuilder(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        // actions: [],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Tutorial Kuldii Project",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              controller: ScrollController(),
              child: Row(
                children: menu.asMap().entries.map((entry) {
                  final index = entry.key;
                  final page = entry.value['page']!;
                  final selected = index == 0;

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => page),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12.0,
                        vertical: 8.0,
                      ),
                      margin: const EdgeInsets.only(right: 10.0),
                      decoration: BoxDecoration(
                        color: selected ? Colors.orange : Colors.grey,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(5.0),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          entry.value['label']!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10.0,
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Column(
              children: [
                GridView.builder(
                  padding: EdgeInsets.zero,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1 / 0.28,
                    crossAxisCount: 2,
                    mainAxisSpacing: 6,
                    crossAxisSpacing: 6,
                  ),
                  itemCount: menu.length,
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    var item = menu[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => item["page"]),
                        );
                      },
                      child: Ink(
                        decoration: const BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10.0,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  item["label"],
                                  style: const TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              const Icon(
                                Icons.chevron_right_rounded,
                                size: 24.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
