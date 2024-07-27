import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:my_portfolio/constants/colors.dart';
import 'package:my_portfolio/constants/nav_items.dart';
import 'package:my_portfolio/constants/size.dart';
import 'dart:js' as js;
import 'package:my_portfolio/constants/skill_items.dart';
import 'package:my_portfolio/constants/snslinks.dart';
import 'package:my_portfolio/sytles/style.dart';
import 'package:my_portfolio/utils/projects_utils.dart';
import 'package:my_portfolio/widgets/contactsection.dart';
import 'package:my_portfolio/widgets/customTextField.dart';
import 'package:my_portfolio/widgets/drawer_mobile.dart';
import 'package:my_portfolio/widgets/footerfile.dart';
import 'package:my_portfolio/widgets/header_desktop.dart';
import 'package:my_portfolio/widgets/header_file.dart';
import 'package:my_portfolio/widgets/main_desktop.dart';
import 'package:my_portfolio/widgets/mianOfMobile.dart';
import 'package:my_portfolio/widgets/projectcard.dart';
import 'package:my_portfolio/widgets/projectssection.dart';
import 'package:my_portfolio/widgets/site_logo.dart';
import 'package:my_portfolio/widgets/skillsdesktop.dart';
import 'package:my_portfolio/widgets/skillsmobile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScaffoldKey = GlobalKey<ScaffoldState>();
  final scrollController = ScrollController();
  final List<GlobalKey> navbarKeys = List.generate(4, (index) => GlobalKey());

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;

    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        key: ScaffoldKey,
        backgroundColor: CustomColor.scaffoldBg,
        endDrawer: constraints.maxWidth >= kminDesktopWidth
            ? null
            : DrawerMobile(onNavItemTap: (int navIndex) {
                //callf function
                ScaffoldKey.currentState?.closeEndDrawer();
                scrollToSection(navIndex);
              }),
        body: SingleChildScrollView(
          controller: scrollController,
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(key: navbarKeys.first),
              //Main
              if (constraints.maxWidth >= kminDesktopWidth)
                HeaderDesktop(onNavMenuTap: (int navIndex) {
                  //cal fun
                  scrollToSection(navIndex);
                })
              else
                HeaderMobile(
                  onLogoTap: () {},
                  onMenuTap: () {
                    ScaffoldKey.currentState?.openEndDrawer();
                  },
                ),
              if (constraints.maxWidth >= kminDesktopWidth)
                const MainDesktop()
              else
                const MainOfMobile(),

              //Skills

              Container(
                key: navbarKeys[1],
                padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
                width: screenWidth,
                color: CustomColor.bgLight1,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    //title
                    const Text(
                      "What I Can Do",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: CustomColor.whitePrimary,
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    //platform&skills
                    if (constraints.maxWidth >= kmedDesktopWidth)
                      const SkillDesktop()
                    else
                      const SkillsMobile(),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              //projects
              ProjectSection(
                key: navbarKeys[2],
              ),
              //contact
              const SizedBox(height: 30),
              ContactSection(key: navbarKeys[3]),

              //footer
              const Footer(),
            ],
          ),
        ),
      );
    });
  }

  void scrollToSection(int navIndex) {
    if (navIndex == 4) {
      //open blog page
      js.context.callMethod('open', [SnsLinks.blog]);

      return;
    }
    final key = navbarKeys[navIndex];
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}
