import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/utils.dart';

class ContactCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String value;
  final VoidCallback? onTap;
  final VoidCallback? onCopy;

  const ContactCard({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
    this.onTap,
    this.onCopy,
  });

  @override
  State<ContactCard> createState() => _ContactCardState();
}

class _ContactCardState extends State<ContactCard> {
  bool hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => hover = true),
      onExit: (_) => setState(() => hover = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: 240,
          padding: const EdgeInsets.all(24),
          decoration: AppDecorations.glassCard(
            borderColor: hover
                ? AppColors.primary.withValues(alpha: 0.6)
                : null,
            glow: hover,
          ),
          transform: Matrix4.identity()..scale(hover ? 1.03 : 1.0),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  gradient: AppColors.gradientPrimary,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(widget.icon, size: 24, color: Colors.white),
              ),
              const SizedBox(height: 14),
              Text(
                widget.title,
                style: GoogleFonts.inter(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                widget.value,
                style: GoogleFonts.inter(
                  color: AppColors.textSecondary,
                  fontSize: 13,
                ),
                textAlign: TextAlign.center,
              ),
              if (widget.onCopy != null) ...[
                const SizedBox(height: 10),
                TextButton.icon(
                  onPressed: widget.onCopy,
                  icon: const Icon(Icons.copy, size: 16),
                  label: const Text('Copier'),
                  style: TextButton.styleFrom(
                    foregroundColor: AppColors.primaryLight,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
