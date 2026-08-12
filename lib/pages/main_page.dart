import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/AboutParagraph.dart';
import 'package:portfolio/animations/AnimatedIntroText.dart';
import 'package:portfolio/animations/AnimatedProfileImage.dart';
import 'package:portfolio/animations/ParticleBackground.dart';
import 'package:portfolio/animations/RevealOnScroll.dart';
import 'package:portfolio/components/ContactCard.dart';
import 'package:portfolio/components/DrawerItem.dart';
import 'package:portfolio/components/EducationItem.dart';
import 'package:portfolio/components/ExperienceItem.dart';
import 'package:portfolio/components/GlowButton.dart';
import 'package:portfolio/components/PremiumSectionTitle.dart';
import 'package:portfolio/components/ProjetCard.dart';
import 'package:portfolio/components/SkillCard.dart';
import 'package:portfolio/components/StatCard.dart';
import 'package:portfolio/components/TechBadge.dart';
import 'package:portfolio/core/data/portfolio_data.dart';
import 'package:portfolio/core/models/SkillModel.dart';
import 'package:portfolio/utils.dart';
import 'package:portfolio/components/NavItem.dart';
import 'package:portfolio/widgets/layout/responsive.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _controller = ScrollController();

  final homeKey = GlobalKey();
  final aboutKey = GlobalKey();
  final skillsKey = GlobalKey();
  final educationKey = GlobalKey();
  final projectKey = GlobalKey();
  final experienceKey = GlobalKey();
  final contactKey = GlobalKey();

  void scrollTo(GlobalKey key) {
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

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final navItems = [
      ('Accueil', homeKey),
      ('À propos', aboutKey),
      ('Compétences', skillsKey),
      ('Parcours', educationKey),
      ('Projets', projectKey),
      ('Expériences', experienceKey),
      ('Contact', contactKey),
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      drawer: Drawer(
        backgroundColor: AppColors.surface,
        child: Column(
          children: [
            const SizedBox(height: 60),
            Padding(
              padding: const EdgeInsets.all(20),
              child: ShaderMask(
                shaderCallback: (bounds) =>
                    AppColors.gradientPrimary.createShader(bounds),
                child: Text(
                  'DouyonDev',
                  style: GoogleFonts.spaceGrotesk(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const Divider(color: AppColors.cardBorder),
            ...navItems.map(
              (item) => DrawerItem(item.$1, () => scrollTo(item.$2)),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          const ParticleBackground(),
          Column(
            children: [
              _PremiumNavBar(navItems: navItems, onNavigate: scrollTo),
              Expanded(
                child: SingleChildScrollView(
                  controller: _controller,
                  child: Column(
                    children: [
                      _HeroSection(
                        homeKey: homeKey,
                        onProjects: () => scrollTo(projectKey),
                        onContact: () => scrollTo(contactKey),
                        onCv: () => launchUrl(Uri.parse(PortfolioData.cvUrl)),
                      ),
                      _AboutSection(aboutKey: aboutKey),
                      _SkillsSection(skillsKey: skillsKey),
                      _EducationSection(educationKey: educationKey),
                      _ProjectsSection(projectKey: projectKey),
                      _ExperienceSection(experienceKey: experienceKey),
                      _InterestsSection(),
                      _ContactSection(contactKey: contactKey),
                      _Footer(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _PremiumNavBar extends StatelessWidget {
  final List<(String, GlobalKey)> navItems;
  final void Function(GlobalKey) onNavigate;

  const _PremiumNavBar({required this.navItems, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.background.withValues(alpha: 0.8),
        border: const Border(bottom: BorderSide(color: AppColors.cardBorder)),
      ),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ShaderMask(
                shaderCallback: (bounds) =>
                    AppColors.gradientPrimary.createShader(bounds),
                child: Text(
                  'DouyonDev',
                  style: GoogleFonts.spaceGrotesk(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 1,
                  ),
                ),
              ),
              MediaQuery.of(context).size.width > 900
                  ? Row(
                      children: navItems
                          .map(
                            (item) =>
                                NavItem(item.$1, () => onNavigate(item.$2)),
                          )
                          .toList(),
                    )
                  : Builder(
                      builder: (ctx) => IconButton(
                        icon: const Icon(Icons.menu, color: Colors.white),
                        onPressed: () => Scaffold.of(ctx).openDrawer(),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

class _HeroSection extends StatelessWidget {
  final GlobalKey homeKey;
  final VoidCallback onProjects;
  final VoidCallback onContact;
  final Future<void> Function() onCv;

  const _HeroSection({
    required this.homeKey,
    required this.onProjects,
    required this.onContact,
    required this.onCv,
  });

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      key: homeKey,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1200),
        child: Column(
          children: [
            Responsive(
              mobile: Column(
                children: [
                  AnimatedIntroText(
                    onProjectsTap: onProjects,
                    onContactTap: onContact,
                    onCvTap: () => onCv(),
                  ),
                  const SizedBox(height: 40),
                  AnimatedProfileImage(),
                ],
              ),
              tablet: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: AnimatedIntroText(
                      onProjectsTap: onProjects,
                      onContactTap: onContact,
                      onCvTap: () => onCv(),
                    ),
                  ),
                  const SizedBox(width: 40),
                  Expanded(child: AnimatedProfileImage()),
                ],
              ),
              desktop: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 3,
                    child: AnimatedIntroText(
                      onProjectsTap: onProjects,
                      onContactTap: onContact,
                      onCvTap: () => onCv(),
                    ),
                  ),
                  const SizedBox(width: 60),
                  Expanded(flex: 2, child: AnimatedProfileImage()),
                ],
              ),
            ),
            const SizedBox(height: 60),
            Wrap(
              spacing: 20,
              runSpacing: 20,
              alignment: WrapAlignment.center,
              children: PortfolioData.stats
                  .map((s) => StatCard(value: s.$1, label: s.$2))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class _AboutSection extends StatelessWidget {
  final GlobalKey aboutKey;

  const _AboutSection({required this.aboutKey});

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      key: aboutKey,
      color: AppColors.surface.withValues(alpha: 0.5),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 900),
        child: RevealOnScroll(
          child: Column(
            children: [
              const PremiumSectionTitle(
                title: 'À propos',
                subtitle: 'Qui suis-je et ce que je fais',
              ),
              const SizedBox(height: 40),
              Container(
                padding: const EdgeInsets.all(28),
                decoration: AppDecorations.glassCard(glow: true),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: PortfolioData.aboutParagraphs
                      .map(
                        (p) => Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: AboutParagraph(p),
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SkillsSection extends StatelessWidget {
  final GlobalKey skillsKey;

  const _SkillsSection({required this.skillsKey});

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      key: skillsKey,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1100),
        child: RevealOnScroll(
          child: Column(
            children: [
              const PremiumSectionTitle(
                title: 'Compétences',
                subtitle: 'Technologies et domaines d\'expertise',
              ),
              const SizedBox(height: 50),
              Responsive(
                mobile: Column(
                  children: skillList
                      .map(
                        (s) => Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: SkillCard(
                            icon: s.icon,
                            title: s.title,
                            items: s.items,
                            color: s.color,
                          ),
                        ),
                      )
                      .toList(),
                ),
                tablet: Wrap(
                  spacing: 20,
                  runSpacing: 20,
                  alignment: WrapAlignment.center,
                  children: skillList
                      .map(
                        (s) => SkillCard(
                          icon: s.icon,
                          title: s.title,
                          items: s.items,
                          color: s.color,
                        ),
                      )
                      .toList(),
                ),
                desktop: Wrap(
                  spacing: 24,
                  runSpacing: 24,
                  alignment: WrapAlignment.center,
                  children: skillList
                      .map(
                        (s) => SkillCard(
                          icon: s.icon,
                          title: s.title,
                          items: s.items,
                          color: s.color,
                        ),
                      )
                      .toList(),
                ),
              ),
              const SizedBox(height: 60),
              const PremiumSectionTitle(
                title: 'Stack technique',
                subtitle: 'Niveau de maîtrise par technologie',
              ),
              const SizedBox(height: 30),
              LayoutBuilder(
                builder: (context, constraints) {
                  final isWide = constraints.maxWidth > 700;
                  return Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    alignment: WrapAlignment.center,
                    children: PortfolioData.techSkills.map((skill) {
                      return SizedBox(
                        width: isWide ? 340 : constraints.maxWidth,
                        child: TechSkillBar(skill: skill),
                      );
                    }).toList(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _EducationSection extends StatelessWidget {
  final GlobalKey educationKey;

  const _EducationSection({required this.educationKey});

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      key: educationKey,
      color: AppColors.surface.withValues(alpha: 0.5),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 800),
        child: RevealOnScroll(
          child: Column(
            children: [
              const PremiumSectionTitle(
                title: 'Parcours',
                subtitle: 'Formation et certifications',
              ),
              const SizedBox(height: 40),
              ...PortfolioData.education.asMap().entries.map(
                (e) => EducationItem(
                  entry: e.value,
                  isLast: e.key == PortfolioData.education.length - 1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProjectsSection extends StatelessWidget {
  final GlobalKey projectKey;

  const _ProjectsSection({required this.projectKey});

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      key: projectKey,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1100),
        child: RevealOnScroll(
          child: Column(
            children: [
              const PremiumSectionTitle(
                title: 'Projets',
                subtitle: 'Réalisations récentes',
              ),
              const SizedBox(height: 40),
              Wrap(
                spacing: 25,
                runSpacing: 25,
                alignment: WrapAlignment.center,
                children: PortfolioData.projects
                    .map(
                      (p) => ProjectCard(
                        title: p.title,
                        description: p.description,
                        tech: p.tech,
                        image: p.image,
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ExperienceSection extends StatelessWidget {
  final GlobalKey experienceKey;

  const _ExperienceSection({required this.experienceKey});

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      key: experienceKey,
      color: AppColors.surface.withValues(alpha: 0.5),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 850),
        child: RevealOnScroll(
          child: Column(
            children: [
              const PremiumSectionTitle(
                title: 'Expériences',
                subtitle: 'Mon parcours professionnel',
              ),
              const SizedBox(height: 40),
              ...PortfolioData.experiences.map(
                (e) => ExperienceItem(
                  title: e.title,
                  company: e.company,
                  period: e.period,
                  description: e.description,
                  icon: e.icon,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _InterestsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 800),
        child: RevealOnScroll(
          child: Column(
            children: [
              const PremiumSectionTitle(
                title: 'Centres d\'intérêt',
                subtitle: 'Passions au-delà du code',
              ),
              const SizedBox(height: 40),
              Wrap(
                spacing: 24,
                runSpacing: 24,
                alignment: WrapAlignment.center,
                children: PortfolioData.interests
                    .map((i) => InterestCard(interest: i))
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ContactSection extends StatelessWidget {
  final GlobalKey contactKey;

  const _ContactSection({required this.contactKey});

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      key: contactKey,
      color: AppColors.surface.withValues(alpha: 0.5),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 900),
        child: RevealOnScroll(
          child: Column(
            children: [
              const PremiumSectionTitle(
                title: 'Contact',
                subtitle: 'Travaillons ensemble sur votre prochain projet',
              ),
              const SizedBox(height: 40),
              Wrap(
                spacing: 20,
                runSpacing: 20,
                alignment: WrapAlignment.center,
                children: [
                  ContactCard(
                    icon: Icons.email_outlined,
                    title: 'Email',
                    value: PortfolioData.email,
                    onTap: () =>
                        launchUrl(Uri.parse('mailto:${PortfolioData.email}')),
                    onCopy: () => Clipboard.setData(
                      ClipboardData(text: PortfolioData.email),
                    ),
                  ),
                  ContactCard(
                    icon: Icons.phone_outlined,
                    title: 'WhatsApp',
                    value: PortfolioData.phone,
                    onTap: () =>
                        launchUrl(Uri.parse('https://wa.me/22392257011')),
                  ),
                  ContactCard(
                    icon: Icons.link,
                    title: 'LinkedIn',
                    value: PortfolioData.linkedIn,
                    onTap: () => launchUrl(
                      Uri.parse('https://${PortfolioData.linkedIn}'),
                    ),
                  ),
                  ContactCard(
                    icon: Icons.code,
                    title: 'GitHub',
                    value: PortfolioData.github,
                    onTap: () =>
                        launchUrl(Uri.parse('https://${PortfolioData.github}')),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              GlowButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class _Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 30),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: AppColors.cardBorder)),
      ),
      child: Column(
        children: [
          ShaderMask(
            shaderCallback: (bounds) =>
                AppColors.gradientPrimary.createShader(bounds),
            child: Text(
              'DouyonDev',
              style: GoogleFonts.spaceGrotesk(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '© ${DateTime.now().year} Abdoulaye Douyon — Tous droits réservés',
            style: GoogleFonts.inter(
              color: AppColors.textSecondary,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}

class SectionContainer extends StatelessWidget {
  final Widget child;
  final Color? color;

  const SectionContainer({super.key, required this.child, this.color});

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
