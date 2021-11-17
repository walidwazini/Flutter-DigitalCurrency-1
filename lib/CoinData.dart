import 'dart:convert';
import 'package:http/http.dart' as http;

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

const coinAPIUrl = 'https://rest.coinapi.io/v1/exchangerate';
const myApiKey = '9FC306E2-B1E6-4687-9028-0BCDBD03C4C9';

class CoinData {
  Future getCoinData(String selectedCurrency) async {
    Map <String,String> cryptoPrices = {};
    for (String crypto in cryptoList) {
      String setupURL = '$coinAPIUrl/$crypto/$selectedCurrency?apikey=$myApiKey';
      Uri requestUrl = Uri.parse(setupURL);
      http.Response response = await http.get(requestUrl);

      if (response.statusCode == 200){
        var decodeData = jsonDecode(response.body);
        double price = decodeData['rate'];
        cryptoPrices[crypto] = price.toStringAsFixed(0);
      } else {
        print(response.statusCode);
        throw 'Problem with the GET request';
      }
    }
    return cryptoPrices;
  }
}