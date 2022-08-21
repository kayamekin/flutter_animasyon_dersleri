import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animasyonlar/new_page.dart';
import 'package:flutter_animasyonlar/open_menu.dart';

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
      // home: const MyHomePage(title: 'Animation'),
      home: const OpenMenuButtonPage(),
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
  // tween başlangıç ve bitiş değerleri üretir (başlangıç , bitiş) ,, ve curve mevcut curve easeInOut gibi alanlara hükmeder.
  late Animation animations2;
  // animation 3 curve için
  late Animation animations3;
  late Animation<double> animation4;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    // lowerBound ve UpperBound normalde buraya yazılmaz animasyonlar içerisine yazılmaktadır.

    controller.addListener(() {
      setState(() {
        // değer yazmayabiliriz. set state yazılmak zorundadır. set state ile animasyon belirecektir.
        // debugPrint(controller.value.toString());
        // debugPrint(animations.value.toString());
      });
    });

    // kod buraya gelecek
    // animasyon işlemi
    animations = ColorTween(begin: Colors.red, end: Colors.blue)
        .animate(CurvedAnimation(parent: controller, curve: Curves.decelerate));
    animations2 = AlignmentTween(begin: Alignment(-1, -1), end: Alignment(1, 1))
        .animate(
            CurvedAnimation(parent: controller, curve: Curves.easeInOutExpo));
    animations3 =
        CurvedAnimation(parent: controller, curve: Curves.easeInOutExpo);
    animation4 = Tween<double>(begin: 0, end: 2 * pi).animate(controller);
    // controller.reverse(from: 100);
    controller.forward();
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      }
      if (status == AnimationStatus.dismissed) {
        controller.forward().orCancel;
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
      backgroundColor: animations.value,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
            const Hero(
              tag: 'logo',
              child: FlutterLogo(
                duration: Duration(seconds: 2),
                size: 200,
                textColor: Colors.red,
              ),
            ),
            Container(
              width: 480,
              height: 200,
              // height: 200,
              alignment: animations2.value,
              child: Text(
                '$counter',
                style: TextStyle(fontSize: controller.value + 20),
              ),
            ),
            Text("you have pushed never problem",
                style: TextStyle(fontSize: animations3.value * 20)),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const OpenMenuButtonPage()));
                },
                child: Text("Menu Alanını aç")),
            AnimatedBuilder(
                animation: animation4,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Card(
                    color: Colors.red,
                    child: Container(
                      width: 50,
                      height: 50,
                      child: const Center(
                        child: Text("hello",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                ),
                builder: (context, child) {
                  return Transform.rotate(
                      angle: animation4.value, child: child);
                })
          ])),
    );
  }
}
