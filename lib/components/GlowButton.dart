import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class GlowButton extends StatefulWidget {
  @override
  _GlowButtonState createState() => _GlowButtonState();
}

class _GlowButtonState extends State<GlowButton>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..repeat(reverse: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.blue.withOpacity(controller.value),
                blurRadius: 20,
                spreadRadius: 2,
              )
            ],
          ),
          child: ElevatedButton(
            onPressed: () async {
              await launchUrl(
                  Uri.parse("mailto:abdoulayedouyon.ad@gmail.com"));
            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(
                  horizontal: 40, vertical: 18),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: Text("Me contacter maintenant"),
          ),
        );
      },
    );
  }
}