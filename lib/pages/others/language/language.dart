import 'package:chat_messanger_app/config/colors.dart';
import 'package:chat_messanger_app/config/texts.dart';
import 'package:chat_messanger_app/pages/others/language/language_provider.dart';
import 'package:chat_messanger_app/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class Languages extends StatefulWidget {
  String title;

  Languages({super.key, required this.title});

  @override
  State<Languages> createState() => _Languages();
}

class _Languages extends State<Languages> {
  int? selectedOption = 0;
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
        ChangeNotifierProvider(
          create: (context) => LanguageProvider(),
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(100),
              child: AppTitle(
                title: AppTexts.language,
              ),
            ),
            body: Consumer<LanguageProvider>(
              builder: (context, value, child) => Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 20.0),
                child: Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height - 150,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            // child: Language(context)
                            // ignore: unnecessary_null_comparison
                            child: value != null && value.list != null
                                ? ListView.builder(
                                    itemCount: value.list.length,
                                    itemBuilder: (context, index) {
                                      return ListTile(
                                        title: Text(
                                            value.list[index].languages?.first),
                                        trailing: Radio<int>(
                                          value: index,
                                          groupValue: selectedOption,
                                          fillColor: MaterialStateProperty
                                              .resolveWith<Color?>(
                                            (Set<MaterialState> states) {
                                              if (states.contains(
                                                  MaterialState.selected)) {
                                                // Color when the radio button is selected
                                                return AppColors.colorSheme;
                                              }
                                              // Color when the radio button is not selected
                                              return null; // You can return another color if you want
                                            },
                                          ),
                                          onChanged: (value) {
                                            setState(() {
                                              selectedOption = value;
                                              print("Button value: $value");
                                            });
                                          },
                                          focusColor: AppColors.colorSheme,
                                        ),
                                        onTap: () {
                                          print(
                                              'Tapped on ${value.list[index]}');
                                        },
                                      );
                                    },
                                  )
                                : const Text('Language'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

//   Widget Language(BuildContext context) {
//     final countries = [
//       {
//         "country": "USA",
//         "language": "English US",
//       },
//       {
//         "country": "UK",
//         "language": "English UK",
//       },
//       {
//         "country": "Mandarin",
//         "language": "Mandarin",
//       },
//       {
//         "country": "Armenia",
//         "language": "Armenian",
//       },
//       {
//         "country": "Spain",
//         "language": "Spanish",
//       },
//       {
//         "country": "France",
//         "language": "French",
//       },
//       {
//         "country": "Arabia",
//         "language": "Arabic",
//       },
//       {
//         "country": "Russia",
//         "language": "Russian",
//       },
//       {
//         "country": "Indonesia",
//         "language": "Indonesia",
//       },
//       {
//         "country": "Vietname",
//         "language": "Vietnamese",
//       },
//       {
//         "country": "Armenia",
//         "language": "Armenian",
//       },
//       {
//         "country": "Armenia",
//         "language": "Armenian",
//       },
//       {
//         "country": "Armenia",
//         "language": "Armenian",
//       },
//     ];
//     return ListView.builder(
//       itemCount: countries.length,
//       itemBuilder: (context, index) {
//         return ListTile(
//           title: Text(countries[index].values.last),
//           trailing: Radio<int>(
//             value: 1,
//             groupValue: selectedOption,
//             onChanged: (value) {
//               setState(() {
//                 selectedOption = value;
//                 print("Button value: $value");
//               });
//             },
//           ),
//         );
//       },
//     );
//   }
}
