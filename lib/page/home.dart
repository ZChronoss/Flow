import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) => Scaffold(
    body:
    SafeArea(
      child: Container(
        color: const Color.fromRGBO(32, 33, 36, 1.0),
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(left: 35, right: 35),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Hello Ronaldo!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 15),
                  child: Center(
                    child: Column(
                      children: [
                        const Text(
                          'Your current task is',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        Card(
                          color: const Color.fromRGBO(212, 1, 1, 1.0),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: Container(
                            padding: EdgeInsets.all(20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Software Making',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'A1103',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                      ),
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    Icon(
                                      Icons.circle_outlined,
                                      size: 40,
                                      color: Colors.white,
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Your reminder',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                      Icon(
                        Icons.add_box_outlined,
                        size: 25,
                        color: Colors.grey,
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Charge your phone'),
                          Icon(
                            Icons.keyboard_arrow_down,
                            size: 25,
                            color: Colors.black,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 3),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Charge your phone'),
                          Icon(
                            Icons.keyboard_arrow_down,
                            size: 25,
                            color: Colors.black,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 3),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Charge your phone'),
                          Icon(
                            Icons.keyboard_arrow_down,
                            size: 25,
                            color: Colors.black,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 3),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Charge your phone'),
                          Icon(
                            Icons.keyboard_arrow_down,
                            size: 25,
                            color: Colors.black,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 15),
                  child: const Text(
                    'Your toolbox',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Aksi yang ingin dilakukan ketika tombol "Notes" ditekan
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("✏️"),
                            const SizedBox(
                              height: 40,
                              width: 100,
                            ),
                            const Text(
                              'Notes',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 25),
                            )
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          primary: const Color.fromRGBO(253, 248, 192, 1.0),
                          padding: const EdgeInsets.all(20),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Aksi yang ingin dilakukan ketika tombol "Tasks" ditekan
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("📘"),
                            const SizedBox(
                              height: 40,
                              width: 100,
                            ),
                            const Text(
                              'Tasks',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 25),
                            )
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          primary: const Color.fromRGBO(152, 199, 234, 1.0),
                          padding: const EdgeInsets.all(20),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Aksi yang ingin dilakukan ketika tombol "Focus" ditekan
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("🔮"),
                            const SizedBox(
                              height: 40,
                              width: 100,
                            ),
                            const Text(
                              'Focus',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 25),
                            )
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          primary: const Color.fromRGBO(225, 164, 231, 1.0),
                          padding: const EdgeInsets.all(20),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 300,
                ),
              ],
            ),
          ),
        ),
      ),
    )
  );
}