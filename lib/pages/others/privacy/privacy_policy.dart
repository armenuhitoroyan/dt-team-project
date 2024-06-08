import 'package:chat_messanger_app/config/texts.dart';
import 'package:chat_messanger_app/widgets/appbar.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PrivacyPolicy extends StatefulWidget {
  String title;

  PrivacyPolicy({super.key, required this.title});

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicy();
}

class _PrivacyPolicy extends State<PrivacyPolicy> {
  int? selectedOption = 1;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SafeArea(
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(100),
              child: AppTitle(
                title: AppTexts.privacyPolicy,
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: Column(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height - 130,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(child: RulesWidget(context)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget RulesWidget(BuildContext context) {
    final rules = [
      {
        "rule": "1. Types data we collect",
        "description":
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident.",
      },
      {
        "rule": "2. Use of your personal data",
        "description":
            "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit.",
      },
    ];
    return ListView.builder(
      itemCount: rules.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(rules[index].values.first),
          titleTextStyle: const TextStyle(fontWeight: FontWeight.bold),
          subtitle: Text(rules[index].values.last),
          subtitleTextStyle: const TextStyle(fontWeight: FontWeight.bold),
        );
      },
    );
  }
}
