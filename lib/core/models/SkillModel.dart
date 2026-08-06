import 'package:flutter/material.dart';

class SkillModel {
  final IconData icon;
  final String title;
  final List<String> items;
  final Color color;

  SkillModel(this.icon, this.title, this.items, this.color);
}

final skillList = [
  SkillModel(
    Icons.phone_android,
    "Développement Frontend",
    ["HTML/CSS/JavaScript","Flutter","Angular (bases)","React (bases)",],
    Colors.blue,
  ),
  SkillModel(
    Icons.phone_android,
    "Développement Backend",
    ["Java (Spring-boot)", "Firebase"],
    Colors.brown,
  ),
  SkillModel(
    Icons.computer,
    "Systèmes & Réseaux",
    [
      "Maintenance informatique",
      "Installation & configuration",
      "Support technique"
    ],
    Colors.green,
  ),
  SkillModel(
    Icons.bar_chart,
    "Gestion & Organisation",
    [
      "Suivi de projets",
      "Gestion de systèmes",
      "Organisation du travail"
    ],
    Colors.orange,
  ),
  SkillModel(
    Icons.psychology,
    "Qualités",
    [
      "Rigueur",
      "Autonomie",
      "Capacité d’analyse"
    ],
    Colors.purple,
  ),
];