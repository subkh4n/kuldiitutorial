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
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            const SizedBox(
              height: 20.0,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              controller: ScrollController(),
              child: Row(
                children: List.generate(
                  10,
                  (index) {
                    var item = {};
                    bool selected = index == 0;

                    return Container(
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
                          "Menu ${index + 1}",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10.0,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            const ListTile(
              title: Text("John doe"),
              trailing: Icon(
                Icons.chevron_right,
                size: 24.0,
              ),
            ),
            const ListTile(
              leading: Icon(Icons.share),
              minLeadingWidth: 0.0,
              title: Text("John doe"),
              trailing: SizedBox(
                width: 50,
                child: Icon(
                  Icons.chevron_right,
                  size: 24.0,
                ),
              ),
            ),
            ListView.separated(
              itemCount: 3,
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              separatorBuilder: (BuildContext context, int index) {
                return Container(
                  height: 4.0,
                );
              },
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.grey[200],
                      backgroundImage: const NetworkImage(
                        "https://i.ibb.co/k15qWF7/photo-1487412720507-e7ab37603c6f-ixlib-rb-4-0.jpg",
                      ),
                    ),
                    title: const Text("Jessica Doe"),
                    subtitle: const Text("Programmer"),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
