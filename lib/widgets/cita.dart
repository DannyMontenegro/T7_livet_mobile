import 'package:flutter/material.dart';
import 'package:livet_mobile/widgets/appoinment_body.dart';
import 'package:livet_mobile/widgets/appoinment_card_header.dart';

class CitaCard extends StatefulWidget {
  const CitaCard({Key? key}) : super(key: key);

  @override
  State<CitaCard> createState() => _CitaCardState();
}

class _CitaCardState extends State<CitaCard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: const ExpansionTile(
        title: HeaderCita(),
        children: [
          BodyCita(),
        ],
      ),
    );
    /*
    return ExpansionPanelList(
      expandedHeaderPadding: EdgeInsets.zero,
      children: List.generate(
        5,
        (index) => ExpansionPanel(
          backgroundColor: Colors.blue,
          headerBuilder: (BuildContext context, bool isExpanded) {
            return const HeaderCita();
          },
          body: const BodyCita(),
          isExpanded: _isOpen[index],
        ),
      ),
      expansionCallback: (index, isExpanded) {
        setState(() {
          _isOpen[index] = !isExpanded;
        });
      },
    );
    */
  }
}
