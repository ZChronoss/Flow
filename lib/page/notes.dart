import 'package:flutter/material.dart';

class Notes extends StatefulWidget {
  const Notes({super.key});

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  @override
  Widget build(BuildContext context) => Scaffold(
    body: SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.only(left: 35, right: 35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: GridView.builder(
                shrinkWrap: true,
                itemCount: 7,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (ctx, i) {
                  return Card(
                    color: Colors.grey,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                    child: Container(
                      height: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                      color: const Color.fromRGBO(56, 56, 56, 1.0)),
                      margin: const EdgeInsets.all(1),
                      padding: const EdgeInsets.all(5),
                      child: Stack(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                'Industrial Society and Its Future',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white
                                ),
                              ),
                              Container(margin: EdgeInsets.only(bottom: 5),),
                              Flexible(
                                child: Text(
                                'INTRODUCTION\n1. The Industrial Revolution and its consequences have been a disaster for the human race. They have greatly increased the life-expectancy of those of us who live in...',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Color.fromRGBO(182, 182, 182, 1.0)
                                ),
                                // maxLines: 10,
                              ),)
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.0,
                  crossAxisSpacing: 0.0,
                  mainAxisSpacing: 5,
                  mainAxisExtent: 204,
                ),
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