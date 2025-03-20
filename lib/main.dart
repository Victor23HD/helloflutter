import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(title: Text("Home")),
        body: ListView(
          children: [
            Task(
              "Aprender IA",
              "https://cdn-icons-png.flaticon.com/512/2111/2111122.png",
              3,
            ),
            Task(
              "Aprender a programar",
              "https://cdn-icons-png.flaticon.com/512/1995/1995515.png",
              5,
            ),
            Task(
              "Aprender a cozinhar",
              "https://cdn-icons-png.flaticon.com/512/1830/1830839.png",
              4,
            ),
            Task(
              "Aprender a dirigir",
              "https://cdn-icons-png.flaticon.com/512/4669/4669518.png",
              3,
            ),
            Task(
              "Aprender a desenhar",
              "https://cdn-icons-png.flaticon.com/512/4335/4335667.png",
              2,
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {}),
      ),
    );
  }
}

class Task extends StatefulWidget {
  final String name;
  final String foto;
  final int stars;
  const Task(this.name, this.foto, this.stars, {Key? key}) : super(key: key);

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int nivel = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Stack(
          children: [
            Container(
              height: 140,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Colors.blue,
              ),
            ),

            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black26,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        width: 72,
                        height: 100,
                        child: Image.network(widget.foto, fit: BoxFit.contain),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 200,
                              child: Text(
                                widget.name,
                                style: TextStyle(
                                  fontSize: 18,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            Widget_Stars(widget.stars),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Container(
                          height: 46,
                          width: 72,
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                if (nivel != 10) {
                                  nivel++;
                                }
                              });
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Icon(Icons.keyboard_arrow_up_outlined),
                                Text("UP", style: TextStyle(fontSize: 12)),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Container(
                        width: 200,
                        child: LinearProgressIndicator(
                          color: Colors.white,
                          value: nivel / 10,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        child: Text(
                          "Nivel: ${nivel}",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Widget_Stars extends StatefulWidget {
  final int stars;
  const Widget_Stars(this.stars, {Key? key}) : super(key: key);

  @override
  State<Widget_Stars> createState() => _Widget_StarsState();
}

class _Widget_StarsState extends State<Widget_Stars> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(5, (index) {
        return Icon(
          Icons.star,
          size: 16,
          color: index < widget.stars ? Colors.blue : Colors.blue[100],
        );
      }),
    );
  }
}
