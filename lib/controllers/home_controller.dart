import 'package:flutter/material.dart';

/// Représente une section navigable du portfolio.
///
/// Associe un libellé affiché dans la barre de navigation
/// à une [GlobalKey] utilisée pour le scroll automatique.
class NavSection {
  final String label;
  final GlobalKey key;

  const NavSection(this.label, this.key);
}

/// Contrôleur MVC de la page d'accueil.
///
/// Responsabilités :
/// - Gestion du [ScrollController] principal
/// - Définition des sections navigables et leurs clés
/// - Navigation par scroll vers une section cible
class HomeController {
  /// Contrôleur de scroll du contenu principal.
  final ScrollController scrollController = ScrollController();

  // ── Clés de repère pour chaque section ──────────────────────────────
  final GlobalKey homeKey = GlobalKey();
  final GlobalKey aboutKey = GlobalKey();
  final GlobalKey skillsKey = GlobalKey();
  final GlobalKey educationKey = GlobalKey();
  final GlobalKey projectKey = GlobalKey();
  final GlobalKey experienceKey = GlobalKey();
  final GlobalKey contactKey = GlobalKey();

  /// Sections disponibles dans la navigation (ordre d'affichage).
  late final List<NavSection> navSections = [
    NavSection('Accueil', homeKey),
    NavSection('À propos', aboutKey),
    NavSection('Compétences', skillsKey),
    NavSection('Parcours', educationKey),
    NavSection('Projets', projectKey),
    NavSection('Expériences', experienceKey),
    NavSection('Contact', contactKey),
  ];

  /// Fait défiler la page jusqu'à la section ciblée par [key].
  ///
  /// Ferme également le drawer mobile s'il est ouvert.
  void scrollToSection(GlobalKey key, BuildContext context) {
    final targetContext = key.currentContext;
    if (targetContext != null) {
      Scrollable.ensureVisible(
        targetContext,
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeInOutCubic,
      );
    }
    Navigator.of(context).maybePop();
  }

  /// Libère les ressources du contrôleur.
  void dispose() {
    scrollController.dispose();
  }
}
