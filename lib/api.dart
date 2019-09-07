import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class TdrClient {

  final String _tdlAttractionUrl =
      'https://www.tokyodisneyresort.jp/_/realtime/tdl_attraction.json';
  final String _tdsAttractionUrl =
      'https://www.tokyodisneyresort.jp/_/realtime/tds_attraction.json';
  final Map<String, String> _requestHeaders = {
    'User-Agent':
    'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36',
    'Accept':
    'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8',
    'Accept-Encoding': 'gzip, deflate, br',
    'Accept-Language': 'ja',
    'Upgrade-Insecure-Requests': '1',
    'Connection': 'keep-alive'
  };

  Future<List<Map<String, String>>> fetchTdlAttraction() async {
    var res = await http.get(
      _tdlAttractionUrl,
      headers: _requestHeaders,
    );
    List<dynamic> data = json.decode(res.body);
    return data.map((x) {
      var entity = Map<String, String>();
      return entity['name'] = x['FacilityName'];
    }).toList();
  }

  Future<List<Map<String, String>>> fetchTdsAttraction() async {
    var res = await http.get(
      _tdsAttractionUrl,
      headers: _requestHeaders,
    );
    List<dynamic> data = json.decode(res.body);
    return data.map((x) {
      var entity = Map<String, String>();
      return entity['name'] = x['FacilityName'];
    }).toList();
  }
}