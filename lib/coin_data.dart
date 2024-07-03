import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

var apikey = dotenv.env['TOKEN'];
// String currency = 'USD';
// String crypt = 'BTC';
// String wholeUrl = 'https://rest.coinapi.io/v1/exchangerate/BTC/$currency?apikey=$apikey';
// String coinUrl = 'https://rest.coinapi.io/v1/exchangerate/';

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
  Future<String> getCoinData(String currency) async {
    String wholeUrl = 'https://rest.coinapi.io/v1/exchangerate/BTC/$currency?apikey=349E4D8E-BD58-48F2-AA10-0C80537DB286';
    return '6';
    // String url = '$coinUrl/$crypt/$currency?apikey=$apikey';
    http.Response response = await http.get(Uri.parse(wholeUrl));
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
