import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http_sample/numberfact_response/numberfact_response.dart';

Future<NumberfactResponse> getNumberFact({required String number}) async {
  final response =
      await http.get(Uri.parse('http://numbersapi.com/$number?json'));
  //print(response.body);

  final bodyAsjson = jsonDecode(response.body) as Map<String,dynamic>;
  final data = NumberfactResponse.fromJson(bodyAsjson);
 return data;
}
