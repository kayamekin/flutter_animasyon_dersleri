import 'package:flutter/material.dart';
import 'package:flutter_animasyonlar/new_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animation',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const MyHomePage(title: 'Animation'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  int counter = 0;
  late AnimationController controller;
  late Animation animations;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 200),
        lowerBound: 0,
        upperBound: 100);
    // lowerBound ve UpperBound normalde buraya yazılmaz animasyonlar içerisine yazılmaktadır.
    controller.addListener(() {
      setState(() {
        // değer yazmayabiliriz. set state yazılmak zorundadır. set state ile animasyon belirecektir.
        debugPrint(controller.value.toString());
      });
    });
    // kod buraya gelecek
    controller.forward(from: 20);
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      }
      if (status == AnimationStatus.dismissed) {
        // controller.forward();
      }
      // debugPrint("durum" + status.toString());
    });
  }

  @override
  void dispose() {
    controller.dispose();
    // kod buraya gelecek
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: Column(children: [
        const Hero(
          tag: 'logo',
          child: FlutterLogo(
            size: 200,
          ),
        ),
        ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => NewPage()));
            },
            child: Text("hello widget")),
        Text(
          '$counter',
          style: TextStyle(fontSize: controller.value + 20),
        ),
      ])),
    );
  }
}
