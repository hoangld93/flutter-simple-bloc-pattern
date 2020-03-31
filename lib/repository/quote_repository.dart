import 'dart:async';

import 'package:flutterblocrestapi/model/Quote.dart';
import 'package:flutterblocrestapi/repository/quote_api_client.dart';
import 'package:meta/meta.dart';

class QuoteRepository {
  final QuoteApiClient quoteApiClient;

  QuoteRepository({@required this.quoteApiClient})
      : assert(quoteApiClient != null);

  Future<Quote> fetchQuote() async {
    return await quoteApiClient.fetchQuote();
  }
}