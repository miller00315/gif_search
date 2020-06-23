import 'dart:convert';

import 'package:http/http.dart' as http;

Future<Map> getGifs(String search, int offset) async {
  http.Response response;

  if (search == null) {
    response = await http.get(
        'https://api.giphy.com/v1/gifs/trending?api_key=4I4rcOio27FjB1C2T4nduCH6s9ppLSoY&limit=20&rating=G');
  } else {
    response = await http.get(
        'https://api.giphy.com/v1/gifs/search?api_key=4I4rcOio27FjB1C2T4nduCH6s9ppLSoY&q=$search&limit=19&offset=$offset&rating=G&lang=en');
  }

  return json.decode(response.body);
}
