import 'package:flutterblocrestapi/model/Quote.dart';
import 'package:flutterblocrestapi/repository/quote_repository.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'quote_event.dart';
import 'quote_state.dart';

class QuoteBloc extends Bloc<QuoteEvent, QuoteState> {
  final QuoteRepository repository;

  QuoteBloc({@required this.repository}) : assert(repository != null);

  @override
  QuoteState get initialState => QuoteEmpty();

  @override
  Stream<QuoteState> mapEventToState(QuoteEvent event) async* {
    if (event is FetchQuote) {
      yield QuoteLoading();
      try {
        final Quote quote = await repository.fetchQuote();
        yield QuoteLoaded(quote: quote);
      } catch (err) {
        print("error start");
        print(err);
        print("error end");
        yield QuoteError();
      }
    }
  }
}