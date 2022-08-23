import 'package:flutter/material.dart';
import 'package:livet_mobile/models/indication.dart';
import 'package:livet_mobile/services/indations_service.dart';
import 'package:livet_mobile/widgets/cita.dart';

class HistoriaClinica extends StatefulWidget {
  const HistoriaClinica({Key? key}) : super(key: key);

  @override
  State<HistoriaClinica> createState() => _HistoriaClinicaState();
}

class _HistoriaClinicaState extends State<HistoriaClinica>
    with AutomaticKeepAliveClientMixin<HistoriaClinica> {
  late Future<List<Indication>> _indications;
  IndicationsService service = IndicationsService();

  @override
  void initState() {
    super.initState();
    _indications = service.getIndications();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return FutureBuilder<List<Indication>>(
      future: _indications,
      builder:
          (BuildContext context, AsyncSnapshot<List<Indication>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          if (!snapshot.hasData) {
            return Column(
              children: [
                const Text('No hay indicaciones para mostrar'),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _indications = service.getIndications();
                    });
                  },
                  child: const Text('Refresh'),
                ), //Testing purposes only
              ],
            );
          }
          return SingleChildScrollView(
            child: Column(
              children: snapshot.data!
                  .map(
                    (indication) => Container(
                      child: CitaCard(data: indication),
                      margin: const EdgeInsets.only(
                        left: 35,
                        right: 35,
                        top: 10,
                        bottom: 10,
                      ),
                    ),
                  )
                  .toList(),
            ),
          );
        }
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
