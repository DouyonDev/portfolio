import 'package:flutter/material.dart';

/// Conteneur réutilisable pour une section de page.
///
/// Applique un padding vertical/horizontal uniforme et centre
/// le contenu. Accepte une couleur de fond optionnelle pour
/// alterner visuellement les sections.
class SectionContainer extends StatelessWidget {
  /// Contenu de la section.
  final Widget child;

  /// Couleur de fond optionnelle (ex. surface semi-transparente).
  final Color? color;

  const SectionContainer({
    super.key,
    required this.child,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
      color: color,
      child: Center(child: child),
    );
  }
}
