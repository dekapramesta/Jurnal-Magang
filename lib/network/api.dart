import 'dart:developer';

import 'package:http/http.dart' as http;

class Api {
  final String _url = 'https://jurnalmagang.aeritechnology.com/Api/';

  auth(data, url) async {
    var fullUrl = _url + url;
    return await http.post(Uri.parse(fullUrl), body: data);
  }

  post(data, url) async {
    var fullUrl = _url + url;
    return await http.post(Uri.parse(fullUrl), body: data);
  }

  get(url) async {
    var fullUrl = _url + url;
    return await http.get(Uri.parse(fullUrl));
  }
}