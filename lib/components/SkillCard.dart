import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/utils.dart';

class SkillCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final List<String> items;
  final Color color;

  const SkillCard({
    super.key,
    required this.icon,
    required this.title,
    required this.items,
    this.color = AppColors.primary,
  });

  @override
  State<SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<SkillCard> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHover = true),
      onExit: (_) => setState(() => isHover = false),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 400),
        padding: EdgeInsets.all(25),
        width: 260,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: isHover
                ? [widget.color.withValues(alpha: 0.25), AppColors.surface]
                : [AppColors.surfaceLight.withValues(alpha: 0.5), AppColors.surface],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          border: Border.all(
            color: isHover ? widget.color : AppColors.cardBorder,
          ),
          boxShadow: isHover
              ? [
                  BoxShadow(
                    color: widget.color.withValues(alpha: 0.3),
                    blurRadius: 25,
                  ),
                ]
              : [],
        ),

        transform: Matrix4.identity()
          ..scale(isHover ? 1.05 : 1.0),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// ICON + TITRE
            Row(
              children: [
                Icon(widget.icon, color: widget.color, size: 30),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    widget.title,
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 20),

            /// LISTE
            ...widget.items.map((e) => Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Row(
                children: [
                  Icon(Icons.check_circle,
                      size: 16, color: widget.color),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      e,
                      style: GoogleFonts.inter(color: AppColors.textSecondary),
                    ),
                  ),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}