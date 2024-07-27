import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/colors.dart';
import 'package:my_portfolio/constants/skill_items.dart';

class SkillDesktop extends StatelessWidget {
  const SkillDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //platform
        ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 450,
          ),
          child: Wrap(
            spacing: 5.0,
            runSpacing: 5.0,
            children: [
              for (int i = 0; i < platformItems.length; i++)
                Container(
                  width: 200,
                  decoration: BoxDecoration(
                    color: CustomColor.bgLight2,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                        vertical: 10.0,
                      ),
                      leading: Image.asset(
                        platformItems[i]["img"],
                        width: 26,
                      ),
                      title: Text(platformItems[i]["title"])),
                ),
            ],
          ),
        ),
        const SizedBox(
          width: 50,
        ),
        Flexible(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 500,
            ),
            child: Wrap(
              spacing: 10.0,
              runSpacing: 10.0,
              children: [
                for (int i = 0; i < skillsItems.length; i++)
                  Chip(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 16),
                    backgroundColor: CustomColor.bgLight2,
                    label: Text(skillsItems[i]["title"]),
                    avatar: Image.asset(skillsItems[i]["img"]),
                  )
              ],
            ),
          ),
        )
      ],
    );
  }
}
