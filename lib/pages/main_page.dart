import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio/AboutParagraph.dart';
import 'package:portfolio/animations/AnimatedIntroText.dart';
import 'package:portfolio/animations/AnimatedProfileImage.dart';
import 'package:portfolio/animations/ParticleBackground.dart';
import 'package:portfolio/animations/RevealOnScroll.dart';
import 'package:portfolio/components/ContactCard.dart';
import 'package:portfolio/components/DrawerItem.dart';
import 'package:portfolio/components/ExperienceItem.dart';
import 'package:portfolio/components/GlowButton.dart';
import 'package:portfolio/components/ProjetCard.dart';
import 'package:portfolio/components/SkillCard.dart';
import 'package:portfolio/core/models/SkillModel.dart';
import 'package:portfolio/utils.dart';
import 'package:portfolio/components/NavItem.dart';
import 'package:portfolio/widgets/layout/responsive.dart';
import 'package:url_launcher/url_launcher.dart';


/// Page principale avec navigation scrollable
class HomePage extends StatelessWidget {
  final ScrollController _controller = ScrollController();

  // Clés pour chaque section (navigation)
  final homeKey = GlobalKey();
  final aboutKey = GlobalKey();
  final projectKey = GlobalKey();
  final experienceKey = GlobalKey();
  final contactKey = GlobalKey();

  /// Fonction pour scroller vers une section
  void scrollTo(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: Duration(milliseconds: 600),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      /// Drawer
      drawer: Drawer(
        backgroundColor: Colors.black,
        child: Column(
          children: [

            SizedBox(height: 80),

            DrawerItem("Accueil", () => scrollTo(homeKey)),
            DrawerItem("À propos", () => scrollTo(aboutKey)),
            DrawerItem("Projets", () => scrollTo(projectKey)),
            DrawerItem("Experiences", () => scrollTo(experienceKey)),
            DrawerItem("Contact", () => scrollTo(contactKey)),
          ],
        ),
      ),
      /// NAVBAR
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.3),
            border: Border(
              bottom: BorderSide(color: Colors.white10),
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  /// 🔥 LOGO / NOM
                  Text(
                    "DouyonDev",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 1.2,
                    ),
                  ),

                  /// 🔥 MENU
                  MediaQuery.of(context).size.width > 800
                      ? Row(
                    children: [
                      NavItem("Accueil", () => scrollTo(homeKey)),
                      NavItem("À propos", () => scrollTo(aboutKey)),
                      NavItem("Projets", () => scrollTo(projectKey)),
                      NavItem("Experiences", () => scrollTo(experienceKey)),
                      NavItem("Contact", () => scrollTo(contactKey)),
                    ],
                  )
                      : IconButton(
                    icon: Icon(Icons.menu, color: Colors.white),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),

      /// CONTENU
      body: Stack(
        children: [

          /// 🌌 BACKGROUND PARTICULES
          ParticleBackground(),

          /// CONTENU SCROLLABLE
          SingleChildScrollView(
            controller: _controller,
            child: Column(
              children: [

                /// 🚀 NOUVELLE SECTION ACCUEIL PREMIUM
                SectionContainer(
                  key: homeKey,
                  child: Responsive(
                    mobile: Column(
                      children: [
                        AnimatedIntroText(),
                        SizedBox(height: 30),
                        AnimatedProfileImage(),
                      ],
                    ),

                    tablet: Row(
                      children: [
                        Expanded(child: AnimatedIntroText()),
                        Expanded(child: AnimatedProfileImage()),
                      ],
                    ),

                    desktop: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(child: AnimatedIntroText()),
                        SizedBox(width: 60),
                        Expanded(child: AnimatedProfileImage()),
                      ],
                    ),
                  ),
                ),

                /// SECTION A PROPOS
                SectionContainer(
                  key: aboutKey,
                  color: Colors.white10,
                  child: RevealOnScroll(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        /// TITRE
                        SectionTitle("À propos"),
                        SizedBox(height: 30),

                        /// CARTE TEXTE PREMIUM
                        Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.05),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: Colors.white24,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              AboutParagraph(
                                "Passionné par l’informatique et les solutions numériques, "
                                    "je suis un professionnel évoluant dans la fonction publique "
                                    "avec une solide expérience en maintenance informatique, "
                                    "déploiement de systèmes et développement d’applications.",
                              ),

                              SizedBox(height: 15),

                              AboutParagraph(
                                "J’ai participé à la mise en place et au support de solutions techniques, "
                                    "notamment dans le cadre du SIGPD, en assurant l’installation, "
                                    "la configuration et l’accompagnement des utilisateurs.",
                              ),

                              SizedBox(height: 15),

                              AboutParagraph(
                                "Aujourd’hui, je développe des applications modernes avec Flutter et Firebase "
                                    "pour répondre aux besoins des entreprises locales, notamment dans la gestion "
                                    "des activités, des ventes et des données.",
                              ),

                              SizedBox(height: 15),

                              AboutParagraph(
                                "Mon objectif est de proposer des solutions simples, efficaces et adaptées "
                                    "aux réalités du terrain.",
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                /// SECTION COMPETENCES
                SectionContainer(
                  child: RevealOnScroll(
                    child: Column(
                      children: [
                        SectionTitle("Compétences"),
                        SizedBox(height: 50),

                        Responsive(
                          mobile: Column(
                            children: skillList.map((s) => Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: SkillCard(
                                icon: s.icon,
                                title: s.title,
                                items: s.items,
                                color: s.color,
                              ),
                            )).toList(),
                          ),

                          tablet: Wrap(
                            spacing: 20,
                            runSpacing: 20,
                            alignment: WrapAlignment.center,
                            children: skillList.map((s) => SkillCard(
                              icon: s.icon,
                              title: s.title,
                              items: s.items,
                              color: s.color,
                            )).toList(),
                          ),

                          desktop: Wrap(
                            spacing: 30,
                            runSpacing: 30,
                            alignment: WrapAlignment.center,
                            children: skillList.map((s) => SkillCard(
                              icon: s.icon,
                              title: s.title,
                              items: s.items,
                              color: s.color,
                            )).toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),


                /// SECTION PROJETS
                SectionContainer(
                  key: projectKey,
                  color: Colors.white10,
                  child: RevealOnScroll(
                    child: Column(
                      children: [
                        SectionTitle("Projets"),
                        SizedBox(height: 40),

                        Wrap(
                          spacing: 25,
                          runSpacing: 25,
                          alignment: WrapAlignment.center,
                          children: [

                            ProjectCard(
                              title: "Application de gestion de boutique",
                              description:
                              "Application Flutter avec Firebase pour gérer les ventes, les stocks et les clients.",
                              tech: ["Flutter", "Firebase"],
                              image: "assets/projects/shop.png",
                            ),

                            ProjectCard(
                              title: "Système de gestion scolaire",
                              description:
                              "Plateforme de gestion des élèves, classes et résultats avec interface moderne.",
                              tech: ["Flutter", "API", "Backend Java"],
                              image: "assets/projects/school.png",
                            ),

                            ProjectCard(
                              title: "Déploiement SIGPD",
                              description:
                              "Installation, configuration et support technique du système SIGPD dans plusieurs services.",
                              tech: ["Réseau", "Maintenance", "Support"],
                              image: "assets/projects/system.png",
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                /// SECTION EXPERIENCES
                SectionContainer(
                  key: experienceKey,
                  child: RevealOnScroll(
                    child: Column(
                      children: [
                        SectionTitle("Expérience"),
                        SizedBox(height: 50),

                        Column(
                          children: [

                            ExperienceItem(
                              title: "Technicien Informatique",
                              company: "Fonction Publique - Ministère de la Défense",
                              period: "2023 - Aujourd’hui",
                              description:
                              "Maintenance du parc informatique, support technique quotidien et déploiement de solutions numériques.",
                              icon: Icons.computer,
                            ),

                            ExperienceItem(
                              title: "Déploiement SIGPD",
                              company: "Projet National",
                              period: "Mission",
                              description:
                              "Installation, configuration et accompagnement des utilisateurs dans plusieurs services administratifs.",
                              icon: Icons.settings,
                            ),

                            ExperienceItem(
                              title: "Développeur Flutter",
                              company: "Projets personnels & freelance",
                              period: "Actuel",
                              description:
                              "Développement d’applications modernes avec Flutter et Firebase pour la gestion d’activités et de données.",
                              icon: Icons.phone_android,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                /// SECTION CONTACT
                SectionContainer(
                  key: contactKey,
                  color: Colors.white10,
                  child: RevealOnScroll(
                    child: Column(
                      children: [
                        SectionTitle("Contact"),
                        SizedBox(height: 40),

                        Wrap(
                          spacing: 20,
                          runSpacing: 20,
                          alignment: WrapAlignment.center,
                          children: [

                            ContactCard(
                              icon: Icons.email,
                              title: "Email",
                              value: "abdoulayedouyon.ad@gmail.com",
                              onTap: () async {
                                await launchUrl(Uri.parse("mailto:abdoulayedouyon.ad@gmail.com"));
                              },
                              onCopy: () {
                                Clipboard.setData(
                                    ClipboardData(text: "abdoulayedouyon.ad@gmail.com"));
                              },
                            ),

                            ContactCard(
                              icon: Icons.phone,
                              title: "WhatsApp",
                              value: "(+223) 92 25 70 11",
                              onTap: () async {
                                await launchUrl(Uri.parse(
                                    "https://wa.me/22392257011"));
                              },
                            ),

                            ContactCard(
                              icon: Icons.link,
                              title: "LinkedIn",
                              value: "linkedin.com/in/abdoulaye-douyon-5039b0306",
                              onTap: () async {
                                await launchUrl(Uri.parse(
                                    "https://linkedin.com/in/abdoulaye-douyon-5039b0306"));
                              },
                            ),

                            ContactCard(
                              icon: Icons.code,
                              title: "GitHub",
                              value: "github.com/DouyonDev",
                              onTap: () async {
                                await launchUrl(
                                    Uri.parse("https://github.com/DouyonDev"));
                              },
                            ),
                          ],
                        ),

                        SizedBox(height: 50),

                        /// BOUTON PREMIUM GLOW
                        GlowButton(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

////////////////////////////////////////////////////////////
/// WIDGETS RÉUTILISABLES
////////////////////////////////////////////////////////////

/// Conteneur de section
class SectionContainer extends StatelessWidget {
  final Widget child;
  final Color? color;

  const SectionContainer({Key? key, required this.child, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 80, horizontal: 20),
      color: color,
      child: Center(child: child),
    );
  }
}

/// Titre de section stylé
class SectionTitle extends StatelessWidget {
  final String text;

  SectionTitle(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }
}

/// Texte animé (fade simple)
/*class AnimatedText extends StatefulWidget {
  final String text;
  final double size;
  final bool isTitle;

  AnimatedText(this.text, {this.size = 16, this.isTitle = false});

  @override
  _AnimatedTextState createState() => _AnimatedTextState();
}

class _AnimatedTextState extends State<AnimatedText>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> opacity;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800));

    opacity = Tween<double>(begin: 0, end: 1).animate(controller);

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: opacity,
      child: Text(
        widget.text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: widget.size,
          color: Colors.white,
          fontWeight:
          widget.isTitle ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}

*/