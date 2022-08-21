import 'package:flutter/material.dart';
import 'package:flutter_animasyonlar/animatedcontainerkullanimi.dart';
import 'package:flutter_animasyonlar/new_page.dart';

class OpenMenuButtonPage extends StatelessWidget {
  const OpenMenuButtonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("animation page")),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => NewPage()));
                },
                child: Text("Animasyonlu sayfaya geç")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AnimasyonluWidgetlar()));
                },
                child: Text("Animated Container Kullanımı")),
          ],
        ),
      ),
    );
  }
}
