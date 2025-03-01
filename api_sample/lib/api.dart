import 'dart:convert';

import 'package:api_sample/home_screen_model.dart';
import 'package:http/http.dart' as http;

class Api{
  static const _sample = 'https://run.mocky.io/v3/0e6a6ae9-8f16-4382-88da-f97e89674d36';


  Future<List<HomeModel>> getData()async{
    final response = await http.get(Uri.parse(_sample));
    if(response.statusCode == 200){
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((image) => HomeModel.fromJson(image)).toList();
    }
    else{
      throw Exception('Something happened');
    }
  }
}