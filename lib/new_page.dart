import 'package:flutter/material.dart';
import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class NewPage extends StatefulWidget {
  const NewPage({Key? key}) : super(key: key);

  @override
  State<NewPage> createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> with TickerProviderStateMixin {
  late AnimationController controller;
  // SEQUENCEANIMATION paket kurulumu farklıdır lütfen pubspec.yaml alanına göz atınız.

  late SequenceAnimation sequenceAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(vsync: this);
    sequenceAnimation = SequenceAnimationBuilder()
        .addAnimatable(
            animatable: Tween<double>(begin: 0, end: 1),
            from: Duration.zero,
            to: const Duration(milliseconds: 400),
            tag: "opacity")
        .addAnimatable(
            animatable: Tween<double>(begin: 80, end: 120),
            from: const Duration(milliseconds: 400),
            to: const Duration(milliseconds: 800),
            tag: "width")
        .addAnimatable(
            animatable: Tween<double>(begin: 80, end: 120),
            from: const Duration(milliseconds: 800),
            to: const Duration(seconds: 1),
            tag: "height")
        .addAnimatable(
            animatable: Tween<double>(begin: 0, end: 20),
            from: const Duration(seconds: 1),
            to: const Duration(seconds: 2),
            tag: 'borderRadius')
        .addAnimatable(
            animatable:
                ColorTween(begin: Colors.white, end: const Color(0xff021212)),
            from: const Duration(seconds: 0),
            to: const Duration(seconds: 4),
            tag: "linearColor")
        .addAnimatable(
            animatable:
                ColorTween(begin: Colors.white, end: const Color(0xff020202)),
            from: const Duration(seconds: 0),
            to: const Duration(seconds: 1),
            tag: "linearColor2")
        .addAnimatable(
          animatable: EdgeInsetsTween(
              begin: const EdgeInsets.only(bottom: 15),
              end: const EdgeInsets.only(bottom: 75)),
          from: const Duration(seconds: 3),
          to: const Duration(seconds: 4),
          tag: "padding",
          curve: Curves.easeInBack,
        )
        .addAnimatable(
            animatable:
                AlignmentTween(begin: Alignment(-1, -1), end: Alignment(0, 0)),
            from: const Duration(seconds: 0),
            to: const Duration(seconds: 2),
            tag: "alignment")
        .animate(controller);
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          return Scaffold(
            backgroundColor: sequenceAnimation["linearColor2"].value,
            appBar: AppBar(),
            body: Opacity(
              opacity: sequenceAnimation["opacity"].value,
              child: Padding(
                padding: sequenceAnimation["padding"].value,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(
                              sequenceAnimation["borderRadius"].value),
                          child: Container(
                              decoration: BoxDecoration(
                                color: sequenceAnimation["linearColor"].value,
                              ),
                              width: sequenceAnimation["width"].value,
                              height: sequenceAnimation["height"].value,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: const [
                                    Text("Profil",
                                        style: TextStyle(
                                          color: Colors.white,
                                        )),
                                    Icon(Icons.person,
                                        color: Colors.white, size: 38),
                                  ],
                                ),
                              )),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(
                              sequenceAnimation["borderRadius"].value),
                          child: Container(
                              decoration: BoxDecoration(
                                color: sequenceAnimation["linearColor"].value,
                              ),
                              width: sequenceAnimation["width"].value,
                              height: sequenceAnimation["height"].value,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: const [
                                    Text("Profili \t düzenle",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                        )),
                                    Icon(Icons.edit_note_rounded,
                                        color: Colors.white, size: 38),
                                  ],
                                ),
                              )),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(
                              sequenceAnimation["borderRadius"].value),
                          child: Container(
                              decoration: BoxDecoration(
                                color: sequenceAnimation["linearColor"].value,
                              ),
                              width: sequenceAnimation["width"].value,
                              height: sequenceAnimation["height"].value,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: const [
                                    Text("Statüler",
                                        style: TextStyle(
                                          color: Colors.white,
                                        )),
                                    Icon(Icons.star_border_purple500_rounded,
                                        color: Colors.white, size: 38),
                                  ],
                                ),
                              )),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(
                              sequenceAnimation["borderRadius"].value),
                          child: Container(
                              decoration: BoxDecoration(
                                color: sequenceAnimation["linearColor"].value,
                              ),
                              width: sequenceAnimation["width"].value,
                              height: sequenceAnimation["height"].value,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: const [
                                    Text("Güvenlik",
                                        style: TextStyle(
                                          color: Colors.white,
                                        )),
                                    Icon(Icons.security_rounded,
                                        color: Colors.white, size: 38),
                                  ],
                                ),
                              )),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(
                              sequenceAnimation["borderRadius"].value),
                          child: Container(
                              decoration: BoxDecoration(
                                color: sequenceAnimation["linearColor"].value,
                              ),
                              width: sequenceAnimation["width"].value,
                              height: sequenceAnimation["height"].value,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: const [
                                    Text("Ana Sayfa",
                                        style: TextStyle(
                                          color: Colors.white,
                                        )),
                                    Icon(Icons.home,
                                        color: Colors.white, size: 38),
                                  ],
                                ),
                              )),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(
                              sequenceAnimation["borderRadius"].value),
                          child: Container(
                              decoration: BoxDecoration(
                                color: sequenceAnimation["linearColor"].value,
                              ),
                              width: sequenceAnimation["width"].value,
                              height: sequenceAnimation["height"].value,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: const [
                                    Text("Sohbet",
                                        style: TextStyle(
                                          color: Colors.white,
                                        )),
                                    Icon(Icons.chat_sharp,
                                        color: Colors.white, size: 38),
                                  ],
                                ),
                              )),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(
                              sequenceAnimation["borderRadius"].value),
                          child: Container(
                              decoration: BoxDecoration(
                                color: sequenceAnimation["linearColor"].value,
                              ),
                              width: sequenceAnimation["width"].value,
                              height: sequenceAnimation["height"].value,
                              child: Center(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: const [
                                    FittedBox(
                                      child: Text("Kaydet",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.white,
                                          )),
                                    ),
                                    Icon(FeatherIcons.paperclip,
                                        color: Colors.white, size: 38),
                                  ],
                                ),
                              )),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(
                              sequenceAnimation["borderRadius"].value),
                          child: Container(
                              decoration: BoxDecoration(
                                color: sequenceAnimation["linearColor"].value,
                              ),
                              width: sequenceAnimation["width"].value,
                              height: sequenceAnimation["height"].value,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: const [
                                    Text("Çıkış Yap",
                                        style: TextStyle(
                                          color: Colors.white,
                                        )),
                                    Icon(FeatherIcons.chevronRight,
                                        color: Colors.white, size: 38),
                                  ],
                                ),
                              )),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
