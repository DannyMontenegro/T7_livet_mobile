// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:livet_mobile/widgets/clinical_history_text_card.dart';

class Indicaciones extends StatelessWidget {
  const Indicaciones({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: const [
            ClinicalHistoryCard(
              header: '0 - Datos demográficos',
              content:
                  "Simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. ",
            ),
            ClinicalHistoryCard(
              header: '1 - Motivos de consulta',
              content:
                  "Simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. ",
            ),
            ClinicalHistoryCard(
              header: '2 - Antecedentes personales',
              content:
                  "Simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. ",
            ),
            ClinicalHistoryCard(
              header: '3 - Antecedentes familiares',
              content:
                  "Simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. ",
            ),
            ClinicalHistoryCard(
              header: '4 - Enfermedad o problema actual',
              content:
                  "Simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. ",
            ),
          ],
        ),
      ),
    );
  }
}
