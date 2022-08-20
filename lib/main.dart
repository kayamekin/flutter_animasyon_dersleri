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
  // tween başlangıç ve bitiş değerleri üretir (başlangıç , bitiş) ,, ve curve mevcut curve easeInOut gibi alanlara hükmeder.
  late Animation animations2;
  // animation 3 curve için
  late Animation animations3;

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
    animations =
        ColorTween(begin: Colors.red, end: Colors.blue).animate(controller);
    animations2 = AlignmentTween(begin: Alignment(-1, -1), end: Alignment(1, 1))
        .animate(controller);
    animations3 = CurvedAnimation(parent: controller, curve: Curves.bounceIn);

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
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Hero(
          tag: 'logo',
          child: FlutterLogo(
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
        Text("you have pushed never problem yes solved",
            style: TextStyle(fontSize: animations3.value * 36)),
        ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => NewPage()));
            },
            child: Text("hello widget")),
      ])),
    );
  }
}
