import 'package:flutter/material.dart';

class SkillModel {
  final IconData icon;
  final String title;
  final List<String> items;
  final Color color;

  SkillModel(this.icon, this.title, this.items, this.color);
}

final skillList = [
  SkillModel(Icons.web, 'Développement Web', [
    'HTML / CSS / JavaScript',
    'Conception de sites web',
    'Responsive Design',
    'Access & MySQL',
  ], const Color(0xFF6366F1)),
  SkillModel(Icons.phone_android, 'Développement Mobile', [
    'Flutter & Dart',
    'Firebase',
    'UI/UX moderne',
    'Applications cross-platform',
  ], const Color(0xFF06B6D4)),
  SkillModel(Icons.dns, 'Backend & Données', [
    'Java (Spring Boot)',
    'MySQL & Firebase',
    'API REST',
    'Gestion de bases de données',
  ], const Color(0xFF8B5CF6)),
  SkillModel(Icons.computer, 'Systèmes & Réseaux', [
    'Maintenance informatique',
    'Installation & configuration réseau',
    'Certification Cisco ITE',
    'Support technique',
  ], const Color(0xFF10B981)),
  SkillModel(Icons.psychology, 'Qualités professionnelles', [
    'Rigueur & Autonomie',
    'Capacité d\'analyse',
    'Adaptabilité',
    'Esprit d\'équipe',
  ], const Color(0xFFF59E0B)),
];
