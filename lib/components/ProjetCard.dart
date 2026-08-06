import 'package:flutter/material.dart';

class ProjectCard extends StatefulWidget {
  final String title;
  final String description;
  final List<String> tech;
  final String image;

  ProjectCard({
    required this.title,
    required this.description,
    required this.tech,
    required this.image,
  });

  @override
  _ProjectCardState createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => hover = true),
      onExit: (_) => setState(() => hover = false),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        width: 320,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white10,
          border: Border.all(
            color: hover ? Colors.blue : Colors.white24,
          ),
          boxShadow: hover
              ? [
            BoxShadow(
              color: Colors.blue.withOpacity(0.3),
              blurRadius: 25,
            )
          ]
              : [],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// IMAGE PROJET
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              child: Stack(
                children: [
                  Image.asset(
                    widget.image,
                    height: 180,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),

                  /// OVERLAY HOVER
                  AnimatedOpacity(
                    duration: Duration(milliseconds: 300),
                    opacity: hover ? 1 : 0,
                    child: Container(
                      height: 180,
                      color: Colors.black.withOpacity(0.6),
                      child: Center(
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text("Voir plus"),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            /// CONTENU
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    widget.title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 10),

                  Text(
                    widget.description,
                    style: TextStyle(color: Colors.white70),
                  ),

                  SizedBox(height: 15),

                  /// TECHNOLOGIES
                  Wrap(
                    spacing: 8,
                    children: widget.tech.map((tech) {
                      return Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: Colors.blue.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          tech,
                          style: TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 12,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}