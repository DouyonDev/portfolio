import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/core/data/portfolio_data.dart';
import 'package:portfolio/utils.dart';

class EducationItem extends StatefulWidget {
  final EducationEntry entry;
  final bool isLast;

  const EducationItem({
    super.key,
    required this.entry,
    this.isLast = false,
  });

  @override
  State<EducationItem> createState() => _EducationItemState();
}

class _EducationItemState extends State<EducationItem> {
  bool hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => hover = true),
      onExit: (_) => setState(() => hover = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        margin: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    gradient: hover ? AppColors.gradientPrimary : null,
                    color: hover ? null : AppColors.surfaceLight,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: hover ? AppColors.primary : AppColors.cardBorder,
                    ),
                  ),
                  child: Icon(
                    widget.entry.icon,
                    color: hover ? Colors.white : AppColors.primaryLight,
                    size: 20,
                  ),
                ),
                if (!widget.isLast)
                  Container(
                    width: 2,
                    height: 80,
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          AppColors.primary.withValues(alpha: 0.5),
                          AppColors.cardBorder.withValues(alpha: 0.2),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(width: 20),
            Expanded(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                padding: const EdgeInsets.all(20),
                decoration: AppDecorations.glassCard(
                  borderColor: hover
                      ? AppColors.primary.withValues(alpha: 0.6)
                      : null,
                  glow: hover,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            widget.entry.title,
                            style: GoogleFonts.inter(
                              color: AppColors.textPrimary,
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.primary.withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            widget.entry.period,
                            style: GoogleFonts.inter(
                              color: AppColors.primaryLight,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(
                      widget.entry.institution,
                      style: GoogleFonts.inter(
                        color: AppColors.secondary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
