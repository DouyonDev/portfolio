import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/core/data/portfolio_data.dart';
import 'package:portfolio/utils.dart';

class TechSkillBar extends StatefulWidget {
  final TechSkill skill;

  const TechSkillBar({super.key, required this.skill});

  @override
  State<TechSkillBar> createState() => _TechSkillBarState();
}

class _TechSkillBarState extends State<TechSkillBar> {
  bool hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => hover = true),
      onExit: (_) => setState(() => hover = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(20),
        decoration: AppDecorations.glassCard(
          borderColor: hover
              ? widget.skill.color.withValues(alpha: 0.5)
              : null,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(widget.skill.icon, color: widget.skill.color, size: 22),
                const SizedBox(width: 10),
                Text(
                  widget.skill.name,
                  style: GoogleFonts.inter(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
                const Spacer(),
                Text(
                  '${(widget.skill.level * 100).toInt()}%',
                  style: GoogleFonts.inter(
                    color: widget.skill.color,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: LinearProgressIndicator(
                value: widget.skill.level,
                minHeight: 8,
                backgroundColor: AppColors.surfaceLight,
                valueColor: AlwaysStoppedAnimation<Color>(widget.skill.color),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InterestCard extends StatefulWidget {
  final InterestEntry interest;

  const InterestCard({super.key, required this.interest});

  @override
  State<InterestCard> createState() => _InterestCardState();
}

class _InterestCardState extends State<InterestCard> {
  bool hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => hover = true),
      onExit: (_) => setState(() => hover = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 220,
        padding: const EdgeInsets.all(24),
        decoration: AppDecorations.glassCard(glow: hover),
        transform: Matrix4.identity()..scale(hover ? 1.05 : 1.0),
        child: Column(
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                gradient: AppColors.gradientPrimary,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(widget.interest.icon, color: Colors.white, size: 28),
            ),
            const SizedBox(height: 16),
            Text(
              widget.interest.label,
              style: GoogleFonts.inter(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              widget.interest.subtitle,
              style: GoogleFonts.inter(
                color: AppColors.textSecondary,
                fontSize: 13,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
