import 'package:flutter/material.dart';

class AppColors {
  static const primary = Color(0xFF6366F1);
  static const primaryLight = Color(0xFF818CF8);
  static const secondary = Color(0xFF06B6D4);
  static const accent = Color(0xFF22D3EE);
  static const background = Color(0xFF030712);
  static const surface = Color(0xFF0F172A);
  static const surfaceLight = Color(0xFF1E293B);
  static const cardBorder = Color(0xFF334155);
  static const textPrimary = Color(0xFFF8FAFC);
  static const textSecondary = Color(0xFF94A3B8);
  static const success = Color(0xFF10B981);
  static const warning = Color(0xFFF59E0B);

  static const gradientPrimary = LinearGradient(
    colors: [Color(0xFF6366F1), Color(0xFF06B6D4)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const gradientHero = LinearGradient(
    colors: [Color(0xFF6366F1), Color(0xFF8B5CF6), Color(0xFF06B6D4)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const gradientCard = LinearGradient(
    colors: [Color(0x1A6366F1), Color(0x0D06B6D4)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}

class AppDecorations {
  static BoxDecoration glassCard({Color? borderColor, bool glow = false}) {
    return BoxDecoration(
      gradient: AppColors.gradientCard,
      borderRadius: BorderRadius.circular(20),
      border: Border.all(
        color: borderColor ?? AppColors.cardBorder.withValues(alpha: 0.5),
      ),
      boxShadow: glow
          ? [
              BoxShadow(
                color: AppColors.primary.withValues(alpha: 0.15),
                blurRadius: 30,
                spreadRadius: 0,
              ),
            ]
          : null,
    );
  }
}
