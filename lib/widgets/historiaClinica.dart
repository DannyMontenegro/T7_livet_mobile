import 'package:flutter/material.dart';
import 'package:livet_mobile/widgets/cita.dart';

class HistoriaClinica extends StatefulWidget {
  const HistoriaClinica({Key? key}) : super(key: key);

  @override
  State<HistoriaClinica> createState() => _HistoriaClinicaState();
}

class _HistoriaClinicaState extends State<HistoriaClinica>
    with AutomaticKeepAliveClientMixin<HistoriaClinica> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SingleChildScrollView(
      child: Column(
        children: List.generate(
          5,
          (index) => Container(
            child: const CitaCard(),
            margin:
                const EdgeInsets.only(left: 35, right: 35, top: 10, bottom: 10),
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
