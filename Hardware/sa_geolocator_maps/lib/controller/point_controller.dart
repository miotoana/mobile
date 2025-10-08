// classe para fazer os controllers dos pontos de marcação

import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:sa_geolocator_maps/model/point_location.dart';

class PointController {
  final DateFormat _formatar = DateFormat("dd/MM/yyyy HH:mm:ss");
  
  // metado para pegar a localização do dispositivo

  Future<PointLocation> pegarPontoLocalizacao() async{
    //verificar se as permissões estão liberadas
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if(!serviceEnabled){
      throw Exception("Sem aCesso ao GPS");
    }
    //solicitar a permissão do GPS
    LocationPermission permission = await Geolocator.checkPermission();
    if(permission == LocationPermission.denied){
      permission = await Geolocator.requestPermission();
      if(permission == LocationPermission.denied){
        throw Exception("Permissão gps Negada");
      }
    }

    // se as permissões estiverem ok, pego a localização

    Position position = await Geolocator.getCurrentPosition();
    String datahora = _formatar.format(DateTime.now());

    //criar um obj do modelo

    PointLocation posicaoAtual = PointLocation(
      latitude: position.latitude,
      longitude: position.longitude,
      datahora: datahora);

      return posicaoAtual;
  }
}