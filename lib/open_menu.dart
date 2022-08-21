import 'package:flutter/material.dart';
import 'package:flutter_animasyonlar/new_page.dart';

class OpenMenuButtonPage extends StatelessWidget {
  const OpenMenuButtonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("animation page")),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => NewPage()));
            },
            child: Text("Animasyonlu sayfaya geç")),
      ),
    );
  }
}
