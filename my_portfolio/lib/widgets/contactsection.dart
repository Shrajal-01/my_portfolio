import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:my_portfolio/constants/colors.dart';
import 'package:my_portfolio/constants/size.dart';
import 'package:my_portfolio/constants/snslinks.dart';
import 'package:my_portfolio/widgets/customTextField.dart';
import 'dart:js' as js;

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(25, 20, 25, 60),
      color: CustomColor.bgLight1,
      child: Column(
        children: [
          //title
          Text(
            "Get in touch",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: CustomColor.whitePrimary),
          ),
          const SizedBox(height: 50),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 700, maxHeight: 100),
            child: LayoutBuilder(builder: (context, Constraints) {
              if (Constraints.maxWidth >= kminDesktopWidth) {
                return buildnameEmailFieldDeasktop();
              } else {
                return buildnameEmailFieldMobile();
              }
            }),
          ),
          const SizedBox(
            height: 15,
          ),

          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 700),
            child: CustomTextField(
              hintText: "Your Message",
              maxLine: 20,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 700),
            child: SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "Get in touch",
                      style: TextStyle(
                        color: CustomColor.yellowPrimary,
                      ),
                    ))),
          ),
          const SizedBox(
            height: 30,
          ),
          ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 300),
              child: const Divider()),
          const SizedBox(
            height: 15,
          ),

          //sns icon button links

          Wrap(
            spacing: 12,
            runSpacing: 12,
            alignment: WrapAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  js.context.callMethod(
                    'open',
                    [SnsLinks.github],
                  );
                },
                child: Image.asset(
                  "assets/snsicons/github.jpg",
                  width: 28,
                ),
              ),
              InkWell(
                onTap: () {
                  js.context.callMethod(
                    'open',
                    [SnsLinks.linkedin],
                  );
                },
                child: Image.asset(
                  "assets/snsicons/linkedin.png",
                  width: 28,
                ),
              ),
              InkWell(
                onTap: () {
                  js.context.callMethod(
                    'open',
                    [SnsLinks.teligram],
                  );
                },
                child: Image.asset(
                  "assets/snsicons/teligram.png",
                  width: 28,
                ),
              ),
              InkWell(
                onTap: () {
                  js.context.callMethod(
                    'open',
                    [SnsLinks.facebook],
                  );
                },
                child: Image.asset(
                  "assets/snsicons/facebook.png",
                  width: 28,
                ),
              ),
              InkWell(
                onTap: () {
                  js.context.callMethod(
                    'open',
                    [SnsLinks.instagram],
                  );
                },
                child: Image.asset(
                  "assets/snsicons/instagram.jpg",
                  width: 28,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Row buildnameEmailFieldDeasktop() {
    return Row(
      children: [
        Flexible(
          child: CustomTextField(
            hintText: "Your Name",
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        Flexible(
          child: CustomTextField(
            hintText: "Your Email",
          ),
        ),
      ],
    );
  }

  Column buildnameEmailFieldMobile() {
    return Column(
      children: [
        Flexible(
          child: CustomTextField(
            hintText: "Your Name",
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Flexible(
          child: CustomTextField(
            hintText: "Your Email",
          ),
        ),
      ],
    );
  }
}
