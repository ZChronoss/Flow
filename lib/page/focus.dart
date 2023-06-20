import 'package:flutter/material.dart';

class FocusPage extends StatefulWidget {
  const FocusPage({super.key});

  @override
  State<FocusPage> createState() => _FocusPageState();
}

class _FocusPageState extends State<FocusPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
        leading: Image.asset(
          'assets/fcs.png',
          height: 50,
        ),
        actions: [
          IconButton(
              icon: const Icon(
                Icons.menu,
                color: Color.fromRGBO(155, 160, 165, 1.0),
              ),
              onPressed: () {})
        ],
        title: TextButton(
          onPressed: () {},
          style: ButtonStyle(
              backgroundColor: const MaterialStatePropertyAll(
                Color.fromRGBO(238, 238, 238, 1.0),
              ),
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0)))),
          child: const Text('Apps Whitelist'),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: const Color.fromRGBO(32, 33, 36, 1.0),
      ),
    body: SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.only(left: 35, right: 35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 40),
              child: Center(
                child: Column(
                  children: [
                    TextButton(
                        style: ButtonStyle(
                            backgroundColor: const MaterialStatePropertyAll(
                              Color.fromRGBO(63, 63, 63, 1.0),
                            ),
                            shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(50.0))),
                            maximumSize: const MaterialStatePropertyAll(
                                Size(230, 40))),
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                                backgroundColor:
                                    Color.fromRGBO(41, 41, 41, 1.0),
                                child: Icon(
                                  Icons.play_arrow,
                                  color: Color.fromRGBO(159, 32, 239, 1.0),
                                )),
                            Text(
                              'Rain sounds in the woods...',
                              style: TextStyle(
                                color: Color.fromRGBO(132, 132, 132, 1.0),
                              ),
                            ),
                          ],
                        )),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Image.asset('assets/fcs2.png'),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Column(
                children: [
                  TextButton.icon(
                    onPressed: () {},
                    icon: Image.asset(
                      'assets/ellipse.png',
                      height: 10,
                    ),
                    label: const Text(
                      'Study',
                      style: TextStyle(
                        color: Color.fromRGBO(253, 253, 253, 1.0),
                      ),
                    ),
                    style: ButtonStyle(
                        backgroundColor: const MaterialStatePropertyAll(
                          Color.fromRGBO(63, 63, 63, 1.0),
                        ),
                        shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0)))),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    '30:00',
                    style: TextStyle(
                        color: Color.fromRGBO(253, 253, 253, 1.0),
                        fontSize: 70,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor: const MaterialStatePropertyAll(
                          Color.fromRGBO(159, 32, 239, 1.0),
                        ),
                        minimumSize:
                            const MaterialStatePropertyAll(Size(150, 50)),
                        shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)))),
                    child: const Text(
                      'Start',
                      style: TextStyle(
                          color: Color.fromRGBO(253, 253, 253, 1.0),
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
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
  );
}