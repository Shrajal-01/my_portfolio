import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/colors.dart';
import 'package:my_portfolio/utils/projects_utils.dart';
import 'package:my_portfolio/widgets/projectcard.dart';

class ProjectSection extends StatelessWidget {
  const ProjectSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth,
      padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
      child: Column(
        children: [
          //work project titles
          const Text(
            "Work project",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: CustomColor.whitePrimary,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          //workproject cards

          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 900),
            child: Wrap(
              spacing: 25,
              runSpacing: 25,
              children: [
                for (int i = 0; i < workprojectUnits.length; i++)
                  ProjectCardWidget(project: workprojectUnits[i]),
              ],
            ),
          ),
          const SizedBox(
            height: 80,
          ),
          //hobby project titles
          const Text(
            "Hobby project",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: CustomColor.whitePrimary,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          //hpbbyproject cards

          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 900),
            child: Wrap(
              spacing: 25,
              runSpacing: 25,
              children: [
                for (int i = 0; i < hobbyprojectUnits.length; i++)
                  ProjectCardWidget(project: hobbyprojectUnits[i]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
