import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterblocrestapi/repository/quote_api_client.dart';
import 'package:flutterblocrestapi/repository/quote_repository.dart';
import 'package:flutterblocrestapi/views/HomePage.dart';

import 'bloc/QuoteBloc.dart';
import 'package:http/http.dart' as http;


class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }
}

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();

  final QuoteRepository repository = QuoteRepository(
    quoteApiClient: QuoteApiClient(
      httpClient: http.Client(),
    ),
  );

  runApp(App(
    repository: repository,
  ));
}

class App extends StatelessWidget {
  final QuoteRepository repository;

  App({Key key, @required this.repository})
      : assert(repository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quote App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quote'),
        ),
        body: BlocProvider(
          create: (context) => QuoteBloc(repository: repository),
          child: HomePage(),
        ),
      ),
    );
  }
}
