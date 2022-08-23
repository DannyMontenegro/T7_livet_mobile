import 'package:livet_mobile/constans/endpoints.dart';
import 'package:livet_mobile/models/indication.dart';
import 'package:livet_mobile/utilities/endpoint.dart';

class IndicationsService {
  IndicationsService._sharedInstance();

  static final IndicationsService _instance =
      IndicationsService._sharedInstance();

  factory IndicationsService() => _instance;

  Endpoint service = Endpoint();

  Future<List<Indication>> getIndications() async {
    final String segment = getIndicationsSegment('Erwing');
    print('DATOS');
    final List<dynamic> data = await service.getData(segment) as List;
    final List<Indication> indicaitons =
        data.map((indication) => Indication.fromMap(indication)).toList();
    return indicaitons;
  }
}
