import 'package:flutter/material.dart';
import 'package:portfolio/utils.dart';

class AnimatedProfileImage extends StatefulWidget {
  @override
  _AnimatedProfileImageState createState() =>
      _AnimatedProfileImageState();
}

class _AnimatedProfileImageState extends State<AnimatedProfileImage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scale;
  late Animation<double> fade;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );

    scale = Tween<double>(begin: 0.8, end: 1).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeOutBack),
    );

    fade = Tween<double>(begin: 0, end: 1).animate(controller);

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: fade,
      child: ScaleTransition(
        scale: scale,
        child: Stack(
          alignment: Alignment.center,
          children: [

            /// EFFET GLOW (lumière)
            Container(
              width: 260,
              height: 260,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.6),
                    blurRadius: 40,
                    spreadRadius: 10,
                  ),
                ],
              ),
            ),

            /// IMAGE PROFIL
            CircleAvatar(
              radius: 120,
              backgroundImage: AssetImage("assets/profil.jpg"),
            ),
          ],
        ),
      ),
    );
  }
}