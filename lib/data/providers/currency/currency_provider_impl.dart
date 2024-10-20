import 'dart:convert';

import 'package:cryptocurrency_converter/data/dto/currency_dto.dart';
import 'package:cryptocurrency_converter/data/providers/currency/currency_provider.dart';
import 'package:cryptocurrency_converter/logger.dart';
import 'package:http/http.dart';

class CurrencyProviderImpl implements CurrencyProvider {
  final Client _client = Client();

  @override
  Future<List<CurrencyDto>?> getCurrencies() async {
    var url = Uri.https(CurrencyProvider.baseUrl, 'v2/rates');
    var response = await _client.get(url);

    if (response.statusCode == 200) {
      try {
        final List jsonList =
        jsonDecode(response.body)['data'];
        return jsonList.map((json) => CurrencyDto.fromJson(json)).toList();
      } catch (e, s) {
        logger.e('Failed to parse currencies', error: e, stackTrace: s);
        return null;
      }
    } else {
      logger.e(
        'Failed to get currency rates',
        error: 'Error ${response.statusCode}: ${response.reasonPhrase}',
      );
      return null;
    }
  }

  @override
  Future<CurrencyDto?> getCurrencyById(String id) async {
    var url = Uri.https(CurrencyProvider.baseUrl, 'v2/rates/$id');
    var response = await _client.get(url);

    if (response.statusCode == 200) {
      try {
        final Map<String, Object?> json = jsonDecode(response.body)['data'];
        return CurrencyDto.fromJson(json);
      } catch (e, s) {
        logger.e('Failed to parse currency $id', error: e, stackTrace: s);
        return null;
      }
    } else {
      logger.e(
        'Failed to get currency rate $id',
        error: 'Error ${response.statusCode}: ${response.reasonPhrase}',
      );
      return null;
    }
  }
}
