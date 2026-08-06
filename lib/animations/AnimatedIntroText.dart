import 'package:flutter/material.dart';
import 'package:portfolio/utils.dart';

class AnimatedIntroText extends StatefulWidget {
  @override
  _AnimatedIntroTextState createState() => _AnimatedIntroTextState();
}

class _AnimatedIntroTextState extends State<AnimatedIntroText>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> slide;
  late Animation<double> fade;

  String fullText =
      "Bonjour, je suis Abdoulaye Douyon\n"
      "Développeur Flutter & Technicien Informatique\n\n"
      "Je conçois des applications et systèmes informatiques "
      "pour améliorer la gestion et la performance des organisations.";

  String visibleText = "";

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1200),
    );

    slide = Tween<Offset>(
      begin: Offset(-0.5, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));

    fade = Tween<double>(begin: 0, end: 1).animate(controller);

    controller.forward();

    /// Effet machine à écrire
    typeWriterEffect();
  }

  void typeWriterEffect() async {
    for (int i = 0; i < fullText.length; i++) {
      await Future.delayed(Duration(milliseconds: 15));
      setState(() {
        visibleText = fullText.substring(0, i + 1);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: fade,
      child: SlideTransition(
        position: slide,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// TITRE
            Text(
              "Développeur Flutter",
              style: TextStyle(
                fontSize: 42,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            SizedBox(height: 20),

            /// TEXTE ANIMÉ
            Text(
              visibleText,
              style: TextStyle(
                color: Colors.white70,
                fontSize: 16,
              ),
            ),

            SizedBox(height: 30),

            /// BOUTONS
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Voir mes projets"),
                ),
                SizedBox(width: 20),
                OutlinedButton(
                  onPressed: () {},
                  child: Text("Me contacter"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}