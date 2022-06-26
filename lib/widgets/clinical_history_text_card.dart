import 'package:flutter/material.dart';

class ClinicalHistoryCard extends StatelessWidget {
  final String header;
  final String content;
  const ClinicalHistoryCard(
      {Key? key, required this.header, required this.content})
      : super(key: key);

  final TextStyle headerStyle =
      const TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: Text(header, style: headerStyle),
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Colors.cyan,
            borderRadius: BorderRadius.circular(7),
          ),
        ),
        Container(
          child: Text(content),
          margin: const EdgeInsets.only(bottom: 10.0),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 208, 214, 214),
            borderRadius: BorderRadius.circular(7),
          ),
          padding: const EdgeInsets.all(5),
        ),
      ],
    );
  }
}
