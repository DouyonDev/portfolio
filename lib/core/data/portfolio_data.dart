import 'package:flutter/material.dart';

class EducationEntry {
  final String title;
  final String institution;
  final String period;
  final IconData icon;

  const EducationEntry({
    required this.title,
    required this.institution,
    required this.period,
    required this.icon,
  });
}

class ExperienceEntry {
  final String title;
  final String company;
  final String period;
  final String description;
  final IconData icon;

  const ExperienceEntry({
    required this.title,
    required this.company,
    required this.period,
    required this.description,
    required this.icon,
  });
}

class ProjectEntry {
  final String title;
  final String description;
  final List<String> tech;
  final String image;
  final String? url;

  const ProjectEntry({
    required this.title,
    required this.description,
    required this.tech,
    required this.image,
    this.url,
  });
}

class InterestEntry {
  final IconData icon;
  final String label;
  final String subtitle;

  const InterestEntry({
    required this.icon,
    required this.label,
    required this.subtitle,
  });
}

class TechSkill {
  final String name;
  final double level;
  final Color color;
  final IconData icon;

  const TechSkill({
    required this.name,
    required this.level,
    required this.color,
    required this.icon,
  });
}

class PortfolioData {
  static const name = 'Abdoulaye Douyon';
  static const title = 'Développeur Full-Stack & Informaticien';
  static const subtitle =
      'Étudiant passionné spécialisé en développement web et mobile, '
      'avec une solide formation en sciences biologiques.';
  static const email = 'abdoulayedouyon.ad@gmail.com';
  static const phone = '+223 92 25 70 11';
  static const linkedIn = 'linkedin.com/in/abdoulaye-douyon-5039b0306';
  static const github = 'github.com/DouyonDev';
  static const cvUrl = 'https://douyondev.github.io/projetCV/';

  static const aboutParagraphs = [
    'Passionné par l\'informatique et les solutions numériques, je suis un professionnel '
        'évoluant dans la fonction publique avec une solide expérience en maintenance '
        'informatique, déploiement de systèmes et développement d\'applications.',
    'Étudiant passionné spécialisé en développement web et mobile, avec une solide '
        'formation en sciences biologiques. Je suis déterminé à appliquer mes compétences '
        'en développement logiciel pour créer des solutions innovantes dans le domaine '
        'de la biologie et de la santé.',
    'Aujourd\'hui, je développe des applications modernes avec Flutter et Firebase '
        'pour répondre aux besoins des entreprises locales, notamment dans la gestion '
        'des activités, des ventes et des données.',
    'Mon objectif est de proposer des solutions simples, efficaces et adaptées '
        'aux réalités du terrain.',
  ];

  static const stats = [
    ('5+', 'Années d\'expérience'),
    ('10+', 'Projets réalisés'),
    ('4', 'Formations'),
    ('6', 'Compétences clés'),
  ];

  static const education = [
    EducationEntry(
      title: 'Développeur Full-Stack — ODK',
      institution: 'Formation en cours',
      period: '2024 — Aujourd\'hui',
      icon: Icons.school,
    ),
    EducationEntry(
      title: 'Licence Génie Biologique',
      institution: 'Institut des Sciences Appliquées',
      period: '2024',
      icon: Icons.biotech,
    ),
    EducationEntry(
      title: 'DUT Électronique & Maintenance Informatique',
      institution: 'TecnoLab-ISTA',
      period: '2021 — 2023',
      icon: Icons.memory,
    ),
    EducationEntry(
      title: 'Baccalauréat Malien — Sciences Expérimentales',
      institution: 'Terminale',
      period: '2014 — 2017',
      icon: Icons.menu_book,
    ),
  ];

  static const experiences = [
    ExperienceEntry(
      title: 'Technicien Informatique',
      company: 'Fonction Publique — Ministère de la Défense',
      period: '2023 — Aujourd\'hui',
      description:
          'Maintenance du parc informatique, support technique quotidien et déploiement de solutions numériques.',
      icon: Icons.computer,
    ),
    ExperienceEntry(
      title: 'Gestion de données scolaires',
      company: 'CSTD',
      period: '2022 — Aujourd\'hui',
      description:
          'Gestion et structuration des données scolaires, suivi administratif et support aux équipes pédagogiques.',
      icon: Icons.storage,
    ),
    ExperienceEntry(
      title: 'Stage Bio-Médical',
      company: 'Hôpital du Point-G',
      period: 'Août — Sept. 2023',
      description:
          'Immersion hospitalière en environnement bio-médical, observation des processus de santé et gestion de données.',
      icon: Icons.local_hospital,
    ),
    ExperienceEntry(
      title: 'Déploiement SIGPD',
      company: 'Projet National',
      period: 'Mission',
      description:
          'Installation, configuration et accompagnement des utilisateurs dans plusieurs services administratifs.',
      icon: Icons.settings,
    ),
    ExperienceEntry(
      title: 'Certification ITE',
      company: 'CISCO',
      period: '2023',
      description:
          'Certification en Introduction to IoT — fondamentaux des réseaux et technologies connectées.',
      icon: Icons.wifi,
    ),
    ExperienceEntry(
      title: 'Conception de sites web',
      company: 'Projets académiques & freelance',
      period: 'Depuis 2021',
      description:
          'Conception et développement de sites web, cartes d\'identité visuelle et supports numériques pour divers établissements.',
      icon: Icons.web,
    ),
    ExperienceEntry(
      title: 'Réparation d\'ordinateurs',
      company: 'Services indépendants',
      period: 'Depuis 2021',
      description:
          'Diagnostic, réparation et maintenance de matériel informatique pour particuliers et institutions.',
      icon: Icons.build,
    ),
  ];

  static const projects = [
    ProjectEntry(
      title: 'Application de gestion de boutique',
      description:
          'Application Flutter avec Firebase pour gérer les ventes, les stocks et les clients.',
      tech: ['Flutter', 'Firebase', 'Dart'],
      image: 'assets/projects/shop.png',
    ),
    ProjectEntry(
      title: 'Système de gestion scolaire',
      description:
          'Plateforme de gestion des élèves, classes et résultats avec interface moderne.',
      tech: ['Flutter', 'API', 'Java'],
      image: 'assets/projects/school.png',
    ),
    ProjectEntry(
      title: 'Déploiement SIGPD',
      description:
          'Installation, configuration et support technique du système SIGPD dans plusieurs services.',
      tech: ['Réseau', 'Maintenance', 'Support'],
      image: 'assets/projects/system.png',
    ),
  ];

  static const techSkills = [
    TechSkill(name: 'HTML', level: 0.90, color: Color(0xFFE34F26), icon: Icons.code),
    TechSkill(name: 'CSS', level: 0.85, color: Color(0xFF1572B6), icon: Icons.palette),
    TechSkill(name: 'JavaScript', level: 0.80, color: Color(0xFFF7DF1E), icon: Icons.javascript),
    TechSkill(name: 'Flutter', level: 0.85, color: Color(0xFF02569B), icon: Icons.phone_android),
    TechSkill(name: 'MySQL', level: 0.75, color: Color(0xFF4479A1), icon: Icons.storage),
    TechSkill(name: 'Firebase', level: 0.80, color: Color(0xFFFFCA28), icon: Icons.cloud),
    TechSkill(name: 'Java', level: 0.70, color: Color(0xFFED8B00), icon: Icons.coffee),
    TechSkill(name: 'Access', level: 0.75, color: Color(0xFFA4373A), icon: Icons.table_chart),
  ];

  static const interests = [
    InterestEntry(
      icon: Icons.sports_soccer,
      label: 'Sport',
      subtitle: 'Développement Logiciel',
    ),
    InterestEntry(
      icon: Icons.music_note,
      label: 'Musique',
      subtitle: 'Technologie & Innovation',
    ),
    InterestEntry(
      icon: Icons.biotech,
      label: 'Sciences Biologiques',
      subtitle: 'Code & Innovation',
    ),
  ];
}
