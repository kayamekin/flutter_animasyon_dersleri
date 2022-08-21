import 'package:flutter/material.dart';
import 'package:flutter_animasyonlar/main.dart';

class AnimasyonluWidgetlar extends StatefulWidget {
  const AnimasyonluWidgetlar({Key? key}) : super(key: key);

  @override
  State<AnimasyonluWidgetlar> createState() => _AnimasyonluWidgetlarState();
}

class _AnimasyonluWidgetlarState extends State<AnimasyonluWidgetlar> {
  var color = Colors.white;
  var width = 0.0;
  var height = 0.0;
  bool degistir = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("animasyonlu widgetlar"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              onPressed: () {
                _animatedContainerAnimasyon();
              },
              child: Text("animated Container"),
            ),
            const Text("sadece home simgesi olan butona tıklayınız"),
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: width,
              height: height,
              decoration: BoxDecoration(
                  color: color,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  ),
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(2, 2),
                      color: Colors.black,
                      blurRadius: 50,
                    )
                  ]),
              child: Column(
                children: [
                  FittedBox(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.24,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20),
                        ),
                        color: Colors.red,
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/images/add.jpg',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  FittedBox(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.person,
                                    color: Colors.white, size: 44),
                                onPressed: () {},
                              ),
                              IconButton(
                                icon: const Icon(Icons.edit,
                                    color: Colors.white, size: 44),
                                onPressed: () {},
                              ),
                              IconButton(
                                icon: const Icon(Icons.note_alt_outlined,
                                    color: Colors.white, size: 44),
                                onPressed: () {},
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              IconButton(
                                splashColor: Colors.amber,
                                icon: const Icon(Icons.home,
                                    color: Colors.white, size: 44),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const MyHomePage(
                                                title: "home page",
                                              )));
                                },
                              ),
                              IconButton(
                                icon: const Icon(Icons.paypal_sharp,
                                    color: Colors.white, size: 44),
                                onPressed: () {},
                              ),
                              IconButton(
                                icon: const Icon(Icons.settings,
                                    color: Colors.white, size: 44),
                                onPressed: () {},
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _animatedContainerAnimasyon() {
    setState(() {
      width = width == 0.0 ? 300 : 0;
      height = height == 0.0 ? 300 : 0;
      color = color == Colors.white ? Color(0xff020202) : Colors.white;
    });
  }
}
