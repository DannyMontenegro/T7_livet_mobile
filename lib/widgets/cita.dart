import 'package:flutter/material.dart';
import 'package:livet_mobile/widgets/bodyCita.dart';
import 'package:livet_mobile/widgets/headerCita.dart';

class CitaCard extends StatefulWidget {
  const CitaCard({Key? key}) : super(key: key);

  @override
  State<CitaCard> createState() => _CitaCardState();
}

class _CitaCardState extends State<CitaCard> {
  late List<bool> _isOpen;

  @override
  void initState() {
    _isOpen = List.generate(5, (index) => false);
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
