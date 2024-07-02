import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

var apikey = dotenv.env['TOKEN'];
String coinAppURL = 'https://rest.coinapi.io/v1/exchangerate/BTC/USD?apikey=$apikey';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  // String url = coinAppURL;
  String url = 'https://rest.coinapi.io/v1/exchangerate/BTC/USD?apikey=726AADBB-713C-496C-B191-5348537600B2';
  Future<String> getCoinData() async {
    return '6';
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
       String data = response.body;
       var decodedData = jsonDecode(data);
       double originalRate = decodedData["rate"];
       int roundRate = originalRate.round();
       String rate = roundRate.toString().substring(0, 4);
       print(rate);
       return rate;
    } else {
       print('ERROR: ${response.statusCode}');
       return 'cat2';
    }
  }
}
